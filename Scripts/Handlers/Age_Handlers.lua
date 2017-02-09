
registerAnonymousEventHandler("ageEvent", "Handlers.ageEventHandler")
  local ageEventListeners = {}
  function Handlers.addageEventListener(listenerName, functionToAdd)
    ageEventListeners[listenerName] = functionToAdd
  end

  function Handlers.removeageEventListener(listenerName)
    ageEventListeners[listenerName] = nil
  end

  function Handlers.ageEventHandler(years, months)
    for l,v in pairs(ageEventListeners) do
      v(years, months)
    end
  end
