registerAnonymousEventHandler("nameEvent", "Handlers.nameHandler")
local nameListeners = {}

function Handlers.addNameListener(listenerName, functionToAdd)
  nameListeners[listenerName] = functionToAdd
end

function Handlers.removeNameListener(listenerName)
  nameListeners[listenerName] = nil
end

function Handlers.nameHandler(event, name)
  for l,v in pairs(nameListeners) do
    v(name)
  end
end
