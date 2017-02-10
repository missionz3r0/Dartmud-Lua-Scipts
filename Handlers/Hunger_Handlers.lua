
registerAnonymousEventHandler("hungerEvent", "Handlers.hungerEventHandler")
  local hungerEventListeners = {}
  function Handlers.addhungerEventListener(listenerName, functionToAdd)
    hungerEventListeners[listenerName] = functionToAdd
  end

  function Handlers.removehungerEventListener(listenerName)
    hungerEventListeners[listenerName] = nil
  end

  function Handlers.hungerEventHandler(hunger)
    for l,v in pairs(hungerEventListeners) do
      v(hunger)
    end
  end
