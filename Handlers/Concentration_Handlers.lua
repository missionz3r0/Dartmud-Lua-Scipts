
registerAnonymousEventHandler("concEvent", "Handlers.concEventHandler")
  local concEventListeners = {}
  function Handlers.addconcEventListener(listenerName, functionToAdd)
    concEventListeners[listenerName] = functionToAdd
  end

  function Handlers.removeconcEventListener(listenerName)
    concEventListeners[listenerName] = nil
  end

  function Handlers.concEventHandler(event, conc)
    for l,v in pairs(concEventListeners) do
      v(conc)
    end
  end

registerAnonymousEventHandler("BEBTconcEvent", "Handlers.BEBTconcEventHandler")
  local BEBTconcEventListeners = {}
  function Handlers.addBEBTconcEventListener(listenerName, functionToAdd)
    BEBTconcEventListeners[listenerName] = functionToAdd
  end

  function Handlers.removeBEBTconcEventListener(listenerName)
    BEBTconcEventListeners[listenerName] = nil
  end

  function Handlers.BEBTconcEventHandler(event, conc)
    for l,v in pairs(BEBTconcEventListeners) do
      v(conc)
    end
  end

registerAnonymousEventHandler("BOBconcEvent", "Handlers.BOBconcEventHandler")
  local BOBconcEventListeners = {}
  function Handlers.addBOBconcEventListener(listenerName, functionToAdd)
    BOBconcEventListeners[listenerName] = functionToAdd
  end

  function Handlers.removeBOBconcEventListener(listenerName)
    BOBconcEventListeners[listenerName] = nil
  end

  function Handlers.BOBconcEventHandler(event, conc)
    for l,v in pairs(BOBconcEventListeners) do
      v(conc)
    end
  end

registerAnonymousEventHandler("SDconcEvent", "Handlers.SDconcEventHandler")
  local SDconcEventListeners = {}
  function Handlers.addSDconcEventListener(listenerName, functionToAdd)
    SDconcEventListeners[listenerName] = functionToAdd
  end

  function Handlers.removeSDconcEventListener(listenerName)
    SDconcEventListeners[listenerName] = nil
  end

  function Handlers.SDconcEventHandler(event, conc)
    for l,v in pairs(SDconcEventListeners) do
      v(conc)
    end
  end

registerAnonymousEventHandler("OBconcEvent", "Handlers.OBconcEventHandler")
  local OBconcEventListeners = {}
  function Handlers.addOBconcEventListener(listenerName, functionToAdd)
    OBconcEventListeners[listenerName] = functionToAdd
  end

  function Handlers.removeOBconcEventListener(listenerName)
    OBconcEventListeners[listenerName] = nil
  end

  function Handlers.OBconcEventHandler(event, conc)
    for l,v in pairs(OBconcEventListeners) do
      v(conc)
    end
  end

registerAnonymousEventHandler("DAOBconcEvent", "Handlers.DAOBconcEventHandler")
  local DAOBconcEventListeners = {}
  function Handlers.addDAOBconcEventListener(listenerName, functionToAdd)
    DAOBconcEventListeners[listenerName] = functionToAdd
  end

  function Handlers.removeDAOBconcEventListener(listenerName)
    DAOBconcEventListeners[listenerName] = nil
  end

  function Handlers.DAOBconcEventHandler(event, conc)
    for l,v in pairs(DAOBconcEventListeners) do
      v(conc)
    end
  end

registerAnonymousEventHandler("SHOTconcEvent", "Handlers.SHOTconcEventHandler")
  local SHOTconcEventListeners = {}
  function Handlers.addSHOTconcEventListener(listenerName, functionToAdd)
    SHOTconcEventListeners[listenerName] = functionToAdd
  end

  function Handlers.removeSHOTconcEventListener(listenerName)
    SHOTconcEventListeners[listenerName] = nil
  end

  function Handlers.SHOTconcEventHandler(event, conc)
    for l,v in pairs(SHOTconcEventListeners) do
      v(conc)
    end
  end

registerAnonymousEventHandler("TCTRNconcEvent", "Handlers.TCTRNconcEventHandler")
  local TCTRNconcEventListeners = {}
  function Handlers.addTCTRNconcEventListener(listenerName, functionToAdd)
    TCTRNconcEventListeners[listenerName] = functionToAdd
  end

  function Handlers.removeTCTRNconcEventListener(listenerName)
    TCTRNconcEventListeners[listenerName] = nil
  end

  function Handlers.TCTRNconcEventHandler(event, conc)
    for l,v in pairs(TCTRNconcEventListeners) do
      v(conc)
    end
  end

registerAnonymousEventHandler("UnconsciousEvent", "Handlers.UnconsciousEventHandler")
  local UnconsciousEventListeners = {}
  function Handlers.addUnconsciousEventListener(listenerName, functionToAdd)
    UnconsciousEventListeners[listenerName] = functionToAdd
  end

  function Handlers.removeUnconsciousEventListener(listenerName)
    UnconsciousEventListeners[listenerName] = nil
  end

  function Handlers.UnconsciousEventHandler(event, conc)
    for l,v in pairs(UnconsciousEventListeners) do
      v(conc)
    end
  end
