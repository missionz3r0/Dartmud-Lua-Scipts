
registerAnonymousEventHandler("sysWindowResizeEvent", "Handlers.windowResizeHandler")
  local windowResizeListeners = {}
  function Handlers.addWindowResizeListener(listenerName, functionToAdd)
    windowResizeListeners[listenerName] = functionToAdd
  end

  function Handlers.removeWindowResizeListener(listenerName)
    windowResizeListeners[listenerName] = nil
  end

  function Handlers.windowResizeHandler(event, x, y)
    for k,v in pairs(windowResizeListeners) do
      v(event, x, y)
    end
  end
