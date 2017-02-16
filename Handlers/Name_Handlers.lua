registerAnonymousEventHandler("nameEvent", "Handlers.nameEventHandler")

local nameEventListeners = {}

function Handlers.addnameEventListener(listenerName, functionToAdd)
  nameEventListeners[listenerName] = functionToAdd
end

function Handlers.removenameEventListener(listenerName)
  nameEventListeners[listenerName] = nil
end

function Handlers.nameEventHandler(name)
  for l,v in pairs(nameEventListeners) do
    v(name)
  end
end
