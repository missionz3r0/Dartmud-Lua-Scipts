registerAnonymousEventHandler("nameEvent", "Handlers.nameEventHandler")

local nameEventListeners = {}

function Handlers.addNameEventListener(listenerName, functionToAdd)
  nameEventListeners[listenerName] = functionToAdd
end

function Handlers.removeNameEventListener(listenerName)
  nameEventListeners[listenerName] = nil
end

function Handlers.nameEventHandler(name)
  for l,v in pairs(nameEventListeners) do
    v(name)
  end
end
