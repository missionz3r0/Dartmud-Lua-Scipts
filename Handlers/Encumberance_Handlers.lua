registerAnonymousEventHandler("encumbranceEvent", "Handlers.encumbranceHandler")
local encumbranceListeners = {}

function Handlers.addEncumbranceListener(listenerName, functionToAdd)
  encumbranceListeners[listenerName] = functionToAdd
end

function Handlers.removeEncumbranceListener(listenerName)
  encumbranceListeners[listenerName] = nil
end

function Handlers.encumbranceHandler(event, encumbrance)
  for l,v in pairs(encumbranceListeners) do
    v(encumberance)
  end
end
