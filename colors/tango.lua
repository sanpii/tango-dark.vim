local c = require 'tango.colors'.setup()

function load_syntax()
    return {
        ColorColumn = { bg = c.gray },
        Conceal = {},
        CursorColumn = 'ColorColumn',
        CursorIM = 'Cursor',
        CursorLine = 'ColorColumn',
        CursorLineNr = 'CursorLine',
        Cursor = { style = 'bold' },
        DiffAdd = { bg = c.green },
        DiffChange = { bg = c.gray },
        DiffDelete = { bg = c.light_red },
        DiffText = { bg = c.light_red },
        Directory = c.cyan,
        EndOfBuffer = c.bg,
        ErrorMsg = 'DiagnosticError',
        FoldColumn = {},
        Folded = { fg = c.yellow, bg = c.gray },
        IncSearch = { fg = c.gray, bg = c.green },
        LineNrAbove = c.gray,
        LineNrBelow = 'LineNrAbove',
        LineNr = { fg = c.purple, style = 'bold' },
        MatchParen = 'Visual',
        ModeMsg = {},
        MoreMsg = 'DiagnosticInfo',
        MsgArea = {},
        MsgSeparator = {},
        NonText = c.gray,
        Normal = { fg = c.fg, bg = c.bg },
        NormalFloat = { fg = c.fg, bg = c.gray },
        NormalNC = {},
        Pmenu = { fg = c.fg, bg = c.gray },
        PmenuSbar = { bg = c.fg },
        PmenuSel = { fg = c.gray, bg = c.fg },
        PmenuThumb = { bg = c.fg },
        Question = 'MoreMsg',
        QuickFixLine = {},
        Search = { fg = c.fg, bg = c.light_green },
        SignColumn = { fg = c.fg, bg = c.bg },
        SpecialKey = 'NonText',
        SpellBad = { style = 'undercurl', sp = c.light_red },
        SpellCap = { style = 'undercurl', sp = c.green },
        SpellLocal = {},
        SpellRare = {},
        StatusLine = { fg = c.fg, bg = c.gray },
        StatusLineNC = { fg = c.gray, bg = c.gray },
        Substitute = {},
        TabLineFill = c.gray,
        TabLineSel = { fg = c.fg, bg = c.bg, style = 'bold' },
        TabLine = 'StatusLine',
        Title = c.fg,
        VertSplit = 'LineNrAbove',
        Visual = { bg = c.purple },
        VisualNOS = {},
        WarningMsg = 'DiagnosticWarn',
        Whitespace = {},
        WildMenu = {},

        -- gui
        Menu = {},
        Scroolbar = {},
        Tooltip = {},

        -- syntax
        Comment = c.light_blue,
        Constant = c.light_red,
        String = c.light_purple,
        Character = 'String',
        Number = 'Constant',
        Boolean = 'Constant',
        Float = 'Constant',
        Identifier = c.light_green,
        Function = 'Identifier',
        Statement = 'Keyword',
        Conditional = 'Keyword',
        Repeat = 'Keyword',
        Label = 'Keyword',
        Operator = { fg = c.light_yellow, style = 'bold' },
        Keyword = { fg = c.light_yellow, style = 'bold' },
        Exception = 'Keyword',
        PreProc = { fg = c.light_red, style = 'bold' },
        Include = c.light_red,
        Define = 'PreProc',
        Macro = 'PreProc',
        PreCondit = 'Macro',
        Type = { fg = c.green, style = 'bold' },
        StorageClass = 'Type',
        Structure = 'Identifier',
        Typedef = 'Type',
        Special = c.yellow,
        SpecialChar = c.purple,
        Tag = 'Keyword',
        Delimiter = { fg = c.yellow, style = 'bold' },
        SpecialComment = c.yellow,
        Debug = c.unset,
        Underlined = { fg = c.light_blue, style = 'underline', sp = c.light_blue },
        Ignore = c.unset,
        Error = 'DiagnosticError',
        Todo = { fg = c.light_yellow, bg = c.orange, style = 'bold' },

        -- gitsigns
        GitSignsAdd = c.green,
        GitSignsDelete = c.light_red,
        GitSignsChange = c.yellow,

        -- LSP
        LspReferenceText = 'TabLineFill',
        LspReferenceRead = 'TabLineFill',
        LspReferenceWrite = 'TabLineFill',
        LspCodeLens = 'LineNr',
        LspCodeLensSeparator = {},
        LspSignatureActiveParameter = 'DiagnosticWarn',

        -- Diagnostic
        DiagnosticError = c.light_red,
        DiagnosticWarn = c.yellow,
        DiagnosticInfo = c.blue,
        DiagnosticHint = c.green,
        DiagnosticVirtualTextError = { fg = c.light_red, style = 'italic' },
        DiagnosticVirtualTextWarn = { fg = c.yellow, style = 'italic' },
        DiagnosticVirtualTextInfo = { fg = c.blue, style = 'italic' },
        DiagnosticVirtualTextHint = { fg = c.green, style = 'italic' },
        DiagnosticUnderlineError = { sp = c.light_red, style = 'undercurl' },
        DiagnosticUnderlineWarn = { sp = c.yellow, style = 'undercurl' },
        DiagnosticUnderlineInfo = { sp = c.blue, style = 'undercurl' },
        DiagnosticUnderlineHint = { sp = c.green, style = 'undercurl' },
        DiagnosticFloatingError = 'DiagnosticError',
        DiagnosticFloatingWarn = 'DiagnosticWarn',
        DiagnosticFloatingInfo = 'DiagnosticInfo',
        DiagnosticFloatingHint = 'DiagnosticHint',
        DiagnosticSignError = 'DiagnosticError',
        DiagnosticSignWarn = 'DiagnosticWarn',
        DiagnosticSignInfo = 'DiagnosticInfo',
        DiagnosticSignHint = 'DiagnosticHint',

        htmlH2 = c.light_red,
        htmlH1 = c.light_red,
    }
end

function colorscheme()
    vim.api.nvim_command('hi clear')
    if vim.fn.exists('syntax_on') then
        vim.api.nvim_command('syntax reset')
    end
    vim.o.background = 'dark'
    vim.o.termguicolors = true
    vim.g.colors_name = 'tango'
    local syntax = load_syntax()
    for group, colors in pairs(syntax) do
        if syntax[colors] then
            link(group, colors)
        else
            highlight(group, colors)
        end
    end
end

function link(group, color)
    vim.api.nvim_command('highlight! link '..group..' '..color)
end

function highlight(group, color)
    local style = 'gui=NONE'
    local fg = 'guifg=NONE'
    local bg = 'guibg=NONE'
    local sp = ''

    if type(color) == "string" then
        fg = 'guifg=' .. color
    else
        if color.style then
            style = 'gui=' .. color.style
        end
        if color.fg then
            fg = 'guifg=' .. color.fg
        end
        if color.bg then
            bg = 'guibg=' .. color.bg
        end
        if color.sp then
            sp = 'guisp=' .. color.sp
        end
    end

    vim.api.nvim_command(
        'highlight '..group..' '..style..' '..fg..' '..bg..' '..sp
    )
end

colorscheme()
