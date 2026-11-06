
local version = "gitextern 1.0 CCTDISKOS"
local monitor = peripheral.wrap("top")
local checkup = {
    execs={"reboot.lua"}
}
-- Made for CC Tweaked (Minecraft Mod)

-- CHECKUP FUNCTIONS

local function contains(list, word) 
    for _, check in ipairs(list) do
        if word == check then
            return true
        end
    end
    return false
end

local function check()
    local corrects = 0
    if fs.exists("execs/") and fs.isDir("execs/") then
        local files = fs.list("execs/")

        for _, file in ipairs(files) do
            if contains(checkup.execs, file) then
                corrects += 1
            end
        end
    end 

    if #checkup.execs == corrects then
        return true 
    end
    return false
end

-- ERROR FUNCTIONS

local function fulldead()
    print("The system is completely damaged; please reinstall the system carefully to fix this error")
    print("█████████████████████████████████████████████████████████████████████████████████████████")
    os.shutdown()

-- INIT FUNCTIONS

local drivers = {
    started = {}
    init = {}
}

local function drivers.init.monitor() 
    if monitor then
        term.redirect(monitor)
        monitor.clear()
        monitor.setCursorPos(1,1)
        monitor.setTextColor(colors.white)
        table.insert(drivers.started, "monitor")

local function startup()
    local scan = check()
    if scan == false then
        fulldead()
    end

    drivers.init.monitor()
    print("Drivers: "..drivers)
end
