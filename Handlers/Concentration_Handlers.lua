
registerAnonymousEventHandler("concEvent", "Handlers.concHandler")
  local ConcListeners = {}
  function Handlers.addConcListener(listenerName, functionToAdd)
    ConcListeners[listenerName] = functionToAdd
  end

  function Handlers.removeConcListener(listenerName)
    ConcListeners[listenerName] = nil
  end

  function Handlers.concHandler(event, conc)
    for l,v in pairs(ConcListeners) do
      v(conc)
    end
  end

registerAnonymousEventHandler("BEBTconcEvent", "Handlers.BEBTconcHandler")
  local BEBTConcListeners = {}
  function Handlers.addBEBTConcListener(listenerName, functionToAdd)
    BEBTConcListeners[listenerName] = functionToAdd
  end

  function Handlers.removeBEBTConcListener(listenerName)
    BEBTConcListeners[listenerName] = nil
  end

  function Handlers.BEBTconcHandler(event, conc)
    for l,v in pairs(BEBTConcListeners) do
      v(conc)
    end
  end

registerAnonymousEventHandler("BOBconcEvent", "Handlers.BOBconcHandler")
  local BOBConcListeners = {}
  function Handlers.addBOBConcListener(listenerName, functionToAdd)
    BOBConcListeners[listenerName] = functionToAdd
  end

  function Handlers.removeBOBConcListener(listenerName)
    BOBConcListeners[listenerName] = nil
  end

  function Handlers.BOBconcHandler(event, conc)
    for l,v in pairs(BOBConcListeners) do
      v(conc)
    end
  end

registerAnonymousEventHandler("SDconcEvent", "Handlers.SDconcHandler")
  local SDConcListeners = {}
  function Handlers.addSDConcListener(listenerName, functionToAdd)
    SDConcListeners[listenerName] = functionToAdd
  end

  function Handlers.removeSDConcListener(listenerName)
    SDConcListeners[listenerName] = nil
  end

  function Handlers.SDconcHandler(event, conc)
    for l,v in pairs(SDConcListeners) do
      v(conc)
    end
  end

registerAnonymousEventHandler("OBconcEvent", "Handlers.OBconcHandler")
  local OBConcListeners = {}
  function Handlers.addOBConcListener(listenerName, functionToAdd)
    OBConcListeners[listenerName] = functionToAdd
  end

  function Handlers.removeOBConcListener(listenerName)
    OBConcListeners[listenerName] = nil
  end

  function Handlers.OBconcHandler(event, conc)
    for l,v in pairs(OBConcListeners) do
      v(conc)
    end
  end

registerAnonymousEventHandler("DAOBconcEvent", "Handlers.DAOBconcHandler")
  local DAOBConcListeners = {}
  function Handlers.addDAOBConcListener(listenerName, functionToAdd)
    DAOBConcListeners[listenerName] = functionToAdd
  end

  function Handlers.removeDAOBConcListener(listenerName)
    DAOBConcListeners[listenerName] = nil
  end

  function Handlers.DAOBconcHandler(event, conc)
    for l,v in pairs(DAOBConcListeners) do
      v(conc)
    end
  end

registerAnonymousEventHandler("SHOTconcEvent", "Handlers.SHOTconcHandler")
  local SHOTConcListeners = {}
  function Handlers.addSHOTConcListener(listenerName, functionToAdd)
    SHOTConcListeners[listenerName] = functionToAdd
  end

  function Handlers.removeSHOTConcListener(listenerName)
    SHOTConcListeners[listenerName] = nil
  end

  function Handlers.SHOTconcHandler(event, conc)
    for l,v in pairs(SHOTConcListeners) do
      v(conc)
    end
  end

registerAnonymousEventHandler("TCTRNconcEvent", "Handlers.TCTRNconcHandler")
  local TCTRNConcListeners = {}
  function Handlers.addTCTRNConcListener(listenerName, functionToAdd)
    TCTRNConcListeners[listenerName] = functionToAdd
  end

  function Handlers.removeTCTRNConcListener(listenerName)
    TCTRNConcListeners[listenerName] = nil
  end

  function Handlers.TCTRNconcHandler(event, conc)
    for l,v in pairs(TCTRNConcListeners) do
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
