
registerAnonymousEventHandler("practiceCastEvent", "Handlers.practiceCastEventHandler")
  local practiceCastEventListeners = {}
  function Handlers.addpracticeCastEventListener(listenerName, functionToAdd)
    practiceCastEventListeners[listenerName] = functionToAdd
  end

  function Handlers.removepracticeCastEventListener(listenerName)
    practiceCastEventListeners[listenerName] = nil
  end

  function Handlers.practiceCastEventHandler(spellName, power, arguments)
    for l,v in pairs(practiceCastEventListeners) do
      v(spellName, power, arguments)
    end
  end
