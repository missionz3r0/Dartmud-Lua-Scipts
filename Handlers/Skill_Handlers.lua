
registerAnonymousEventHandler("skillImproveEvent", "Handlers.skillImproveHandler")
  local skillImproveListeners = {}
  function Handlers.addSkillImproveListener(listenerName, functionToAdd)
    skillImproveListeners[listenerName] = functionToAdd
  end

  function Handlers.removeSkillImproveListener(listenerName)
    skillImproveListeners[listenerName] = nil
  end

  function Handlers.skillImproveHandler(event, who, skill)
    for l,v in pairs(skillImproveListeners) do
      v(who, skill)
    end
  end

registerAnonymousEventHandler("skillMistakeEvent", "Handlers.skillMistakeHandler")
  local skillMistakeListeners = {}
  function Handlers.addSkillMistakeListener(listenerName, functionToAdd)
    skillMistakeListeners[listenerName] = functionToAdd
  end

  function Handlers.removeSkillMistakeListener(listenerName)
    skillMistakeListeners[listenerName] = nil
  end

  function Handlers.skillMistakeHandler(event, who, skill)
    for l,v in pairs(skillMistakeListeners) do
      v(who, skill)
    end
  end

registerAnonymousEventHandler("skillInfoEvent", "Skills.skillInfoHandler")
  local skillInfoListeners = {}
  function Handlers.addSkillInfoListener(listenerName, functionToAdd)
    skillMistakeListeners[listenerName] = functionToAdd
  end

  function Handlers.removeSkillInfoListener(listenerName)
    skillInfoListeners[listenerName] = nil
  end

  function Handlers.skillInfoHandler(event, who, skill)
    for l,v in pairs(skillInfoListeners) do
      v(who, skill)
    end
  end
