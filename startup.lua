local version = "gitextern 1.0 CCTDISKOS"
local monitor = peripheral.wrap("top")
local checkup = {
    execs={"diskos.lua", "fs.lua"}
}
-- Made for CC Tweaked (Minecraft Mod)

-- CHECKUP FUNCTIONS

local function split(text, sep)
    local array = {}
    local pattern = string.format("([^%s]+)", sep)
    if text = "" then
        return array
    end 
    if string.find(text, sep, 1, true) then
        for part in string.gmatch(text, pattern) do
            table.insert(array, part)
        end
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

local function shellapi(data)
    local exec = split(data, ":")
    local params = split(exec[2], ",")

    local file = "execs/"..exec[1]..".lua"
    local eargs = " "
    if fs.exists(file) then
        for _, param in ipairs(params) do
            eargs = eargs..param
        end
        shell.run(file..eargs)
    else
        print("No such a program")
    end

end

local function startup()
    drivers.init.monitor()

    local scan = check()
    if scan == false then
        fulldead()
    end

    while true do
        io.write(">")
        local data = read()
        shellapi(data)
    end
end

startup()
