
registerAnonymousEventHandler("hungerEvent", "Handlers.hungerHandler")
  local hungerListeners = {}
  function Handlers.addHungerListener(listenerName, functionToAdd)
    hungerListeners[listenerName] = functionToAdd
  end

  function Handlers.removeHungerListener(listenerName)
    hungerListeners[listenerName] = nil
  end

  function Handlers.hungerHandler(event, hunger)
    for l,v in pairs(hungerListeners) do
      v(hunger)
    end
  end
