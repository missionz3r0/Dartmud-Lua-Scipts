
registerAnonymousEventHandler("chatEvent", "Handlers.chatHandler")
  local chatListeners = {}
  function Handlers.addchatListener(listenerName, functionToAdd)
    chatListeners[listenerName] = functionToAdd
  end

  function Handlers.removechatListener(listenerName)
    chatListeners[listenerName] = nil
  end

  function Handlers.chatHandler(event, text)
    for k,v in pairs(chatListeners) do
      v(event, text)
    end
  end
