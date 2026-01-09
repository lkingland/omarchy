-- Onsen syntax highlight groups
-- Base Vim syntax groups

local M = {}

function M.get(c)
  return {
    -- Comments
    Comment = { fg = c.comment, italic = true },

    -- Constants
    Constant = { fg = c.green_bright },
    String = { fg = c.white },
    Character = { fg = c.white },
    Number = { fg = c.green_bright },
    Boolean = { fg = c.green_bright },
    Float = { fg = c.green_bright },

    -- Identifiers
    Identifier = { fg = c.fg },
    Function = { fg = c.green },

    -- Statements
    Statement = { fg = c.blue },
    Conditional = { fg = c.blue },
    Repeat = { fg = c.blue },
    Label = { fg = c.blue },
    Operator = { fg = c.fg_dark },
    Keyword = { fg = c.blue },
    Exception = { fg = c.blue },

    -- Preprocessor
    PreProc = { fg = c.blue },
    Include = { fg = c.blue },
    Define = { fg = c.blue },
    Macro = { fg = c.blue },
    PreCondit = { fg = c.blue },

    -- Types
    Type = { fg = c.cyan },
    StorageClass = { fg = c.blue },
    Structure = { fg = c.cyan },
    Typedef = { fg = c.cyan },

    -- Special
    Special = { fg = c.orange },
    SpecialChar = { fg = c.orange },
    Tag = { fg = c.green },
    Delimiter = { fg = c.grey },
    SpecialComment = { fg = c.orange },
    Debug = { fg = c.orange },

    -- Underlined
    Underlined = { underline = true },

    -- Ignore
    Ignore = { fg = c.comment },

    -- Error
    Error = { fg = c.red },

    -- Todo
    Todo = { fg = c.bg, bg = c.orange, bold = true },

    -- Go-specific
    goBlock = { fg = c.grey },
    goParen = { fg = c.grey },
    goBraces = { fg = c.grey },
  }
end

return M
