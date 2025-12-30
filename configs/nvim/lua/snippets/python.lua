local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

return {
  -- Main execution block
  s("main", {
    t('if __name__ == "__main__":'),
    t({"", "\t"}),
    i(0),
  }),

  -- Print statement
  s("pr", {
    t("print("),
    i(1),
    t(")"),
  }),

  -- Function definition
  s("def", {
    t("def "), i(1, "function_name"), t("("), i(2, "args"), t("):"),
    t({"", "\t\"\"\""}), i(3, "Docstring"), t({"\"\"\"", "\t"}),
    i(0),
  }),

  -- Class definition
  s("class", {
    t("class "), i(1, "ClassName"), t(":"),
    t({"", "\t\"\"\""}), i(2, "Docstring"), t({"\"\"\"", ""}),
    t({"", "\tdef __init__(self, "}), i(3, "args"), t("):"),
    t({"", "\t\t"}), i(0),
  }),

  -- Try/Except block
  s("try", {
    t("try:"),
    t({"", "\t"}), i(1),
    t({"", "except "}), i(2, "Exception"), t(" as "), i(3, "e"), t(":"),
    t({"", "\t"}), i(4, "pass"),
  }),

  -- If/Elif/Else
  s("if", {
    t("if "), i(1, "condition"), t(":"),
    t({"", "\t"}), i(2, "pass"),
    t({"", "elif "}), i(3, "condition"), t(":"),
    t({"", "\t"}), i(4, "pass"),
    t({"", "else:"}),
    t({"", "\t"}), i(0),
  }),

  -- For loop
  s("for", {
    t("for "), i(1, "item"), t(" in "), i(2, "iterable"), t(":"),
    t({"", "\t"}), i(0),
  }),

  -- With context manager
  s("with", {
    t("with "), i(1, "expression"), t(" as "), i(2, "variable"), t(":"),
    t({"", "\t"}), i(0),
  }),

  -- Lambda
  s("ld", {
    t("lambda "), i(1, "args"), t(": "), i(0),
  }),
}, {
  -- autosnippets
}
