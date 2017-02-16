
registerAnonymousEventHandler("auraEvent", "Handlers.AuraHandler")
  local AuraListeners = {}
  function Handlers.addAuraListener(listenerName, functionToAdd)
    AuraListeners[listenerName] = functionToAdd
  end

  function Handlers.removeAuraListener(listenerName)
    AuraListeners[listenerName] = nil
  end

  function Handlers.AuraHandler(event, aura)
    for l,v in pairs(AuraListeners) do
      v(aura)
    end
  end

registerAnonymousEventHandler("VeryDimRedauraEvent", "Handlers.VeryDimRedAuraHandler")
  local VeryDimRedAuraListeners = {}
  function Handlers.addVeryDimRedAuraListener(listenerName, functionToAdd)
    VeryDimRedAuraListeners[listenerName] = functionToAdd
  end

  function Handlers.removeVeryDimRedAuraListener(listenerName)
    VeryDimRedAuraListeners[listenerName] = nil
  end

  function Handlers.VeryDimRedAuraHandler(event, aura)
    for l,v in pairs(VeryDimRedAuraListeners) do
      v(aura)
    end
  end

registerAnonymousEventHandler("DimRedauraEvent", "Handlers.DimRedAuraHandler")
  local DimRedAuraListeners = {}
  function Handlers.addDimRedAuraListener(listenerName, functionToAdd)
    DimRedAuraListeners[listenerName] = functionToAdd
  end

  function Handlers.removeDimRedAuraListener(listenerName)
    DimRedAuraListeners[listenerName] = nil
  end

  function Handlers.DimRedAuraHandler(event, aura)
    for l,v in pairs(DimRedAuraListeners) do
      v(aura)
    end
  end

registerAnonymousEventHandler("RedauraEvent", "Handlers.RedAuraHandler")
  local RedAuraListeners = {}
  function Handlers.addRedAuraListener(listenerName, functionToAdd)
    RedAuraListeners[listenerName] = functionToAdd
  end

  function Handlers.removeRedAuraListener(listenerName)
    RedAuraListeners[listenerName] = nil
  end

  function Handlers.RedAuraHandler(event, aura)
    for l,v in pairs(RedAuraListeners) do
      v(aura)
    end
  end

registerAnonymousEventHandler("OrangishRedauraEvent", "Handlers.OrangishRedAuraHandler")
  local OrangishRedauraListeners = {}
  function Handlers.addOrangishRedAuraListener(listenerName, functionToAdd)
    OrangishRedauraListeners[listenerName] = functionToAdd
  end

  function Handlers.removeOrangishRedAuraListener(listenerName)
    OrangishRedauraListeners[listenerName] = nil
  end

  function Handlers.OrangishRedAuraHandler(event, aura)
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

  function Handlers.ReddishOrangeauraHandler(event, aura)
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

  function Handlers.OrangeauraHandler(event, aura)
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

  function Handlers.YellowishOrangeauraHandler(event, aura)
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

  function Handlers.OrangishYellowauraHandler(event, aura)
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

  function Handlers.YellowauraHandler(event, aura)
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

  function Handlers.GreenishYellowauraHandler(event, aura)
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

  function Handlers.YellowishGreenauraHandler(event, aura)
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

  function Handlers.GreenauraHandler(event, aura)
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

  function Handlers.BluishGreenauraHandler(event, aura)
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

  function Handlers.GreenishBlueauraHandler(event, aura)
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

  function Handlers.BlueauraHandler(event, aura)
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

  function Handlers.IntenseBlueauraHandler(event, aura)
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

  function Handlers.DimIndigoauraHandler(event, aura)
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

  function Handlers.IndigoauraHandler(event, aura)
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

  function Handlers.IntenseIndigoauraHandler(event, aura)
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

  function Handlers.DimVioletauraHandler(event, aura)
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

  function Handlers.VioletauraHandler(event, aura)
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

  function Handlers.IntenseVioletauraHandler(event, aura)
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

  function Handlers.DimOctarineauraHandler(event, aura)
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

  function Handlers.OctarineauraHandler(event, aura)
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

  function Handlers.IntenseOctarineauraHandler(event, aura)
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

  function Handlers.ScintilatingauraHandler(event, aura)
    for l,v in pairs(ScintilatingauraListeners) do
      v(aura)
    end
  end
