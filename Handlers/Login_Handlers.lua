registerAnonymousEventHandler("loginEvent", "Handlers.loginHandler")
  local loginListeners = {}
  function Handlers.addLoginListener(listenerName, functionToAdd)
    loginListeners[listenerName] = functionToAdd
  end

  function Handlers.removeLoginListener(listenerName)
    loginListeners[listenerName] = nil
  end

  function Handlers.loginHandler(event)
    for k,v in pairs(loginListeners) do
      v()
    end
  end
