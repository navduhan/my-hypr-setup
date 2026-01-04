#!/bin/bash
# Script to automatically register ALL Conda environments as Jupyter kernels
# This allows Molten to see all your environments.

# 1. Source Conda
if [ -f "$HOME/miniconda3/etc/profile.d/conda.sh" ]; then
    source "$HOME/miniconda3/etc/profile.d/conda.sh"
elif [ -f "$HOME/anaconda3/etc/profile.d/conda.sh" ]; then
    source "$HOME/anaconda3/etc/profile.d/conda.sh"
elif [ -f "/opt/conda/etc/profile.d/conda.sh" ]; then
    source "/opt/conda/etc/profile.d/conda.sh"
fi

if ! command -v conda &> /dev/null; then
    echo "Error: Conda not found."
    exit 1
fi

echo "Scanning Conda environments..."

# Get list of environments
# We use 'conda env list' and parse it.
# The output format is: name   path
# We skip lines starting with #

# We can iterate over the names.
conda env list | grep -v "^#" | while read -r line; do
    # Split line into name and path
    # Example line: "base                 *  /home/naveen/miniconda3"
    # Example line: "myenv                   /home/naveen/miniconda3/envs/myenv"
    
    # Extract just the first word (name)
    ENV_NAME=$(echo "$line" | awk '{print $1}')
    ENV_PATH=$(echo "$line" | awk '{print $NF}') # Last field is path
    
    # If the line contains a '*', it's the active environment, ensuring we get the name right
    if [[ "$line" == *"*"* ]]; then
        # If it's the base env, sometimes it's listed weirdly, but usually just 'base'
        # If name is empty (sometimes base is just path?), handle that
        :
    fi

    # Skip if name is path (happens if unnamed env)
    if [ "$ENV_NAME" == "$ENV_PATH" ]; then
        ENV_NAME=$(basename "$ENV_PATH")
    fi

    echo "------------------------------------------------"
    echo "Found environment: $ENV_NAME"
    
    # Check if we should install ipykernel
    # We use 'conda run' to check/install without fully activating
    if ! conda run -n "$ENV_NAME" python -c "import ipykernel" &> /dev/null; then
        echo "  ipykernel not found. Installing..."
        if ! conda install -n "$ENV_NAME" -y ipykernel; then
             echo "  [ERROR] Failed to install ipykernel in '$ENV_NAME'. Skipping..."
             echo "  (This usually happens due to conflicting packages in the environment)"
             continue
        fi
    else
        echo "  ipykernel already installed."
    fi

    echo "  Registering kernel spec..."
    conda run -n "$ENV_NAME" python -m ipykernel install --user --name "$ENV_NAME" --display-name "Python ($ENV_NAME)"
    
    echo "  Done."
done

echo "------------------------------------------------"
echo "All Conda environments have been registered as kernels."
echo "Restart Neovim or run :MoltenUpdateKernels to see them."
