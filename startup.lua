local version = "gitextern 1.0 CCTDISKOS"
local monitor = peripheral.wrap("top")
local checkup = {
    execs={"fs.lua"}
}
-- Made for CC Tweaked (Minecraft Mod)

-- CHECKUP FUNCTIONS

function split(text, sep)
    local array = {}
    local pattern = string.format("([^%s]+)", sep)
    
    for part in string.gmatch(text, pattern) do
        table.insert(array, part)
    end
    
    return array
end

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
                corrects = 1 + corrects
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
end

-- INIT FUNCTIONS

local drivers = {
    started = {},
    init = {}
}

function drivers.init.monitor() 
    if monitor then
        term.redirect(monitor)
        monitor.clear()
        monitor.setCursorPos(1,1)
        monitor.setTextColor(colors.white)
        table.insert(drivers.started, "monitor")

        print("Monitor driver successfully started")
    end
end

local function startup()
    drivers.init.monitor()

    local scan = check()
    if scan == false then
        fulldead()
    end
end

startup()
