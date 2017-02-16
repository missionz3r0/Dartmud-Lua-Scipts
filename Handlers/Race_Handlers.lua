
registerAnonymousEventHandler("raceEvent", "Handlers.raceHandler")
  local raceListeners = {}
  function Handlers.addRaceListener(listenerName, functionToAdd)
    raceListeners[listenerName] = functionToAdd
  end

  function Handlers.removeRaceListener(listenerName)
    raceListeners[listenerName] = nil
  end

  function Handlers.raceHandler(event, name)
    for l,v in pairs(raceListeners) do
      v(name)
    end
  end
