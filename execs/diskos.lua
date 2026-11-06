local args = {...}
local command = args[1]
local version = "gitextern 1.0 CCTDISKOS"

if command == "version" then
    print(version)
elseif command == "hello" then
    print("Hello World!")
elseif command == "shutdown" then
    os.shutdown()
elseif command == "reboot" then
    os.reboot()
else 
    print("Command does not exist")
end
