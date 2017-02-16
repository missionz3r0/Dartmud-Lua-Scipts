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
