
registerAnonymousEventHandler("practiceCastEvent", "Handlers.practiceCastHandler")
  local practiceCastListeners = {}
  function Handlers.addPracticeCastListener(listenerName, functionToAdd)
    practiceCastListeners[listenerName] = functionToAdd
  end

  function Handlers.removePracticeCastListener(listenerName)
    practiceCastListeners[listenerName] = nil
  end

  function Handlers.practiceCastHandler(event, spellName, power, arguments)
    for l,v in pairs(practiceCastListeners) do
      v(spellName, power, arguments)
    end
  end
