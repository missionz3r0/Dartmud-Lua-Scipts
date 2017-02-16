registerAnonymousEventHandler("saveEvent", "Handlers.saveHandler")
  local saveListeners = {}
  function Handlers.addSaveListener(listenerName, functionToAdd)
    saveListeners[listenerName] = functionToAdd
  end

  function Handlers.removeSaveListener(listenerName)
    saveListeners[listenerName] = nil
  end

  function Handlers.saveHandler(event)
    local saveTable = {}
    for k,v in pairs(saveListeners) do
      saveTable[k] = v()
    end
    table.save(getMudletHomeDir().."/dartmud.txt", saveTable)
  end

registerAnonymousEventHandler("loadEvent", "Handlers.loadHandler")
  local loadListeners = {}
  function Handlers.addLoadListener(listenerName, functionToAdd)
    loadListeners[listenerName] = functionToAdd
  end

  function Handlers.removeLoadListener(listenerName)
    loadListeners[listenerName] = nil
  end

  function Handlers.loadHandler(event)
    local saveTable = {}
    if io.exists(getMudletHomeDir().."/dartmud.txt") then

      table.load(getMudletHomeDir().."/dartmud.txt", saveTable)
      for k,v in pairs(loadListeners) do
        v(saveTable[k])
      end
    end
  end
