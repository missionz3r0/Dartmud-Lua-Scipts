
registerAnonymousEventHandler("sysDataSendRequest", "Handlers.sysDataSendRequestHandler")
  local sysDataSendRequestListeners = {}
  function Handlers.addsysDataSendRequestListener(listenerName, functionToAdd)
    sysDataSendRequestListeners[listenerName] = functionToAdd
  end

  function Handlers.removesysDataSendRequestListener(listenerName)
    sysDataSendRequestListeners[listenerName] = nil
  end

  function Handlers.sysDataSendRequestHandler(__, command)
    for l,v in pairs(sysDataSendRequestListeners) do
      v(command)
    end
  end

registerAnonymousEventHandler("sysConnectionEvent", "Handlers.sysConnectionEventHandler")
  local sysConnectionEventListeners = {}
  function Handlers.addsysConnectionEventListener(listenerName, functionToAdd)
    sysConnectionEventListeners[listenerName] = functionToAdd
  end

  function Handlers.removesysConnectionEventListener(listenerName)
    sysConnectionEventListeners[listenerName] = nil
  end

  function Handlers.sysConnectionEventHandler(e, f, g)
    for l,v in pairs(sysConnectionEventListeners) do
      v(command)
    end
  end
