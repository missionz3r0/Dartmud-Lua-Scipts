registerAnonymousEventHandler("encumbranceEvent", "Handlers.encumbranceEventHandler")

local encumbranceEventListeners = {}

function Handlers.addencumbranceEventListener(listenerName, functionToAdd)
  encumbranceEventListeners[listenerName] = functionToAdd
end

function Handlers.removeencumbranceEventListener(listenerName)
  encumbranceEventListeners[listenerName] = nil
end

function Handlers.encumbranceEventHandler(encumberance)
  for l,v in pairs(encumbranceEventListeners) do
    v(encumberance)
  end
end
