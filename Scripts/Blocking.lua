local Blocking = {}

local sourceName = "blocking"

local isBlocked = false
local queue = {}

local function block()
  isBlocked = true
end

local function unblock()
  if(isBlocked) then
    local count = table.size(queue)
    isBlocked = false
    if count > 0 then
      echo("\nProcessing "..count.." previously queued command(s).\n")
      for i,v in ipairs(queue) do
        send(v)
      end
    end
    queue = {}
  end
end

local function onNetworkOutput(args)
  local command = args["command"]
    if isBlocked then
        echo("Queing command: '"..command.."'\n")
        table.insert(queue, command)
        denyCurrentSend()
    end
    -- these are what trigger blocking inputs
    if string.match(command, "^cast ! ") == "cast ! " or
        string.match(command, "^inscribe ") == "inscribe " or
        string.match(command, "^invoke ") == "invoke " then
        block()
    end
end

local function setup(args)
  Events.addListener("unblockEvent",sourceName,unblock)
  Events.addListener("blockEvent",sourceName,block)
  Events.addListener("sysDataSendRequestEvent",sourceName,onNetworkOutput)
end

local function unsetup(args)
  Events.removeListener("unblockEvent",sourceName)
  Events.removeListener("blockEvent",sourceName)
  Events.removeListener("sysDataSendRequestEvent",sourceName)
end

local function resetup(args)
  unsetup(args)
  setup(args)
end

Blocking = {
  setup = setup
  ,unsetup = unsetup
  ,resetup = resetup
}

return Blocking
