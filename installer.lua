local monitor = peripheral.wrap("top")
local wget = {"https://raw.githubusercontent.com/EXE1024/CCTDiskos/refs/heads/main/startup.lua", "mkdir execs", "cd execs", "https://raw.githubusercontent.com/EXE1024/CCTDiskos/refs/heads/main/execs/diskos.lua"}

if monitor then
    term.redirect(monitor)
    monitor.clear()
    monitor.setCursorPos(1,1)
    monitor.setTextColor(colors.white)

    print("Monitor driver successfully started")
end

local function installer()
    monitor.setTextColor(colors.cyan)
    print("Installing...")

    for _, wgets in ipairs(wget) do
        shell.run(wgets)
    end

    monitor.setTextColor(colors.lime)
    print("Rebooting...")

    os.reboot()
end
installer()
