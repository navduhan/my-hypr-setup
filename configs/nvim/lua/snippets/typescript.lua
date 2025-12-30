local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

return {
  -- Console log
  s("cl", {
    t("console.log("), i(1), t(");"),
  }),

  -- Function (arrow component)
  s("fn", {
    t("const "), i(1, "name"), t(" = ("), i(2, "args"), t(") => {"),
    t({"", "\t"}), i(0),
    t({"", "};"}),
  }),

  -- Async function
  s("af", {
    t("const "), i(1, "name"), t(" = async ("), i(2, "args"), t(") => {"),
    t({"", "\ttry {"}),
    t({"", "\t\t"}), i(0),
    t({"", "\t} catch (error) {"}),
    t({"", "\t\tconsole.error(error);"}),
    t({"", "\t}"}),
    t({"", "};"}),
  }),

  -- React Functional Component
  s("rafc", {
    t("import React from 'react';"),
    t({"", ""}),
    t("export const "), i(1, "ComponentName"), t(" = ({ "), i(2, "props"), t(" }) => {"),
    t({"", "\treturn ("}),
    t({"", "\t\t<div>"}),
    t({"", "\t\t\t"}), i(0),
    t({"", "\t\t</div>"}),
    t({"", "\t);"}),
    t({"", "};"}),
  }),

  -- useState Hook
  s("us", {
    t("const ["), i(1, "state"), t(", set"), ls.f(function(args)
      return args[1][1]:gsub("^%l", string.upper)
    end, {1}), t("] = useState("), i(2, "initialState"), t(");"),
  }),

  -- useEffect Hook
  s("ue", {
    t("useEffect(() => {"),
    t({"", "\t"}), i(1),
    t({"", "}, ["), i(2, "deps"), t("]);"),
  }),

  -- Promise
  s("prom", {
    t("new Promise((resolve, reject) => {"),
    t({"", "\t"}), i(0),
    t({"", "});"}),
  }),

  -- Map
  s("map", {
    i(1, "array"), t(".map(("), i(2, "item"), t(") => ("),
    t({"", "\t"}), i(0),
    t({"", "));"}),
  }),

  -- Interface
  s("if", {
    t("interface "), i(1, "InterfaceName"), t(" {"),
    t({"", "\t"}), i(0),
    t({"", "}"}),
  }),

  -- Type
  s("type", {
    t("type "), i(1, "TypeName"), t(" = {"),
    t({"", "\t"}), i(0),
    t({"", "};"}),
  }),
}, {
  -- autosnippets
}
