
registerAnonymousEventHandler("chatEvent", "Handlers.chatHandler")
  local chatListeners = {}
  function Handlers.addChatListener(listenerName, functionToAdd)
    chatListeners[listenerName] = functionToAdd
  end

  function Handlers.removeChatListener(listenerName)
    chatListeners[listenerName] = nil
  end

  function Handlers.chatHandler(event, text)
    for k,v in pairs(chatListeners) do
      v(event, text)
    end
  end
