registerAnonymousEventHandler("channellingEvent", "Handlers.channellingHandler")
  local channellingListeners = {}
  function Handlers.addChannellingListener(listenerName, functionToAdd)
    practiceCastListeners[listenerName] = functionToAdd
  end

  function Handlers.removeChannellingListener(listenerName)
    practiceCastListeners[listenerName] = nil
  end

  function Handlers.channellingHandler(event, power, target)
    for l,v in pairs(channellingListeners) do
      v(power, target)
    end
  end
