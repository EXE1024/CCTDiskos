local args = {...}
local command = args[1]
local name = args[2]

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
end