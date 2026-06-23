---@brief
---
--- https://github.com/ltex-plus/ltex-ls-plus
---
--- LTeX Language Server: LSP language server for LanguageTool 🔍✔️ with support for LaTeX 🎓, Markdown 📝, and others
---
--- To install, download the latest [release](https://github.com/ltex-plus/ltex-ls-plus) and ensure `ltex-ls-plus` is on your path.
---
--- This server accepts configuration via the `settings` key.
---
--- ```lua
---   settings = {
---     ltex = {
---       language = "en-GB",
---     },
---   },
--- ```
---
--- To support org files or R sweave, users can define a custom filetype autocommand (or use a plugin which defines these filetypes):
---
--- ```lua
--- vim.cmd [[ autocmd BufRead,BufNewFile *.org set filetype=org ]]
--- ```

local language_id_mapping = {
  bib = "bibtex",
  pandoc = "markdown",
  plaintex = "tex",
  rst = "restructuredtext",
  tex = "latex",
  text = "plaintext",
}

---@type vim.lsp.Config
return {
  cmd = { "ltex-ls-plus" },
  filetypes = {
    "bib",
    "gitcommit",
    "html",
    "markdown",
    "pandoc",
    "plaintex",
    "mdx",
    "python",
    "rmd",
    "rst",
    "tex",
    "text",
    "xhtml",
  },
  root_markers = { ".git" },
  get_language_id = function(_, filetype) return language_id_mapping[filetype] or filetype end,
  settings = {
    ltex = {
      language = "en-US",
      additionalRules = {
        enablePicky = true,
      },
      enabled = {
        "bib",
        "gitcommit",
        "html",
        "markdown",
        "pandoc",
        "plaintex",
        "rmd",
        "rst",
        "tex",
        "latex",
        "text",
        "xhtml",
      },
    },
  },
}
