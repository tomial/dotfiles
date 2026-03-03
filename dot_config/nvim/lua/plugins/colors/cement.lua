local lush         = require('lush')
local hsl          = lush.hsl

-- ============================================
-- 基础调色板 - 混凝土/水泥质感
-- ============================================

local bg_dark      = hsl(0, 0, 10) -- 深邃混凝土
local bg           = hsl(0, 0, 16) -- 标准背景
local bg_light     = hsl(0, 0, 22) -- 悬浮面板
local bg_lighter   = hsl(0, 0, 28) -- 选中区域

local fg           = hsl(0, 0, 85) -- 主要文字
local fg_dim       = hsl(0, 0, 60) -- 次要文字
local fg_darker    = hsl(0, 0, 45) -- 弱化文字

-- ============================================
-- 强调色
-- ============================================

-- 锈红（警告/错误）
local accent_rust  = hsl(15, 45, 55)
local error_red    = hsl(5, 40, 50)

-- 铜绿（成功）
local accent_green = hsl(170, 20, 55)

-- 工业蓝（链接）
local accent_blue  = hsl(210, 25, 60)

-- 冷蓝灰（函数）
local accent_cyan  = hsl(195, 12, 72)

-- ============================================
-- 构建主题
-- ============================================

local theme        = lush(function()
  return {
    -- ========================================
    -- 通用高亮
    -- ========================================
    Normal { fg = fg, bg = bg_dark },                             -- 正常文本
    NormalFloat { fg = fg, bg = bg_light },                       -- 浮动窗口
    NormalNC { fg = fg, bg = bg_dark },                           -- 非激活窗口
    Cursor { fg = bg, bg = fg },                                  -- 光标
    CursorLine { bg = hsl(0, 0, 18) },                            -- 光标所在行
    CursorColumn { bg = hsl(0, 0, 18) },                          -- 光标所在列
    LineNr { fg = fg_darker, bg = accent_cyan.darken(90) },       -- 行号
    CursorLineNr { fg = fg_dim },                                 -- 当前 = true行号
    Folded { fg = fg_dim, bg = bg_dark.darken(50) },              -- 折叠内容
    FoldColumn { fg = fg_darker, bg = bg },                       -- 折叠列
    SignColumn { fg = fg_dim, bg = accent_blue.darken(90) },      -- 符号列
    VertSplit { fg = bg_lighter, bg = bg },                       -- 垂直分割线
    ColorColumn { bg = bg_light },                                -- 颜色列
    Whitespace { fg = fg_darker, bg = accent_blue.darken(90) },   -- 空白字符
    WinSeparator { fg = accent_blue.darken(90), bg = accent_blue.darken(90) },

    -- ========================================
    -- 菜单与补全
    -- ========================================
    Pmenu { fg = fg, bg = bg_light },          -- 补全菜单
    PmenuSel { fg = fg, bg = bg_lighter },     -- 选中项
    PmenuSbar { bg = bg },                     -- 滚动条背景
    PmenuThumb { bg = fg_darker },             -- 滚动条
    WildMenu { fg = fg, bg = bg_lighter },     -- 命令行补全

    -- ========================================
    -- 匹配高亮
    -- ========================================
    MatchParen { fg = accent_cyan, bold = true },           -- 匹配括号
    Search { fg = fg, bg = accent_green.darken(50) },       -- 搜索结果
    CurSearch { fg = fg, bg = accent_cyan.darken(20) },     -- 当前搜索结果
    IncSearch { fg = fg, bg = accent_green.darken(20) },    -- 增量搜索
    Substitute { fg = bg, bg = accent_green },              -- 替换高亮

    -- ========================================
    -- 可视模式
    -- ========================================
    Visual { fg = fg, bg = accent_cyan.darken(20) },       -- 可视模式选择
    VisualNOS { bg = bg_lighter },                         -- 可视模式（未激活）

    -- ========================================
    -- 滚动条
    -- ========================================
    Scrollbar { fg = fg_dim, bg = bg },      -- 滚动条
    ScrollbarLift { fg = fg, bg = bg_light }, -- 滚动条悬停

    -- ========================================
    -- 标题
    -- ========================================
    Title { fg = fg, bold = true },             -- 标题
    TabLine { fg = fg_dim, bg = bg_dark },      -- 标签页行
    TabLineFill { fg = fg_darker, bg = bg_dark },
    TabLineSel { fg = fg, bg = bg },

    -- ========================================
    -- 消息与状态栏
    -- ========================================
    StatusLine { fg = fg, bg = bg_dark },       -- 状态栏
    StatusLineNC { fg = fg_dim, bg = bg_dark }, -- 非激活状态栏
    Question { fg = accent_green },             -- 问题提示
    MoreMsg { fg = fg_dim },                    -- 更多消息
    ModeMsg { fg = fg },                        -- 模式消息
    MsgArea { fg = fg },                        -- 消息区域

    -- ========================================
    -- 诊断与 LSP
    -- ========================================
    Error { fg = error_red },        -- 错误
    ErrorMsg { fg = error_red, bg = bg_dark },
    WarningMsg { fg = accent_rust, bg = bg_dark },
    Hint { fg = accent_cyan },
    HintMsg { fg = accent_cyan, bg = bg_dark },
    Info { fg = fg_dim },
    InfoMsg { fg = fg_dim, bg = bg_dark },
    DiagnosticError { fg = error_red },
    DiagnosticWarn { fg = accent_rust },
    DiagnosticHint { fg = accent_cyan },
    DiagnosticInfo { fg = fg_dim },
    DiagnosticUnderlineError { fg = error_red, undercurl = true },
    DiagnosticUnderlineWarn { fg = accent_rust, undercurl = true },
    DiagnosticUnderlineHint { fg = accent_cyan, undercurl = true },
    DiagnosticUnderlineInfo { fg = fg_dim, undercurl = true },

    -- ========================================
    -- 语法高亮 - 基础
    -- ========================================
    Comment { fg = hsl(210, 8, 50), italic = true },     -- 注释
    Todo { fg = accent_rust, bg = bg_light },            -- TODO
    Special { fg = accent_cyan },                        -- 特殊字符
    SpecialChar { fg = accent_cyan },                    -- 特殊常量

    -- ========================================
    -- 语法高亮 - 标识符与变量
    -- ========================================
    Identifier { fg = fg },                -- 标识符
    Variable { fg = hsl(0, 0, 78) },       -- 变量
    Constant { fg = accent_cyan },         -- 常量
    String { fg = hsl(160, 15, 65) },      -- 字符串
    Character { fg = hsl(160, 15, 60) },   -- 字符
    Number { fg = accent_cyan },           -- 数字
    Boolean { fg = accent_cyan },          -- 布尔值
    Float { fg = accent_cyan },            -- 浮点数

    -- ========================================
    -- 语法高亮 - 声明与类型
    -- ========================================
    Function { fg = accent_cyan },     -- 函数
    Conditional { fg = accent_cyan },  -- 条件语句
    Repeat { fg = accent_cyan },       -- 循环语句
    Label { fg = accent_cyan },        -- 标签
    Operator { fg = accent_green },    -- 运算符
    Keyword { fg = accent_cyan },      -- 关键字
    Type { fg = accent_green },        -- 类型
    Typedef { fg = accent_green },     -- 类型定义
    Structure { fg = accent_green },   -- 结构体
    StorageClass { fg = accent_cyan }, -- 存储类

    -- ========================================
    -- 语法高亮 - 标记与修饰
    -- ========================================
    Tag { fg = accent_rust },         -- 标签
    Delimiter { fg = fg_dim },        -- 分隔符
    PreProc { fg = accent_cyan },     -- 预处理指令
    Include { fg = accent_cyan },     -- 包含指令
    Define { fg = accent_cyan },      -- 宏定义
    Macro { fg = accent_cyan },       -- 宏
    PreCondit { fg = accent_cyan },   -- 预处理条件

    -- ========================================
    -- NvimTree 文件浏览器
    -- ========================================
    NvimTreeNormal { fg = fg, bg = bg_dark },                       -- 普通
    NvimTreeNormalNC { fg = fg, bg = bg_dark },                     -- 非激活
    NvimTreeRootFolder { fg = fg, bold = true },                    -- 根文件夹名
    NvimTreeFolderName { fg = accent_cyan },                        -- 文件夹名
    NvimTreeOpenedFolderName { fg = accent_cyan },                  -- 打开的文件夹
    NvimTreeEmptyFolderName { fg = fg_dim },                        -- 空文件夹
    NvimTreeIndentMarker { fg = fg_darker },                        -- 缩进标记
    NvimTreeSymlink { fg = accent_blue, underline = true },         -- 符号链接
    NvimTreeFileDirty { fg = accent_rust },                         -- 已修改文件
    NvimTreeFileStaged { fg = accent_green },                       -- 已暂存文件
    NvimTreeFileNew { fg = accent_cyan },                           -- 新文件
    NvimTreeFileDeleted { fg = error_red },                         -- 已删除文件
    NvimTreeFileRenamed { fg = accent_green },                      -- 重命名文件
    NvimTreeGitDirty { fg = accent_rust },                          -- Git 脏状态
    NvimTreeGitStaged { fg = accent_green },                        -- Git 已暂存
    NvimTreeGitNew { fg = accent_cyan },                            -- Git 新文件
    NvimTreeGitDeleted { fg = error_red },                          -- Git 已删除
    NvimTreeLspDiagnosticsError { fg = error_red },                 -- LSP 错误
    NvimTreeLspDiagnosticsWarning { fg = accent_rust },             -- LSP 警告
    NvimTreeLspDiagnosticsHint { fg = accent_cyan },                -- LSP 提示
    NvimTreeLspDiagnosticsInfo { fg = fg_dim },                     -- LSP 信息
    NvimTreeSpecial { fg = accent_cyan },                           -- 特殊文件
    NvimTreeImageFile { fg = accent_cyan },                         -- 图片文件
    NvimTreeMarkdownFile { fg = accent_green },                     -- Markdown 文件
    NvimTreeExecFile { fg = accent_green },                         -- 可执行文件
    NvimTreeWindowPicker { fg = fg, bg = bg_lighter },              -- 窗口选择器
    NvimTreeCursorLine { bg = bg_lighter },                         -- 光标行
    NvimTreeSelected { fg = fg, bg = bg_lighter },                  -- 选中项
    NvimTreeOpened { fg = fg },                                     -- 已打开
    NvimTreeModified { fg = accent_rust },                          -- 已修改
  }
end)

-- lush.apply(theme)

return theme
