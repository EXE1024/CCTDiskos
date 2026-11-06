local monitor = peripheral.wrap("top")
local wget = {"wget https://raw.githubusercontent.com/EXE1024/CCTDiskos/refs/heads/main/startup.lua startup.lua", "mkdir execs", "cd execs", "wget https://raw.githubusercontent.com/EXE1024/CCTDiskos/refs/heads/main/execs/diskos.lua diskos.lua", "rm rom"}

if monitor then
    term.redirect(monitor)
    monitor.clear()
    monitor.setCursorPos(1,1)
    monitor.setTextColor(colors.white)
    table.insert(drivers.started, "monitor")

    print("Monitor driver successfully started")
end

local function installer()
    monitor.setTextColor(colors.cyan)
    print("Installing...")

    for wgets in ipairs(wget) do
        shell.run(wgets)
    end

    monitor.setTextColor(colors.lime)
    print("Rebooting...")

    os.reboot
end
