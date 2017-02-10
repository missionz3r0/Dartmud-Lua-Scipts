
registerAnonymousEventHandler("practiceCastEvent", "Handlers.practiceCastEventHandler")
  local practiceCastEventListeners = {}
  function Handlers.addpracticeCastEventListener(listenerName, functionToAdd)
    practiceCastEventListeners[listenerName] = functionToAdd
  end

  function Handlers.removepracticeCastEventListener(listenerName)
    practiceCastEventListeners[listenerName] = nil
  end

  function Handlers.practiceCastEventHandler(spell, power, arguments)
    for l,v in pairs(practiceCastEventListeners) do
      v(spell, power, arguments)
    end
  end

registerAnonymousEventHandler("channellingEvent", "Handlers.channellingEventHandler")
  local channellingEventListeners = {}
  function Handlers.addchannellingEventListener(listenerName, functionToAdd)
    practiceCastEventListeners[listenerName] = functionToAdd
  end

  function Handlers.removechannellingEventListener(listenerName)
    practiceCastEventListeners[listenerName] = nil
  end

  function Handlers.channellingEventHandler(power, target)
    for l,v in pairs(channellingEventListeners) do
      v(power, target)
    end
  end

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
