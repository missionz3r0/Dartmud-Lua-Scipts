
registerAnonymousEventHandler("auraEvent", "Handlers.auraEventHandler")
  local auraEventListeners = {}
  function Handlers.addauraEventListener(listenerName, functionToAdd)
    auraEventListeners[listenerName] = functionToAdd
  end

  function Handlers.removeauraEventListener(listenerName)
    auraEventListeners[listenerName] = nil
  end

  function Handlers.auraEventHandler(aura)
    for l,v in pairs(auraEventListeners) do
      v(aura)
    end
  end

registerAnonymousEventHandler("VeryDimRedauraEvent", "Handlers.VeryDimRedauraEventHandler")
  local VeryDimRedauraEventListeners = {}
  function Handlers.addVeryDimRedauraEventListener(listenerName, functionToAdd)
    VeryDimRedauraEventListeners[listenerName] = functionToAdd
  end

  function Handlers.removeVeryDimRedauraEventListener(listenerName)
    VeryDimRedauraEventListeners[listenerName] = nil
  end

  function Handlers.VeryDimRedauraEventHandler(aura)
    for l,v in pairs(VeryDimRedauraEventListeners) do
      v(aura)
    end
  end

registerAnonymousEventHandler("DimRedauraEvent", "Handlers.DimRedauraEventHandler")
  local DimRedauraEventListeners = {}
  function Handlers.addDimRedauraEventListener(listenerName, functionToAdd)
    DimRedauraEventListeners[listenerName] = functionToAdd
  end

  function Handlers.removeDimRedauraEventListener(listenerName)
    DimRedauraEventListeners[listenerName] = nil
  end

  function Handlers.DimRedauraEventHandler(aura)
    for l,v in pairs(DimRedauraEventListeners) do
      v(aura)
    end
  end

registerAnonymousEventHandler("RedauraEvent", "Handlers.RedauraEventHandler")
  local RedauraEventListeners = {}
  function Handlers.addRedauraEventListener(listenerName, functionToAdd)
    RedauraEventListeners[listenerName] = functionToAdd
  end

  function Handlers.removeRedauraEventListener(listenerName)
    RedauraEventListeners[listenerName] = nil
  end

  function Handlers.RedauraEventHandler(aura)
    for l,v in pairs(RedauraEventListeners) do
      v(aura)
    end
  end

registerAnonymousEventHandler("OrangishRedauraEvent", "Handlers.OrangishRedauraEventHandler")
  local OrangishRedauraListeners = {}
  function Handlers.addOrangishRedauraEventListener(listenerName, functionToAdd)
    OrangishRedauraListeners[listenerName] = functionToAdd
  end

  function Handlers.removeOrangishRedauraEventListener(listenerName)
    OrangishRedauraListeners[listenerName] = nil
  end

  function Handlers.OrangishRedauraEventHandler(aura)
    for l,v in pairs(OrangishRedauraListeners) do
      v(aura)
    end
  end

registerAnonymousEventHandler("ReddishOrangeauraEvent", "Handlers.ReddishOrangeauraHandler")
  local ReddishOrangeauraListeners = {}
  function Handlers.addReddishOrangeauraListener(listenerName, functionToAdd)
    ReddishOrangeauraListeners[listenerName] = functionToAdd
  end

  function Handlers.removeReddishOrangeauraListener(listenerName)
    ReddishOrangeauraListeners[listenerName] = nil
  end

  function Handlers.ReddishOrangeauraHandler(aura)
    for l,v in pairs(ReddishOrangeauraListeners) do
      v(aura)
    end
  end

registerAnonymousEventHandler("OrangeauraEvent", "Handlers.OrangeauraHandler")
  local OrangeauraListeners = {}
  function Handlers.addOrangeauraListener(listenerName, functionToAdd)
    OrangeauraListeners[listenerName] = functionToAdd
  end

  function Handlers.removeOrangeauraListener(listenerName)
    OrangeauraListeners[listenerName] = nil
  end

  function Handlers.OrangeauraHandler(aura)
    for l,v in pairs(OrangeauraListeners) do
      v(aura)
    end
  end

registerAnonymousEventHandler("YellowishOrangeauraEvent", "Handlers.YellowishOrangeauraHandler")
  local YellowishOrangeauraListeners = {}
  function Handlers.addYellowishOrangeauraListener(listenerName, functionToAdd)
    YellowishOrangeauraListeners[listenerName] = functionToAdd
  end

  function Handlers.removeYellowishOrangeeauraListener(listenerName)
    YellowishOrangeauraListeners[listenerName] = nil
  end

  function Handlers.YellowishOrangeauraHandler(aura)
    for l,v in pairs(YellowishOrangeauraListeners) do
      v(aura)
    end
  end

registerAnonymousEventHandler("OrangishYellowauraEvent", "Handlers.OrangishYellowauraHandler")
  local OrangishYellowauraListeners = {}
  function Handlers.addOrangishYellowauraListener(listenerName, functionToAdd)
    OrangishYellowauraListeners[listenerName] = functionToAdd
  end

  function Handlers.removeOrangishYelloweauraListener(listenerName)
    OrangishYellowauraListeners[listenerName] = nil
  end

  function Handlers.OrangishYellowauraHandler(aura)
    for l,v in pairs(OrangishYellowauraListeners) do
      v(aura)
    end
  end

registerAnonymousEventHandler("YellowauraEvent", "Handlers.YellowauraHandler")
  local YellowauraListeners = {}
  function Handlers.addYellowauraListener(listenerName, functionToAdd)
    YellowauraListeners[listenerName] = functionToAdd
  end

  function Handlers.removeYelloweauraListener(listenerName)
    YellowauraListeners[listenerName] = nil
  end

  function Handlers.YellowauraHandler(aura)
    for l,v in pairs(YellowauraListeners) do
      v(aura)
    end
  end

registerAnonymousEventHandler("GreenishYellowauraEvent", "Handlers.GreenishYellowauraHandler")
  local GreenishYellowauraListeners = {}
  function Handlers.addGreenishYellowauraListener(listenerName, functionToAdd)
    GreenishYellowauraListeners[listenerName] = functionToAdd
  end

  function Handlers.removeGreenishYelloweauraListener(listenerName)
    GreenishYellowauraListeners[listenerName] = nil
  end

  function Handlers.GreenishYellowauraHandler(aura)
    for l,v in pairs(GreenishYellowauraListeners) do
      v(aura)
    end
  end

registerAnonymousEventHandler("YellowishGreenauraEvent", "Handlers.YellowishGreenauraHandler")
  local YellowishGreenauraListeners = {}
  function Handlers.addYellowishGreenauraListener(listenerName, functionToAdd)
    YellowishGreenauraListeners[listenerName] = functionToAdd
  end

  function Handlers.removeYellowishGreeneauraListener(listenerName)
    YellowishGreenauraListeners[listenerName] = nil
  end

  function Handlers.YellowishGreenauraHandler(aura)
    for l,v in pairs(YellowishGreenauraListeners) do
      v(aura)
    end
  end

registerAnonymousEventHandler("GreenauraEvent", "Handlers.GreenauraHandler")
  local GreenauraListeners = {}
  function Handlers.addGreenauraListener(listenerName, functionToAdd)
    GreenauraListeners[listenerName] = functionToAdd
  end

  function Handlers.removeGreeneauraListener(listenerName)
    GreenauraListeners[listenerName] = nil
  end

  function Handlers.GreenauraHandler(aura)
    for l,v in pairs(GreenauraListeners) do
      v(aura)
    end
  end

registerAnonymousEventHandler("BluishGreenauraEvent", "Handlers.BluishGreenauraHandler")
  local BluishGreenauraListeners = {}
  function Handlers.addBluishGreenauraListener(listenerName, functionToAdd)
    BluishGreenauraListeners[listenerName] = functionToAdd
  end

  function Handlers.removeBluishGreeneauraListener(listenerName)
    BluishGreenauraListeners[listenerName] = nil
  end

  function Handlers.BluishGreenauraHandler(aura)
    for l,v in pairs(BluishGreenauraListeners) do
      v(aura)
    end
  end

registerAnonymousEventHandler("GreenishBlueauraEvent", "Handlers.GreenishBlueauraHandler")
  local GreenishBlueauraListeners = {}
  function Handlers.addGreenishBlueauraListener(listenerName, functionToAdd)
    GreenishBlueauraListeners[listenerName] = functionToAdd
  end

  function Handlers.removeGreenishBlueeauraListener(listenerName)
    GreenishBlueauraListeners[listenerName] = nil
  end

  function Handlers.GreenishBlueauraHandler(aura)
    for l,v in pairs(GreenishBlueauraListeners) do
      v(aura)
    end
  end

registerAnonymousEventHandler("BlueauraEvent", "Handlers.BlueauraHandler")
  local BlueauraListeners = {}
  function Handlers.addBlueauraListener(listenerName, functionToAdd)
    BlueauraListeners[listenerName] = functionToAdd
  end

  function Handlers.removeBlueeauraListener(listenerName)
    BlueauraListeners[listenerName] = nil
  end

  function Handlers.BlueauraHandler(aura)
    for l,v in pairs(BlueauraListeners) do
      v(aura)
    end
  end

registerAnonymousEventHandler("IntenseBlueauraEvent", "Handlers.IntenseBlueauraHandler")
  local IntenseBlueauraListeners = {}
  function Handlers.addIntenseBlueauraListener(listenerName, functionToAdd)
    IntenseBlueauraListeners[listenerName] = functionToAdd
  end

  function Handlers.removeIntenseBlueeauraListener(listenerName)
    IntenseBlueauraListeners[listenerName] = nil
  end

  function Handlers.IntenseBlueauraHandler(aura)
    for l,v in pairs(IntenseBlueauraListeners) do
      v(aura)
    end
  end

registerAnonymousEventHandler("DimIndigoauraEvent", "Handlers.DimIndigoauraHandler")
  local DimIndigoauraListeners = {}
  function Handlers.addDimIndigoauraListener(listenerName, functionToAdd)
    DimIndigoauraListeners[listenerName] = functionToAdd
  end

  function Handlers.removeDimIndigoeauraListener(listenerName)
    DimIndigoauraListeners[listenerName] = nil
  end

  function Handlers.DimIndigoauraHandler(aura)
    for l,v in pairs(DimIndigoauraListeners) do
      v(aura)
    end
  end

registerAnonymousEventHandler("IndigoauraEvent", "Handlers.IndigoauraHandler")
  local IndigoauraListeners = {}
  function Handlers.addIndigoauraListener(listenerName, functionToAdd)
    IndigoauraListeners[listenerName] = functionToAdd
  end

  function Handlers.removeIndigoeauraListener(listenerName)
    IndigoauraListeners[listenerName] = nil
  end

  function Handlers.IndigoauraHandler(aura)
    for l,v in pairs(IndigoauraListeners) do
      v(aura)
    end
  end

registerAnonymousEventHandler("IntenseIndigoauraEvent", "Handlers.IntenseIndigoauraHandler")
  local IntenseIndigoauraListeners = {}
  function Handlers.addIntenseIndigoauraListener(listenerName, functionToAdd)
    IntenseIndigoauraListeners[listenerName] = functionToAdd
  end

  function Handlers.removeIntenseIndigoeauraListener(listenerName)
    IntenseIndigoauraListeners[listenerName] = nil
  end

  function Handlers.IntenseIndigoauraHandler(aura)
    for l,v in pairs(IntenseIndigoauraListeners) do
      v(aura)
    end
  end

registerAnonymousEventHandler("DimVioletauraEvent", "Handlers.DimVioletauraHandler")
  local DimVioletauraListeners = {}
  function Handlers.addDimVioletauraListener(listenerName, functionToAdd)
    DimVioletauraListeners[listenerName] = functionToAdd
  end

  function Handlers.removeDimVioleteauraListener(listenerName)
    DimVioletauraListeners[listenerName] = nil
  end

  function Handlers.DimVioletauraHandler(aura)
    for l,v in pairs(DimVioletauraListeners) do
      v(aura)
    end
  end

registerAnonymousEventHandler("VioletauraEvent", "Handlers.VioletauraHandler")
  local VioletauraListeners = {}
  function Handlers.addVioletauraListener(listenerName, functionToAdd)
    VioletauraListeners[listenerName] = functionToAdd
  end

  function Handlers.removeVioleteauraListener(listenerName)
    VioletauraListeners[listenerName] = nil
  end

  function Handlers.VioletauraHandler(aura)
    for l,v in pairs(VioletauraListeners) do
      v(aura)
    end
  end

registerAnonymousEventHandler("IntenseVioletauraEvent", "Handlers.IntenseVioletauraHandler")
  local IntenseVioletauraListeners = {}
  function Handlers.addIntenseVioletauraListener(listenerName, functionToAdd)
    IntenseVioletauraListeners[listenerName] = functionToAdd
  end

  function Handlers.removeIntenseVioleteauraListener(listenerName)
    IntenseVioletauraListeners[listenerName] = nil
  end

  function Handlers.IntenseVioletauraHandler(aura)
    for l,v in pairs(IntenseVioletauraListeners) do
      v(aura)
    end
  end

registerAnonymousEventHandler("DimOctarineauraEvent", "Handlers.DimOctarineauraHandler")
  local DimOctarineauraListeners = {}
  function Handlers.addDimOctarineauraListener(listenerName, functionToAdd)
    DimOctarineauraListeners[listenerName] = functionToAdd
  end

  function Handlers.removeDimOctarineeauraListener(listenerName)
    DimOctarineauraListeners[listenerName] = nil
  end

  function Handlers.DimOctarineauraHandler(aura)
    for l,v in pairs(DimOctarineauraListeners) do
      v(aura)
    end
  end

registerAnonymousEventHandler("OctarineauraEvent", "Handlers.OctarineauraHandler")
  local OctarineauraListeners = {}
  function Handlers.addOctarineauraListener(listenerName, functionToAdd)
    OctarineauraListeners[listenerName] = functionToAdd
  end

  function Handlers.removeOctarineeauraListener(listenerName)
    OctarineauraListeners[listenerName] = nil
  end

  function Handlers.OctarineauraHandler(aura)
    for l,v in pairs(OctarineauraListeners) do
      v(aura)
    end
  end

registerAnonymousEventHandler("IntenseOctarineauraEvent", "Handlers.IntenseOctarineauraHandler")
  local IntenseOctarineauraListeners = {}
  function Handlers.addIntenseOctarineauraListener(listenerName, functionToAdd)
    IntenseOctarineauraListeners[listenerName] = functionToAdd
  end

  function Handlers.removeIntenseOctarineeauraListener(listenerName)
    IntenseOctarineauraListeners[listenerName] = nil
  end

  function Handlers.IntenseOctarineauraHandler(aura)
    for l,v in pairs(IntenseOctarineauraListeners) do
      v(aura)
    end
  end

registerAnonymousEventHandler("ScintilatingauraEvent", "Handlers.ScintilatingauraHandler")
  local ScintilatingauraListeners = {}
  function Handlers.addScintilatingauraListener(listenerName, functionToAdd)
    ScintilatingauraListeners[listenerName] = functionToAdd
  end

  function Handlers.removeScintilatingeauraListener(listenerName)
    ScintilatingauraListeners[listenerName] = nil
  end

  function Handlers.ScintilatingauraHandler(aura)
    for l,v in pairs(ScintilatingauraListeners) do
      v(aura)
    end
  end
