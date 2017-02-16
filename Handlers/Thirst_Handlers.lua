
registerAnonymousEventHandler("thirstEvent", "Handlers.thirstHandler")
  local thirstListeners = {}
  function Handlers.addThirstListener(listenerName, functionToAdd)
    thirstListeners[listenerName] = functionToAdd
  end

  function Handlers.removeThirstListener(listenerName)
    thirstListeners[listenerName] = nil
  end

  function Handlers.thirstHandler(event, thirst)
    for l,v in pairs(thirstListeners) do
      v(thirst)
    end
  end
