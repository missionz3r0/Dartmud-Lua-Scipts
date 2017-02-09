
registerAnonymousEventHandler("raceEvent", "Handlers.raceEventHandler")
  local raceEventListeners = {}
  function Handlers.addraceEventListener(listenerName, functionToAdd)
    ageEventListeners[listenerName] = functionToAdd
  end

  function Handlers.removeraceEventListener(listenerName)
    ageEventListeners[listenerName] = nil
  end

  function Handlers.raceEventHandler(name)
    for l,v in pairs(raceEventListeners) do
      v(name)
    end
  end
