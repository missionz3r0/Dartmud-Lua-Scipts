
registerAnonymousEventHandler("movementEvent", "Handlers.movementHandler")
  local movementListeners = {}
  function Handlers.addMovementListener(listenerName, functionToAdd)
    movementListeners[listenerName] = functionToAdd
  end

  function Handlers.removeMovementListener(listenerName)
    movementListeners[listenerName] = nil
  end

  function Handlers.movementHandler(event, movement)
    for l,v in pairs(movementListeners) do
      v(movement)
    end
  end
