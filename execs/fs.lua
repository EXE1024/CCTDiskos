local args = {...}
local command = args[1]
local name = args[2]
local content = args[3]

if #args == 2 then
    if command == "del" then
        if fs.exists(name) then
            fs.delete(name)
        else
            print("It does not exist")
        end
    elseif command == "mkdir" then
        fs.makeDir(name)
    elseif command == "ls" then
        content = fs.list(name)
        for _, data in ipairs(content) do
            if fs.isDir(data) then
                print(data.."/")
            else
                print(data)
            end
        end
    elseif command == "mkfile" then
        fs.open(name, "w").close()
    elseif command == "catwrite" then
        if fs.exists(name) then
            local file = fs.open(name, "a")
            file.writeLine(content)
            file.close()
        end
    end
end
