-- ═══════════════════════════════════════════════════════════════
--  imperium.lua — Imperium Gothic colorscheme for Neovim
--  Palette: уголь · пергамент · золото · кармин · вердин
--  The Emperor Protects.
-- ═══════════════════════════════════════════════════════════════

local c = {
  bg        = '#0B0907',
  bg_dim    = '#15110B',
  bg_visual = '#2A241A',
  bg_line   = '#17120B',

  fg        = '#E6D8B8',
  fg_dim    = '#B8AC8F',
  fg_dark   = '#D9CFB8',
  comment   = '#55483A',
  line_nr   = '#3A3226',

  gold      = '#C9A227',
  gold_b    = '#E0B542',
  crimson   = '#B3242D',
  crimson_b = '#D4535C',
  verdigris = '#5E8B8B',
  verdigris_b = '#7FB0B0',
  steel     = '#6E87A8',
  steel_b   = '#8FAABF',
  purple    = '#A97BA0',
  olive     = '#98A65C',
  border    = '#C9A227',
}

local hi = function(name, opts)
  vim.api.nvim_set_hl(0, name, opts)
end

-- ───── Базовые ─────
hi('Normal',        { fg = c.fg,      bg = c.bg })
hi('NormalFloat',   { fg = c.fg,      bg = c.bg_dim })
hi('FloatBorder',   { fg = c.border,  bg = c.bg_dim })
hi('FloatTitle',    { fg = c.gold_b,  bg = c.bg_dim, bold = true })
hi('Cursor',        { fg = c.bg,      bg = c.gold_b })
hi('CursorLine',    { bg = c.bg_line })
hi('CursorColumn',  { bg = c.bg_line })
hi('Visual',        { bg = c.bg_visual })
hi('VisualNOS',     { bg = c.bg_visual })
hi('Search',        { fg = c.bg,      bg = c.gold_b, bold = true })
hi('IncSearch',     { fg = c.bg,      bg = c.crimson, bold = true })
hi('Substitute',    { fg = c.bg,      bg = c.crimson })
hi('MatchParen',    { fg = c.gold_b,  bg = c.bg_visual, bold = true })
hi('LineNr',        { fg = c.line_nr })
hi('CursorLineNr',  { fg = c.gold })
hi('CursorLineFold',{ fg = c.gold })
hi('WinSeparator',  { fg = c.border,  bg = c.bg })
hi('VertSplit',     { fg = c.border,  bg = c.bg })
hi('ColorColumn',   { bg = c.bg_line })
hi('Conceal',       { fg = c.comment })
hi('NonText',       { fg = c.comment })
hi('Whitespace',    { fg = c.line_nr })
hi('EndOfBuffer',   { fg = c.bg_dim })

-- ───── Синтаксис (legacy) ─────
hi('Comment',    { fg = c.comment, italic = true })
hi('String',     { fg = c.gold })
hi('Character',  { fg = c.gold })
hi('Number',     { fg = c.steel_b })
hi('Boolean',    { fg = c.crimson_b })
hi('Float',      { fg = c.steel_b })
hi('Constant',   { fg = c.fg_dark, bold = true })
hi('Identifier', { fg = c.fg })
hi('Function',   { fg = c.gold_b })
hi('Statement',  { fg = c.crimson_b })
hi('Conditional',{ fg = c.crimson_b })
hi('Repeat',     { fg = c.crimson_b })
hi('Label',      { fg = c.crimson_b })
hi('Operator',   { fg = c.fg_dim })
hi('Keyword',    { fg = c.crimson_b, bold = true })
hi('Exception',  { fg = c.crimson_b, bold = true })
hi('PreProc',    { fg = c.purple })
hi('Include',    { fg = c.purple })
hi('Define',     { fg = c.purple })
hi('Macro',      { fg = c.purple, italic = true })
hi('Type',       { fg = c.verdigris_b })
hi('StorageClass',{ fg = c.verdigris })
hi('Structure',  { fg = c.verdigris_b })
hi('Typedef',    { fg = c.verdigris })
hi('Special',    { fg = c.gold_b })
hi('SpecialChar',{ fg = c.crimson_b })
hi('Tag',        { fg = c.gold })
hi('Delimiter',  { fg = c.fg_dim })
hi('SpecialComment', { fg = c.verdigris, italic = true })
hi('Debug',      { fg = c.crimson_b })
hi('Underlined', { underline = true })
hi('Error',      { fg = c.crimson_b, bold = true })
hi('Todo',       { fg = c.gold, bg = c.crimson, bold = true })

-- ───── Treesitter ─────
hi('@comment',        { link = 'Comment' })
hi('@string',         { link = 'String' })
hi('@number',         { link = 'Number' })
hi('@boolean',        { link = 'Boolean' })
hi('@constant',       { link = 'Constant' })
hi('@constant.builtin', { link = 'Number' })
hi('@function',       { fg = c.gold_b })
hi('@function.call',  { fg = c.gold })
hi('@function.builtin',{ fg = c.gold_b, italic = true })
hi('@method',         { link = '@function' })
hi('@keyword',        { link = 'Keyword' })
hi('@keyword.operator', { fg = c.fg_dim })
hi('@operator',       { fg = c.fg_dim })
hi('@type',           { fg = c.verdigris_b })
hi('@type.builtin',   { fg = c.verdigris })
hi('@variable',       { fg = c.fg })
hi('@variable.builtin',{ fg = c.verdigris, italic = true })
hi('@property',       { fg = c.fg_dark })
hi('@field',          { fg = c.fg_dark })
hi('@parameter',      { fg = c.fg_dim, italic = true })
hi('@punctuation.bracket', { fg = c.fg_dim })
hi('@punctuation.delimiter', { fg = c.fg_dim })
hi('@tag',            { fg = c.crimson_b })
hi('@tag.attribute',  { fg = c.gold })
hi('@label',          { link = 'Label' })
hi('@include',        { link = 'Include' })
hi('@constructor',    { fg = c.verdigris })
hi('@comment.todo',   { link = 'Todo' })

-- ───── LSP / диагностика ─────
hi('DiagnosticError', { fg = c.crimson_b })
hi('DiagnosticWarn',  { fg = c.gold_b })
hi('DiagnosticInfo',  { fg = c.steel_b })
hi('DiagnosticHint',  { fg = c.verdigris_b })
hi('DiagnosticUnderlineError', { sp = c.crimson_b, undercurl = true })
hi('DiagnosticUnderlineWarn',  { sp = c.gold_b, undercurl = true })
hi('DiagnosticUnderlineInfo',  { sp = c.steel_b, undercurl = true })
hi('DiagnosticUnderlineHint',  { sp = c.verdigris_b, undercurl = true })
hi('LspReferenceText',  { bg = c.bg_visual })
hi('LspReferenceRead',  { bg = c.bg_visual })
hi('LspReferenceWrite', { bg = c.bg_visual, bold = true })

-- ───── UI-виджеты ─────
hi('StatusLine',   { fg = c.gold,   bg = c.bg_dim })
hi('StatusLineNC', { fg = c.comment, bg = c.bg_dim })
hi('Pmenu',        { fg = c.fg,     bg = c.bg_dim })
hi('PmenuSel',     { fg = c.gold_b, bg = '#8C1F28', bold = true })
hi('PmenuSbar',    { bg = c.bg_dim })
hi('PmenuThumb',   { bg = c.gold })
hi('WildMenu',     { fg = c.bg,     bg = c.gold_b })
hi('Question',     { fg = c.gold })
hi('MoreMsg',      { fg = c.verdigris_b })
hi('ModeMsg',      { fg = c.gold })
hi('Title',        { fg = c.gold_b, bold = true })
hi('Directory',    { fg = c.steel_b })
hi('SpecialKey',   { fg = c.comment })
hi('SignColumn',   { bg = c.bg })

-- ───── mini.statusline в стиле Империума ─────
hi('MiniStatuslineModeNormal',  { fg = c.bg, bg = c.gold_b, bold = true })
hi('MiniStatuslineModeInsert',  { fg = c.fg, bg = c.crimson, bold = true })
hi('MiniStatuslineModeVisual',  { fg = c.bg, bg = c.verdigris_b, bold = true })
hi('MiniStatuslineModeReplace', { fg = c.bg, bg = c.purple, bold = true })
hi('MiniStatuslineModeCommand', { fg = c.fg, bg = c.steel, bold = true })
hi('MiniStatuslineModeOther',   { fg = c.fg, bg = c.verdigris, bold = true })
hi('MiniStatuslineDevinfo',     { fg = c.fg_dim, bg = c.bg_visual })
hi('MiniStatuslineFilename',    { fg = c.fg_dim, bg = c.bg_dim })
hi('MiniStatuslineFileinfo',    { fg = c.fg_dim, bg = c.bg_dim })
hi('MiniStatuslineInactive',    { fg = c.comment, bg = c.bg_dim })

-- gitsigns
hi('GitSignsAdd',    { fg = c.olive })
hi('GitSignsChange', { fg = c.gold })
hi('GitSignsDelete', { fg = c.crimson_b })

vim.g.colors_name = 'imperium'
