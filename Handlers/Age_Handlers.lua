
registerAnonymousEventHandler("ageEvent", "Handlers.ageHandler")
  local ageListeners = {}
  function Handlers.addAgeListener(listenerName, functionToAdd)
    ageListeners[listenerName] = functionToAdd
  end

  function Handlers.removeAgeListener(listenerName)
    ageListeners[listenerName] = nil
  end

  function Handlers.ageHandler(event, age)
    for l,v in pairs(ageListeners) do
      v(age)
    end
  end
