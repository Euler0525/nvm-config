local status, nvim_tree = pcall(require, "nvim-tree")
if not status then
    vim.notify("nvim-tree not found!")
  return
end

-- 列表操作快捷键
local list_keys = require('keybindings').nvimTreeList
nvim_tree.setup({
    -- 不显示 git 状态图标
    git = {
        enable = true,
    },
    -- project plugin
    update_cwd = true,
    update_focused_file = {
        enable = true,
        update_cwd = true,
    },
    -- 隐藏 .文件 和 node_modules 文件夹
    filters = {
        dotfiles = true,
        custom = { 'node_modules' },
    },
    view = {
        -- 宽度
        width = 30,
        -- 位置
        side = 'left',
        -- 隐藏根目录
        -- hide_root_folder = false,
        -- 自定义列表中快捷键
        --mappings = {
        --    custom_only = false,
        --    list = list_keys,
        --},
        -- 不显示行数
        number = false,
        relativenumber = false,
        -- 显示图标
        signcolumn = 'yes',
    },
    actions = {
        open_file = {
            -- 首次打开大小适配
            resize_window = true,
            -- 打开文件时关闭
            quit_on_open = true,
        },
    },
    system_open = {
        cmd = 'wsl-open',  -- for WSL
    },
})
-- 自动关闭
vim.cmd([[
  autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
]])
