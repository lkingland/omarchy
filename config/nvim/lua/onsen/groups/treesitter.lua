-- Onsen treesitter highlight groups
-- Semantic syntax highlighting via nvim-treesitter

local M = {}

function M.get(c)
  return {
    -- Misc
    ["@comment"] = { fg = c.comment },
    ["@comment.documentation"] = { fg = c.comment },
    ["@error"] = { fg = c.red },
    ["@none"] = {},
    ["@preproc"] = { fg = c.blue },
    ["@define"] = { fg = c.blue },

    -- Punctuation (dimmed to reduce noise)
    ["@punctuation.delimiter"] = { fg = c.grey },
    ["@punctuation.bracket"] = { fg = c.grey },
    ["@punctuation.special"] = { fg = c.grey },

    -- Literals
    ["@string"] = { fg = c.white },
    ["@string.documentation"] = { fg = c.white },
    ["@string.regex"] = { fg = c.fg },
    ["@string.escape"] = { fg = c.cyan },
    ["@string.special"] = { fg = c.white },
    ["@string.special.symbol"] = { fg = c.cyan },
    ["@string.special.url"] = { fg = c.blue, underline = true },
    ["@string.special.path"] = { fg = c.white },

    ["@character"] = { fg = c.white },
    ["@character.special"] = { fg = c.white },

    ["@number"] = { fg = c.green },
    ["@number.float"] = { fg = c.green },

    ["@boolean"] = { fg = c.green },

    -- Functions
    ["@function"] = { fg = c.green },
    ["@function.builtin"] = { fg = c.green },
    ["@function.call"] = { fg = c.green },
    ["@function.macro"] = { fg = c.green },
    ["@function.method"] = { fg = c.cyan },
    ["@function.method.call"] = { fg = c.cyan },

    -- Keywords
    ["@keyword"] = { fg = c.blue },
    ["@keyword.conditional"] = { fg = c.blue },
    ["@keyword.conditional.ternary"] = { fg = c.blue },
    ["@keyword.coroutine"] = { fg = c.blue },
    ["@keyword.debug"] = { fg = c.orange },
    ["@keyword.directive"] = { fg = c.blue },
    ["@keyword.directive.define"] = { fg = c.blue },
    ["@keyword.exception"] = { fg = c.blue },
    ["@keyword.function"] = { fg = c.blue },
    ["@keyword.import"] = { fg = c.blue },
    ["@keyword.modifier"] = { fg = c.blue },
    ["@keyword.operator"] = { fg = c.blue },
    ["@keyword.repeat"] = { fg = c.blue },
    ["@keyword.return"] = { fg = c.blue },
    ["@keyword.storage"] = { fg = c.blue },
    ["@keyword.type"] = { fg = c.blue },

    -- Identifiers
    ["@variable"] = { fg = c.green },
    ["@variable.builtin"] = { fg = c.green },
    ["@variable.member"] = { fg = c.cyan },
    ["@variable.parameter"] = { fg = c.green },
    ["@variable.parameter.builtin"] = { fg = c.green },

    ["@constant"] = { fg = c.green },
    ["@constant.builtin"] = { fg = c.green },
    ["@constant.macro"] = { fg = c.green },

    ["@module"] = { fg = c.green },
    ["@module.builtin"] = { fg = c.green },

    ["@label"] = { fg = c.blue },

    -- Types (italic, de-emphasized)
    ["@type"] = { fg = c.green_muted, italic = true },
    ["@type.builtin"] = { fg = c.green_muted, italic = true },
    ["@type.definition"] = { fg = c.green_muted, italic = true },
    ["@type.qualifier"] = { fg = c.blue },

    ["@attribute"] = { fg = c.orange },
    ["@attribute.builtin"] = { fg = c.orange },

    ["@property"] = { fg = c.cyan },

    -- Operators
    ["@operator"] = { fg = c.fg_dark },

    -- Tags (HTML, JSX, etc.)
    ["@tag"] = { fg = c.green },
    ["@tag.builtin"] = { fg = c.green },
    ["@tag.attribute"] = { fg = c.fg },
    ["@tag.delimiter"] = { fg = c.fg_dark },

    -- Constructor (type-related)
    ["@constructor"] = { fg = c.green_muted, italic = true },

    -- Special
    ["@annotation"] = { fg = c.orange },

    -- Markup (Markdown, etc.)
    ["@markup"] = { fg = c.fg },
    ["@markup.heading"] = { fg = c.green, bold = true },
    ["@markup.heading.1"] = { fg = c.green, bold = true },
    ["@markup.heading.2"] = { fg = c.green, bold = true },
    ["@markup.heading.3"] = { fg = c.green, bold = true },
    ["@markup.heading.4"] = { fg = c.green },
    ["@markup.heading.5"] = { fg = c.green },
    ["@markup.heading.6"] = { fg = c.green },
    ["@markup.italic"] = { italic = true },
    ["@markup.strong"] = { bold = true },
    ["@markup.strikethrough"] = { strikethrough = true },
    ["@markup.underline"] = { underline = true },
    ["@markup.quote"] = { fg = c.comment, italic = true },
    ["@markup.math"] = { fg = c.cyan },
    ["@markup.environment"] = { fg = c.orange },
    ["@markup.link"] = { fg = c.blue },
    ["@markup.link.label"] = { fg = c.blue },
    ["@markup.link.url"] = { fg = c.blue, underline = true },
    ["@markup.raw"] = { fg = c.orange },
    ["@markup.raw.block"] = { fg = c.fg },
    ["@markup.list"] = { fg = c.fg_dark },
    ["@markup.list.checked"] = { fg = c.green },
    ["@markup.list.unchecked"] = { fg = c.comment },

    -- Diff
    ["@diff.plus"] = { fg = c.git_add },
    ["@diff.minus"] = { fg = c.git_delete },
    ["@diff.delta"] = { fg = c.git_change },
  }
end

return M
