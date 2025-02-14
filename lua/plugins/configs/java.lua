-- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
-- If you started neovim within `~/dev/xy/project-1` this would resolve to `project-1`
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = '/Users/tmoore/dev' .. project_name

-- local config = {
--   -- The command that starts the language server
--   -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
--   cmd = {
--
--     '/Users/tmoore/.sdkman/candidates/java/17.0.9-zulu/bin/java', -- or '/path/to/java17_or_newer/bin/java'
--             -- depends on if `java` is in your $PATH env variable and if it points to the right version.
--
--     '-Declipse.application=org.eclipse.jdt.ls.core.id1',
--     '-Dosgi.bundles.defaultStartLevel=4',
--     '-Declipse.product=org.eclipse.jdt.ls.core.product',
--     '-Dlog.protocol=true',
--     '-Dlog.level=ALL',
--     '-Xmx1g',
--     '--add-modules=ALL-SYSTEM',
--     '--add-opens', 'java.base/java.util=ALL-UNNAMED',
--     '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
--
--     '-jar', '/usr/local/Cellar/jdtls/1.30.1/libexec/plugins/org.eclipse.equinox.launcher.cocoa.macosx.x86_64_1.2.800.v20231003-1442.jar',
--          -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^                                       ^^^^^^^^^^^^^^
--          -- Must point to the                                                     Change this to
--          -- eclipse.jdt.ls installation                                           the actual version
--
--
--     '-configuration', "/usr/local/Cellar/jdtls/1.30.1/libexec/config_mac",
--                     -- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^        ^^^^^^
--                     -- Must point to the                      Change to one of `linux`, `win` or `mac`
--                     -- eclipse.jdt.ls installation            Depending on your system.
--
--
--     -- 💀
--     -- See `data directory configuration` section in the README
--     '-data', "/Users/tmoore/dev/gso-service",
--   },
--
--   -- 💀
--   -- This is the default if not provided, you can remove it. Or adjust as needed.
--   -- One dedicated LSP server & client will be started per unique root_dir
--   root_dir = require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew'}),
--
--   -- Here you can configure eclipse.jdt.ls specific settings
--   -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
--   -- for a list of options
--   settings = {
--     java = {
--     }
--   },
--
--   -- Language server `initializationOptions`
--   -- You need to extend the `bundles` with paths to jar files
--   -- if you want to use additional eclipse.jdt.ls plugins.
--   --
--   -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
--   --
--   -- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
--   init_options = {
--     bundles = {}
--   },
-- }

local config = {
    cmd = {'/path/to/jdt-language-server/bin/jdtls'},
    root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
}

return config
