
registerAnonymousEventHandler("alignmentEvent", "Handlers.alignmentHandler")
  local alignmentListeners = {}
  function Handlers.addalignmentListener(listenerName, functionToAdd)
    alignmentListeners[listenerName] = functionToAdd
  end

  function Handlers.removealignmentListener(listenerName)
    alignmentListeners[listenerName] = nil
  end

  function Handlers.alignmentHandler(event, conviction, alignment)
    for l,v in pairs(alignmentListeners) do
      v(conviction, alignment)
    end
  end
