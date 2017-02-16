registerAnonymousEventHandler("practiceInscribingEvent", "Handlers.practiceInscribingEventHandler")
  local practiceInscribingEventListeners = {}
  function Handlers.addpracticeInscribingEventListener(listenerName, functionToAdd)
    practiceCastEventListeners[listenerName] = functionToAdd
  end

  function Handlers.removepracticeInscribingEventListener(listenerName)
    practiceCastEventListeners[listenerName] = nil
  end

  function Handlers.practiceInscribingEventHandler(spell, power)
    for l,v in pairs(practiceInscribingEventListeners) do
      v(spell, power)
    end
  end
