I created this config for my own use but feel free to copy.
I do not feel like learning a whole new language just to use an editor and treesitter dont' work as smooth with Windows. So I will stick to simple init.vim until I move to Linux. Which considering my work, I probably will not.

To do:

1. install `Ripgrep`

2. install `Chocolatey`

POWERSHELL:

```ps1
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
```
`choco install mingw`


3. Install Sep
`choco install sed`

4. When all is installed, update ` ..\nvim-data\lua\url-open\handlers.lua`
The original code for some reason does not detect Windows.
Probably old Windows. So I updated it.

```lua
M.system_open_url = function(user_opts, url)
    if url then
        local open_app = user_opts.open_app
        if open_app == "default" or open_app == "" then
            if vim.fn.has('win32') == 1 then
                M.open_url_with_app({ "explorer" }, url)
            elseif vim.loop.os_uname().sysname == "Linux" then
                M.open_url_with_app({ "xdg-open", "gvfs-open", "gnome-open", "wslview" }, url)
            elseif vim.loop.os_uname().sysname == "Darwin" then
                M.open_url_with_app({ "open" }, url)
            else
                require("url-open.modules.logger").error("Unknown operating system")
            end
        else
            M.open_url_with_app({ open_app }, url)
        end
    else
        require("url-open.modules.logger").error("No URL found")
    end
end
```
