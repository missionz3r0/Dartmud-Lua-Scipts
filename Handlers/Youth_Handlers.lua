
registerAnonymousEventHandler("youthfullnessEvent", "Handlers.youthfullnessEventHandler")
  local youthfullnessEventListeners = {}
  function Handlers.addyouthfullnessEventListener(listenerName, functionToAdd)
    youthfullnessEventListeners[listenerName] = functionToAdd
  end

  function Handlers.removeyouthfullnessEventListener(listenerName)
    youthfullnessEventListeners[listenerName] = nil
  end

  function Handlers.youthfullnessEventHandler(youthfullness)
    for l,v in pairs(youthfullnessEventListeners) do
      v(youthfullness)
    end
  end
