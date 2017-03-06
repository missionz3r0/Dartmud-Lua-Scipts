
registerAnonymousEventHandler("loadEvent", "Handlers.loadHandler")
  local loadListeners = {}
  function Handlers.addLoadListener(listenerName, functionToAdd)
    loadListeners[listenerName] = functionToAdd
  end

  function Handlers.removeLoadListener(listenerName)
    loadListeners[listenerName] = nil
  end

  function Handlers.loadHandler(event)
    for l,v in pairs(loadListeners) do
      v()
    end
  end


registerAnonymousEventHandler("unloadEvent", "Handlers.unloadHandler")
  local unloadListeners = {}
  function Handlers.addUnloadListener(listenerName, functionToAdd)
    unloadListeners[listenerName] = functionToAdd
  end

  function Handlers.removeUnloadListener(listenerName)
    unloadListeners[listenerName] = nil
  end

  function Handlers.unloadHandler(event)
    for l,v in pairs(unloadListeners) do
      v()
    end
  end
registerAnonymousEventHandler("reloadEvent", "Handlers.reloadHandler")
  local reloadListeners = {}
  function Handlers.addReloadListener(listenerName, functionToAdd)
    reloadListeners[listenerName] = functionToAdd
  end

  function Handlers.removeReloadListener(listenerName)
    reloadListeners[listenerName] = nil
  end

  function Handlers.reloadHandler(event)
    for l,v in pairs(reloadListeners) do
      v()
    end
  end
