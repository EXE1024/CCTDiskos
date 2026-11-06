local version = "gitextern 1.0 CCTDISKOS"
local monitor = peripheral.wrap("top")
local checkup = {
    files:{"reboot.lua"}
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

local function checkup()
    local corrects = 0
    if fs.exists("disk/execs") and fs.isDir("disk/execs") then
        local files = fs.list("disk/execs")

        for _, file in ipairs(files) do
            if contains(checkup.files, file) then
                corrects += 1
            end
        end
    end 

    if len(checkup.files) == corrects:
        return true 
    end
    return false
end

checkup()