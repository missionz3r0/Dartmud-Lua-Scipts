
registerAnonymousEventHandler("sysDataSendRequest", "Handlers.sysDataSendRequestHandler")
  local sysDataSendRequestListeners = {}
  function Handlers.addSysDataSendRequestListener(listenerName, functionToAdd)
    sysDataSendRequestListeners[listenerName] = functionToAdd
  end

  function Handlers.removeSysDataSendRequestListener(listenerName)
    sysDataSendRequestListeners[listenerName] = nil
  end

  function Handlers.sysDataSendRequestHandler(__, command)
    for l,v in pairs(sysDataSendRequestListeners) do
      v(command)
    end
  end

registerAnonymousEventHandler("sysConnectionEvent", "Handlers.sysConnectionHandler")
  local sysConnectionListeners = {}
  function Handlers.addSysConnectionListener(listenerName, functionToAdd)
    sysConnectionListeners[listenerName] = functionToAdd
  end

  function Handlers.removeSysConnectionListener(listenerName)
    sysConnectionListeners[listenerName] = nil
  end

  function Handlers.sysConnectionHandler(e, f, g)
    for l,v in pairs(sysConnectionListeners) do
      v(command)
    end
  end
