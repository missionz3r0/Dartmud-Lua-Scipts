
registerAnonymousEventHandler("SoulAgeEvent", "Handlers.SoulAgeHandler")
  local soulAgeListeners = {}
  function Handlers.addSoulAgeListener(listenerName, functionToAdd)
    soulAgeListeners[listenerName] = functionToAdd
  end

  function Handlers.removeSoulAgeListener(listenerName)
    soulAgeListeners[listenerName] = nil
  end

  function Handlers.soulAgeHandler(event, years, months)
    for l,v in pairs(soulAgeListeners) do
      v(years, months)
    end
  end
