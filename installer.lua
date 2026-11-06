local monitor = peripheral.wrap("top")
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

    shell.run("wget","https://raw.githubusercontent.com/EXE1024/CCTDiskos/refs/heads/main/startup.lua", "startup")
    shell.run("mkdir","execs")
    shell.run("cd","execs")
    shell.run("wget","https://raw.githubusercontent.com/EXE1024/CCTDiskos/refs/heads/main/execs/diskos.lua","diskos.lua")
    shell.run("wget","https://raw.githubusercontent.com/EXE1024/CCTDiskos/refs/heads/main/execs/fs.lua","fs.lua")
    monitor.setTextColor(colors.lime)
    print("Rebooting...")

    os.reboot()
end
installer()
