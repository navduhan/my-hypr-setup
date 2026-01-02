#!/bin/bash
# Check if jupytext is runnable via the neovim python host

PYTHON_HOST="/home/naveen/.neovim-venv/bin/python"

echo "Checking python host: $PYTHON_HOST"
$PYTHON_HOST --version

echo "Checking jupytext module..."
$PYTHON_HOST -m jupytext --version

echo "Checking jupytext command..."
/home/naveen/.neovim-venv/bin/jupytext --version

echo "If this script prints versions, then the CLI tools are present."
