
registerAnonymousEventHandler("movementEvent", "Handlers.movementEventHandler")
  local movementEventListeners = {}
  function Handlers.addmovementEventListener(listenerName, functionToAdd)
    movementEventListeners[listenerName] = functionToAdd
  end

  function Handlers.removemovementEventListener(listenerName)
    movementEventListeners[listenerName] = nil
  end

  function Handlers.movementEventHandler(event, movement)
    for l,v in pairs(movementEventListeners) do
      v(movement)
    end
  end
