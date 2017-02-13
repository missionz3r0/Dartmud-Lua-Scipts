
registerAnonymousEventHandler("skillImproveEvent", "Handlers.skillImproveHandler")
  local skillImproveListeners = {}
  function Handlers.addskillImproveListener(listenerName, functionToAdd)
    skillImproveListeners[listenerName] = functionToAdd
  end

  function Handlers.removeskillImproveListener(listenerName)
    skillImproveListeners[listenerName] = nil
  end

  function Handlers.skillImproveHandler(evt, who, skill)
    for l,v in pairs(skillImproveListeners) do
      v(evt, who, skill)
    end
  end

registerAnonymousEventHandler("skillMistakeEvent", "Handlers.skillMistakeHandler")
  local skillMistakeListeners = {}
  function Handlers.addskillMistakeListener(listenerName, functionToAdd)
    skillMistakeListeners[listenerName] = functionToAdd
  end

  function Handlers.removeskillMistakeListener(listenerName)
    skillMistakeListeners[listenerName] = nil
  end

  function Handlers.skillMistakeHandler(who, skill)
    for l,v in pairs(skillMistakeListeners) do
      v(who, skill)
    end
  end

registerAnonymousEventHandler("skillInfoEvent", "Skills.skillInfoEventHandler")
  local skillInfoListeners = {}
  function Handlers.addskillInfoListener(listenerName, functionToAdd)
    skillMistakeListeners[listenerName] = functionToAdd
  end

  function Handlers.removeskillInfoListener(listenerName)
    skillInfoListeners[listenerName] = nil
  end

  function Handlers.skillInfoHandler(who, skill)
    for l,v in pairs(skillInfoListeners) do
      v(who, skill)
    end
  end
