registerAnonymousEventHandler("practiceInscribingEvent", "Handlers.practiceInscribingHandler")
  local practiceInscribingListeners = {}
  function Handlers.addPracticeInscribingListener(listenerName, functionToAdd)
    practiceInscribingListeners[listenerName] = functionToAdd
  end

  function Handlers.removePracticeInscribingListener(listenerName)
    practiceInscribingListeners[listenerName] = nil
  end

  function Handlers.practiceInscribingHandler(event, spell, power)
    for l,v in pairs(practiceInscribingListeners) do
      v(spell, power)
    end
  end
