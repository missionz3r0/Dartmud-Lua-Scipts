
registerAnonymousEventHandler("thirstEvent", "Handlers.thirstEventHandler")
  local thirstEventListeners = {}
  function Handlers.addthirstEventListener(listenerName, functionToAdd)
    thirstEventListeners[listenerName] = functionToAdd
  end

  function Handlers.removethirstEventListener(listenerName)
    thirstEventListeners[listenerName] = nil
  end

  function Handlers.thirstEventHandler(event, thirst)
    for l,v in pairs(thirstEventListeners) do
      v(thirst)
    end
  end
