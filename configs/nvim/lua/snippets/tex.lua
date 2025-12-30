local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

return {
  -- Generic Environment
  s("env", {
    t("\\begin{"), i(1, "env"), t("}"),
    t({"", "\t"}), i(0),
    t({"", "\\end{"}), ls.f(function(args) return args[1][1] end, {1}), t("}"),
  }),

  -- Section
  s("sec", {
    t("\\section{"), i(1, "Title"), t("}"),
    t({"", ""}), i(0)
  }),

  -- Figure
  s("fig", {
    t("\\begin{figure}[htbp]"),
    t({"", "\t\\centering"}),
    t({"", "\t\\includegraphics[width="}), i(1, "0.8"), t("\\textwidth]{"), i(2, "filename"), t("}"),
    t({"", "\t\\caption{"}), i(3, "Caption"), t("}"),
    t({"", "\t\\label{fig:"}), i(4, "label"), t("}"),
    t({"", "\\end{figure}"}),
  }),

  -- Table
  s("tab", {
    t("\\begin{table}[htbp]"),
    t({"", "\t\\centering"}),
    t({"", "\t\\caption{"}), i(1, "Caption"), t("}"),
    t({"", "\t\\label{tab:"}), i(2, "label"), t("}"),
    t({"", "\t\\begin{tabular}{"}), i(3, "c c c"), t("}"),
    t({"", "\t\t\\toprule"}),
    t({"", "\t\t"}), i(4, "Header 1 & Header 2 & Header 3"), t(" \\\\"),
    t({"", "\t\t\\midrule"}),
    t({"", "\t\t"}), i(0),
    t({"", "\t\t\\bottomrule"}),
    t({"", "\t\\end{tabular}"}),
    t({"", "\\end{table}"}),
  }),

  -- Enumerate
  s("enum", {
    t("\\begin{enumerate}"),
    t({"", "\t\\item "}), i(0),
    t({"", "\\end{enumerate}"}),
  }),

  -- Itemize
  s("item", {
    t("\\begin{itemize}"),
    t({"", "\t\\item "}), i(0),
    t({"", "\\end{itemize}"}),
  }),

  -- Equation
  s("eq", {
    t("\\begin{equation}"),
    t({"", "\t"}), i(0),
    t({"", "\t\\label{eq:"}), i(1, "label"), t("}"),
    t({"", "\\end{equation}"}),
  }),

  -- Align
  s("aln", {
    t("\\begin{align}"),
    t({"", "\t"}), i(0),
    t({"", "\\end{align}"}),
  }),

  -- Bold
  s("bf", {
    t("\\textbf{"), i(1, "text"), t("}"),
  }),

  -- Italic
  s("it", {
    t("\\textit{"), i(1, "text"), t("}"),
  }),

  -- Hyperref
  s("href", {
    t("\\href{"), i(1, "url"), t("}{"), i(2, "text"), t("}"),
  }),
}, {
  -- autosnippets
}
