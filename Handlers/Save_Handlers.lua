registerAnonymousEventHandler("saveEvent", "Handlers.saveEventHandler")
  local saveEventListeners = {}
  function Handlers.addsaveEventListener(listenerName, functionToAdd)
    saveEventListeners[listenerName] = functionToAdd
  end

  function Handlers.removesaveEventListener(listenerName)
    saveEventListeners[listenerName] = nil
  end

  function Handlers.saveEventHandler(event)
    local saveTable = {}
    for k,v in pairs(saveEventListeners) do
      saveTable[k] = v()
    end
    table.save(getMudletHomeDir().."/dartmud.txt", saveTable)
  end

registerAnonymousEventHandler("loadEvent", "Handlers.loadEventHandler")
  local loadEventListeners = {}
  function Handlers.addloadEventListener(listenerName, functionToAdd)
    loadEventListeners[listenerName] = functionToAdd
  end

  function Handlers.removeloadEventListener(listenerName)
    loadEventListeners[listenerName] = nil
  end

  function Handlers.loadEventHandler(event)
    local saveTable = {}
    if io.exists(getMudletHomeDir().."/dartmud.txt") then

      table.load(getMudletHomeDir().."/dartmud.txt", saveTable)
      for k,v in pairs(loadEventListeners) do
        v(saveTable[k])
      end
    end
  end
