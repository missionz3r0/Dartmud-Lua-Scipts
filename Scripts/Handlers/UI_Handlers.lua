
registerAnonymousEventHandler("sysWindowResizeEvent", "Handlers.windowResizeHandler")
  local windowResizeListeners = {}
  function Handlers.addwindowResizeListener(listenerName, functionToAdd)
    windowResizeListeners[listenerName] = functionToAdd
  end

  function Handlers.removewindowResizeListener(listenerName)
    windowResizeListeners[listenerName] = nil
  end

  function Handlers.windowResizeHandler(event, x, y)
    for k,v in pairs(windowResizeListeners) do
      v(event, x, y)
    end
  end

  
