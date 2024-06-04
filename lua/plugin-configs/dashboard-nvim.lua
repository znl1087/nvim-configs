local status, db = pcall(require, "dashboard")
if not status then
    ---@diagnostic disable-next-line: param-type-mismatch
    vim.notify("没有找到 dashboard", "error")
    return
end
-- db.session_directory = vim.fn.stdpath("data") .. "/vimSession"
local sharePath = vim.fn.stdpath('config')
local dataPath = vim.fn.stdpath('data')
local luaPath = sharePath .. "/lua"
local keymapPath = luaPath .. "/keymap.lua"
local projectPath = dataPath .. "/project_nvim/project_history"
if vim.loop.os_uname().sysname == "Windows" then
    luaPath = sharePath .. "\\lua"
    keymapPath = luaPath .. "\\keymap.lua"
    projectPath = dataPath .. "\\project_nvim\\project_history"
end
-- Example: Close NvimTree buffer before auto-saving the current session
-- local autocmd = vim.api.nvim_create_autocmd
-- autocmd("User", {
-- 	pattern = "DBSessionSavePre",
-- 	callback = function()
-- 		pcall(vim.cmd, "NvimTreeClose")
-- 	end,
-- })
db.session_auto_save_on_exit = false

local lazy_status = require("lazy").stats()

local function generate_lazy_status()
    local startuptime = lazy_status.startuptime
    local count = lazy_status.count
    local loaded = lazy_status.loaded
    local load_percentage = (loaded / count) * 100
    local footer = "Lazy.nvim loaded " .. loaded .. "/" .. count
    return footer
end

local ascii = require("ascii")
local lazy_footer = generate_lazy_status()

db.custom_footer = {
    lazy_footer
}
db.custom_center = {
    {
        icon = "🗓️  ",
        desc = "Projects                            ",
        action = "Telescope projects"
    },
    {
        -- icon = "📎  ",
        icon = "📝  ",
        desc = "Work Space                          ",
        -- action = "exe 'normal melloworld'",
        action = "Telescope xray23 list"
    },
    {
        -- icon = "📎  ",
        icon = "📺  ",
        desc = "Recently files                      ",
        action = "Telescope oldfiles"
    },
    {
        icon = "🔍️  ",
        desc = "Find file                           ",
        action = "Telescope find_files"
    },
    {
        icon = "📄  ",
        desc = "New file                           ",
        --  NOTE: enew is vim command to create new file
        action = "enew" -- enew
    },
    {
        -- icon = "📑  ",
        icon = "🕹️  ",
        desc = "Edit keybindings                    ",
        action = "edit " .. keymapPath
    },
    {
        icon = "📻  ",
        desc = "Edit Projects                       ",
        action = "edit " .. projectPath
    }
    -- {
    --   icon = "  ",
    --   desc = "Edit .bashrc                        ",
    --   action = "edit ~/.bashrc",
    -- },
    -- {
    --   icon = "  ",
    --   desc = "Change colorscheme                  ",
    --   action = "ChangeColorScheme",
    -- },
    -- {
    --   icon = "  ",
    --   desc = "Edit init.lua                       ",
    --   action = "edit ~/.config/nvim/init.lua",
    -- },
    -- {
    --   icon = "  ",
    --   desc = "Find file                           ",
    --   action = "Telescope find_files",
    -- },
    -- {
    --   icon = "  ",
    --   desc = "Find text                           ",
    --   action = "Telescopecope live_grep",
    -- },
}

-- db.custom_header = {
--   [[]],
--   [[]],
--   [[███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗]],
--   [[████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║]],
--   [[██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║]],
--   [[██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║]],
--   [[██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║]],
--   [[╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝]],
--   [[]],
--   [[]]
-- }
local header = ascii.get_random_global()
db.custom_header = header
-- db.custom_header = {
-- 	[[]],
-- 	[[]],
-- 	[[██╗░░██╗██╗░░░██╗░█████╗░██╗░░██╗██╗░░░██╗░█████╗░]],
-- 	[[██║░░██║██║░░░██║██╔══██╗██║░░██║██║░░░██║██╔══██╗]],
-- 	[[███████║██║░░░██║███████║███████║██║░░░██║███████║]],
-- 	[[██╔══██║██║░░░██║██╔══██║██╔══██║██║░░░██║██╔══██║]],
-- 	[[██║░░██║╚██████╔╝██║░░██║██║░░██║╚██████╔╝██║░░██║]],
-- 	[[╚═╝░░╚═╝░╚═════╝░╚═╝░░╚═╝╚═╝░░╚═╝░╚═════╝░╚═╝░░╚═╝]],
-- 	[[]],
-- 	[[]],
-- }
-- db.custom_header = {
-- 	"",
-- 	"",
-- 	"",
-- 	"",
-- 	"",
-- 	"",
-- 	[[ ███▄    █     ▒█████      ██▓    ▄████▄     ▓█████   ]],
-- 	[[ ██ ▀█   █    ▒██▒  ██▒   ▓██▒   ▒██▀ ▀█     ▓█   ▀   ]],
-- 	[[▓██  ▀█ ██▒   ▒██░  ██▒   ▒██▒   ▒▓█    ▄    ▒███     ]],
-- 	[[▓██▒  ▐▌██▒   ▒██   ██░   ░██░   ▒▓▓▄ ▄██▒   ▒▓█  ▄   ]],
-- 	[[▒██░   ▓██░   ░ ████▓▒░   ░██░   ▒ ▓███▀ ░   ░▒████▒  ]],
-- 	[[░ ▒░   ▒ ▒    ░ ▒░▒░▒░    ░▓     ░ ░▒ ▒  ░   ░░ ▒░ ░  ]],
-- 	[[░ ░░   ░ ▒░     ░ ▒ ▒░     ▒ ░     ░  ▒       ░ ░  ░  ]],
-- 	[[   ░   ░ ░    ░ ░ ░ ▒      ▒ ░   ░              ░     ]],
-- 	[[         ░        ░ ░      ░     ░ ░            ░  ░  ]],
-- 	[[                                 ░                    ]],
-- }
-- 👻 🎵 🔔 🤖 🚑 ☕ 💦 ☔
-- see more: https://fsymbols.com/
-- https://fsymbols.com/text-art/twitter/
-- db.custom_header = {
-- 	[[]],
-- 	[[▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒]],
-- 	[[▒▒▄▄▄▒▒▒█▒▒▒▒▄▒▒▒▒▒▒▒▒▒▒▄▄▄▒▒▒█▒▒▒▒▄▒▒▒▒▒▒▒▒]],
-- 	[[▒█▀█▀█▒█▀█▒▒█▀█▒▄███▄▒▒█▀█▀█▒█▀█▒▒█▀█▒▄███▄▒]],
-- 	[[░█▀█▀█░█▀██░█▀█░█▄█▄█░░█▀█▀█░█▀██░█▀█░█▄█▄█░]],
-- 	[[░█▀█▀█░█▀████▀█░█▄█▄█░░█▀█▀█░█▀████▀█░█▄█▄█░]],
-- 	[[████████▀█████████████████████▀█████████████]],
-- 	[[]],
-- }
local shortcutgroup = "Normal"

local function themeSelect(theme)
    if theme == "doom" then
        db.setup(
            {
                theme = "doom",
                config = {
                    header = db.custom_header, -- ascii text in there
                    center = db.custom_center,
                    footer = db.custom_footer
                }
            }
        )
        return "doom"
    elseif theme == "hyper" then
        db.setup(
            {
                theme = "hyper",
                config = {
                    header = db.custom_header,
                    shortcut = {
                        {
                            desc = "☕ Update",
                            group = shortcutgroup,
                            action = "PackerUpdate",
                            key = "u"
                        },
                        {
                            desc = "📑 Files",
                            group = shortcutgroup,
                            action = "Telescope oldfiles",
                            key = "f"
                        },
                        {
                            desc = "📺 Projects",
                            group = shortcutgroup,
                            action = "Telescope projects",
                            key = "p"
                        },
                        {
                            desc = "📻 Work Space",
                            group = shortcutgroup,
                            action = "Telescope xray23 list",
                            key = "s"
                        }
                    },
                    project = { limit = 2, icon = "🎵" },
                    mru = { limit = 4, icon = "🕹️" },
                    footer = {
                        "",
                        "",
                        "千里之行，始于足下                     ",
                        -- "https://xray23.ltd                     ",
                        "https://github.com/znl1087"
                    }
                }
            }
        )
        return "hyper"
    else
        return
    end
end

themeSelect("doom")
