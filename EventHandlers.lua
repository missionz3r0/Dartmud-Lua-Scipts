handlers = {}

--Event Handlers.
--Why are we declaring all of these here though?
--Because you can't turn off an anonymous event handler. So
--I'm going to declare all the ones that I want here as well as the functions
--That will handle them. Then have the handler functions tell all the appropriate
--other functions what to do.
--This way we can add and remove listeners as we want.

--Name
registerAnonymousEventHandler("nameEvent", "handlers.nameEventHandler")
  local nameEventListeners = {}
  function handlers.addNameEventListener(listenerName, functionToAdd)
    nameEventListeners[listenerName] = functionToAdd
  end

  function handlers.removeNameEventListener(listenerName)
    nameEventListeners[listenerName] = nil
  end

  function handlers.nameEventHandler(name)
    for i,v in ipairs(nameEventListeners) do
      v(name)
    end
  end

--Youth
registerAnonymousEventHandler("youthfullnessEvent", "handlers.youthfullnessEventHandler")
  local youthfullnessEventListeners = {}
  function handlers.addyouthfullnessEventListener(listenerName, functionToAdd)
    youthfullnessEventListeners[listenerName] = functionToAdd
  end

  function handlers.removeyouthfullnessEventListener(listenerName)
    youthfullnessEventListeners[listenerName] = nil
  end

  function handlers.youthfullnessEventHandler(youthfullness)
    for i,v in ipairs(youthfullnessEventListeners) do
      v(youthfullness)
    end
  end

--SoulAge
registerAnonymousEventHandler("ageEvent", "handlers.ageEventHandler")
  local ageEventListeners = {}
  function handlers.addageEventListener(listenerName, functionToAdd)
    ageEventListeners[listenerName] = functionToAdd
  end

  function handlers.removeageEventListener(listenerName)
    ageEventListeners[listenerName] = nil
  end

  function handlers.ageEventHandler(years, months)
    for i,v in ipairs(ageEventListeners) do
      v(years, months)
    end
  end

--Hunger
registerAnonymousEventHandler("hungerEvent", "handlers.hungerEventHandler")
  local hungerEventListeners = {}
  function handlers.addhungerEventListener(listenerName, functionToAdd)
    hungerEventListeners[listenerName] = functionToAdd
  end

  function handlers.removehungerEventListener(listenerName)
    hungerEventListeners[listenerName] = nil
  end

  function handlers.hungerEventHandler(hunger)
    for i,v in ipairs(hungerEventListeners) do
      v(hunger)
    end
  end

--Thirst
registerAnonymousEventHandler("thirstEvent", "handlers.thirstEventHandler")
  local thirstEventListeners = {}
  function handlers.addthirstEventListener(listenerName, functionToAdd)
    thirstEventListeners[listenerName] = functionToAdd
  end

  function handlers.removethirstEventListener(listenerName)
    thirstEventListeners[listenerName] = nil
  end

  function handlers.thirstEventHandler(thirst)
    for i,v in ipairs(thirstEventListeners) do
      v(thirst)
    end
  end

--Encumberance
registerAnonymousEventHandler("encumbranceEvent", "handlers.encumbranceEventHandler")
  local encumbranceEventListeners = {}
  function handlers.addencumbranceEventListener(listenerName, functionToAdd)
    encumbranceEventListeners[listenerName] = functionToAdd
  end

  function handlers.removeencumbranceEventListener(listenerName)
    encumbranceEventListeners[listenerName] = nil
  end

  function handlers.encumbranceEventHandler(encumberance)
    for i,v in ipairs(encumbranceEventListeners) do
      v(encumberance)
    end
  end

--Concentration
registerAnonymousEventHandler("concEvent", "handlers.concEventHandler")
  local concEventListeners = {}
  function handlers.addconcEventListener(listenerName, functionToAdd)
    concEventListeners[listenerName] = functionToAdd
  end

  function handlers.removeconcEventListener(listenerName)
    concEventListeners[listenerName] = nil
  end

  function handlers.concEventHandler(conc)
    for i,v in ipairs(concEventListeners) do
      v(conc)
    end
  end

registerAnonymousEventHandler("BEBTconcEvent", "handlers.BEBTconcHandler")
  local BEBTconcEventListeners = {}
  function handlers.addBEBTconcEventListener(listenerName, functionToAdd)
    BEBTconcEventListeners[listenerName] = functionToAdd
  end

  function handlers.removeBEBTconcEventListener(listenerName)
    BEBTconcEventListeners[listenerName] = nil
  end

  function handlers.BEBTconcEventHandler(conc)
    for i,v in ipairs(BEBTconcEventListeners) do
      v(conc)
    end
  end

registerAnonymousEventHandler("BOBconcEvent", "handlers.BOBconcHandler")
  local BOBconcEventListeners = {}
  function handlers.addBOBconcEventListener(listenerName, functionToAdd)
    BOBconcEventListeners[listenerName] = functionToAdd
  end

  function handlers.removeBOBconcEventListener(listenerName)
    BOBconcEventListeners[listenerName] = nil
  end

  function handlers.BOBconcEventHandler(conc)
    for i,v in ipairs(BOBconcEventListeners) do
      v(conc)
    end
  end

registerAnonymousEventHandler("SDconcEvent", "handlers.SDconcHandler")
  local SDconcEventListeners = {}
  function handlers.addSDconcEventListener(listenerName, functionToAdd)
    SDconcEventListeners[listenerName] = functionToAdd
  end

  function handlers.removeSDconcEventListener(listenerName)
    SDconcEventListeners[listenerName] = nil
  end

  function handlers.SDconcEventHandler(conc)
    for i,v in ipairs(SDconcEventListeners) do
      v(conc)
    end
  end

registerAnonymousEventHandler("OBconcEvent", "handlers.OBconcHandler")
  local OBconcEventListeners = {}
  function handlers.addOBconcEventListener(listenerName, functionToAdd)
    OBconcEventListeners[listenerName] = functionToAdd
  end

  function handlers.removeOBconcEventListener(listenerName)
    OBconcEventListeners[listenerName] = nil
  end

  function handlers.OBconcEventHandler(conc)
    for i,v in ipairs(OBconcEventListeners) do
      v(conc)
    end
  end

registerAnonymousEventHandler("DAOBconcEvent", "handlers.DAOBconcHandler")
  local DAOBconcEventListeners = {}
  function handlers.addDAOBconcEventListener(listenerName, functionToAdd)
    DAOBconcEventListeners[listenerName] = functionToAdd
  end

  function handlers.removeDAOBconcEventListener(listenerName)
    DAOBconcEventListeners[listenerName] = nil
  end

  function handlers.DAOBconcEventHandler(conc)
    for i,v in ipairs(DAOBconcEventListeners) do
      v(conc)
    end
  end

registerAnonymousEventHandler("SHOTconcEvent", "handlers.SHOTconcHandler")
  local SHOTconcEventListeners = {}
  function handlers.addSHOTconcEventListener(listenerName, functionToAdd)
    SHOTconcEventListeners[listenerName] = functionToAdd
  end

  function handlers.removeSHOTconcEventListener(listenerName)
    SHOTconcEventListeners[listenerName] = nil
  end

  function handlers.SHOTconcEventHandler(conc)
    for i,v in ipairs(SHOTconcEventListeners) do
      v(conc)
    end
  end

registerAnonymousEventHandler("TCTRNconcEvent", "handlers.TCTRNconcHandler")
  local TCTRNconcEventListeners = {}
  function handlers.addTCTRNconcEventListener(listenerName, functionToAdd)
    TCTRNconcEventListeners[listenerName] = functionToAdd
  end

  function handlers.removeTCTRNconcEventListener(listenerName)
    TCTRNconcEventListeners[listenerName] = nil
  end

  function handlers.TCTRNconcEventHandler(conc)
    for i,v in ipairs(TCTRNconcEventListeners) do
      v(conc)
    end
  end

registerAnonymousEventHandler("UnconsciousEvent", "handlers.UnconsciousEventHandler")
  local UnconsciousEventListeners = {}
  function handlers.addUnconsciousEventListener(listenerName, functionToAdd)
    UnconsciousEventListeners[listenerName] = functionToAdd
  end

  function handlers.removeUnconsciousEventListener(listenerName)
    UnconsciousEventListeners[listenerName] = nil
  end

  function handlers.UnconsciousEventHandler(conc)
    for i,v in ipairs(UnconsciousEventListeners) do
      v(conc)
    end
  end

--Movement
registerAnonymousEventHandler("movementEvent", "handlers.movementEventHandler")
  local movementEventListeners = {}
  function handlers.addmovementEventListener(listenerName, functionToAdd)
    movementEventListeners[listenerName] = functionToAdd
  end

  function handlers.removemovementEventListener(listenerName)
    movementEventListeners[listenerName] = nil
  end

  function handlers.movementEventHandler(conc)
    for i,v in ipairs(movementEventListeners) do
      v(conc)
    end
  end

--Aura
registerAnonymousEventHandler("auraEvent", "handlers.auraEventHandler")
  local auraEventListeners = {}
  function handlers.addauraEventListener(listenerName, functionToAdd)
    auraEventListeners[listenerName] = functionToAdd
  end

  function handlers.removeauraEventListener(listenerName)
    auraEventListeners[listenerName] = nil
  end

  function handlers.auraEventHandler(aura)
    for i,v in ipairs(auraEventListeners) do
      v(aura)
    end
  end

registerAnonymousEventHandler("VeryDimRedauraEvent", "handlers.VeryDimRedauraEventHandler")
  local VeryDimRedauraEventListeners = {}
  function handlers.addVeryDimRedauraEventListener(listenerName, functionToAdd)
    VeryDimRedauraEventListeners[listenerName] = functionToAdd
  end

  function handlers.removeVeryDimRedauraEventListener(listenerName)
    VeryDimRedauraEventListeners[listenerName] = nil
  end

  function handlers.VeryDimRedauraEventHandler(aura)
    for i,v in ipairs(VeryDimRedauraEventListeners) do
      v(aura)
    end
  end

registerAnonymousEventHandler("DimRedauraEvent", "handlers.DimRedauraEventHandler")
  local DimRedauraEventListeners = {}
  function handlers.addDimRedauraEventListener(listenerName, functionToAdd)
    DimRedauraEventListeners[listenerName] = functionToAdd
  end

  function handlers.removeDimRedauraEventListener(listenerName)
    DimRedauraEventListeners[listenerName] = nil
  end

  function handlers.DimRedauraEventHandler(aura)
    for i,v in ipairs(DimRedauraEventListeners) do
      v(aura)
    end
  end

registerAnonymousEventHandler("RedauraEvent", "handlers.RedauraEventHandler")
  local RedauraEventListeners = {}
  function handlers.addRedauraEventListener(listenerName, functionToAdd)
    RedauraEventListeners[listenerName] = functionToAdd
  end

  function handlers.removeRedauraEventListener(listenerName)
    RedauraEventListeners[listenerName] = nil
  end

  function handlers.RedauraEventHandler(aura)
    for i,v in ipairs(RedauraEventListeners) do
      v(aura)
    end
  end

registerAnonymousEventHandler("OrangishRedauraEvent", "handlers.OrangishRedauraEventHandler")
  local OrangishRedauraListeners = {}
  function handlers.addOrangishRedauraEventListener(listenerName, functionToAdd)
    OrangishRedauraListeners[listenerName] = functionToAdd
  end

  function handlers.removeOrangishRedauraEventListener(listenerName)
    OrangishRedauraListeners[listenerName] = nil
  end

  function handlers.OrangishRedauraEventHandler(aura)
    for i,v in ipairs(OrangishRedauraListeners) do
      v(aura)
    end
  end

registerAnonymousEventHandler("ReddishOrangeauraEvent", "handlers.ReddishOrangeauraHandler")
  local ReddishOrangeauraListeners = {}
  function handlers.addReddishOrangeauraListener(listenerName, functionToAdd)
    ReddishOrangeauraListeners[listenerName] = functionToAdd
  end

  function handlers.removeReddishOrangeauraListener(listenerName)
    ReddishOrangeauraListeners[listenerName] = nil
  end

  function handlers.ReddishOrangeauraHandler(aura)
    for i,v in ipairs(ReddishOrangeauraListeners) do
      v(aura)
    end
  end

registerAnonymousEventHandler("OrangeauraEvent", "handlers.OrangeauraHandler")
  local OrangeauraListeners = {}
  function handlers.addOrangeauraListener(listenerName, functionToAdd)
    OrangeauraListeners[listenerName] = functionToAdd
  end

  function handlers.removeOrangeauraListener(listenerName)
    OrangeauraListeners[listenerName] = nil
  end

  function handlers.OrangeauraHandler(aura)
    for i,v in ipairs(OrangeauraListeners) do
      v(aura)
    end
  end

registerAnonymousEventHandler("YellowishOrangeauraEvent", "handlers.YellowishOrangeauraHandler")
  local YellowishOrangeauraListeners = {}
  function handlers.addYellowishOrangeauraListener(listenerName, functionToAdd)
    YellowishOrangeauraListeners[listenerName] = functionToAdd
  end

  function handlers.removeYellowishOrangeeauraListener(listenerName)
    YellowishOrangeauraListeners[listenerName] = nil
  end

  function handlers.YellowishOrangeauraHandler(aura)
    for i,v in ipairs(YellowishOrangeauraListeners) do
      v(aura)
    end
  end

registerAnonymousEventHandler("OrangishYellowauraEvent", "handlers.OrangishYellowauraHandler")
  local OrangishYellowauraListeners = {}
  function handlers.addOrangishYellowauraListener(listenerName, functionToAdd)
    OrangishYellowauraListeners[listenerName] = functionToAdd
  end

  function handlers.removeOrangishYelloweauraListener(listenerName)
    OrangishYellowauraListeners[listenerName] = nil
  end

  function handlers.OrangishYellowauraHandler(aura)
    for i,v in ipairs(OrangishYellowauraListeners) do
      v(aura)
    end
  end

registerAnonymousEventHandler("YellowauraEvent", "handlers.YellowauraHandler")
  local YellowauraListeners = {}
  function handlers.addYellowauraListener(listenerName, functionToAdd)
    YellowauraListeners[listenerName] = functionToAdd
  end

  function handlers.removeYelloweauraListener(listenerName)
    YellowauraListeners[listenerName] = nil
  end

  function handlers.YellowauraHandler(aura)
    for i,v in ipairs(YellowauraListeners) do
      v(aura)
    end
  end

registerAnonymousEventHandler("GreenishYellowauraEvent", "handlers.GreenishYellowauraHandler")
  local GreenishYellowauraListeners = {}
  function handlers.addGreenishYellowauraListener(listenerName, functionToAdd)
    GreenishYellowauraListeners[listenerName] = functionToAdd
  end

  function handlers.removeGreenishYelloweauraListener(listenerName)
    GreenishYellowauraListeners[listenerName] = nil
  end

  function handlers.GreenishYellowauraHandler(aura)
    for i,v in ipairs(GreenishYellowauraListeners) do
      v(aura)
    end
  end

registerAnonymousEventHandler("YellowishGreenauraEvent", "handlers.YellowishGreenauraHandler")
  local YellowishGreenauraListeners = {}
  function handlers.addYellowishGreenauraListener(listenerName, functionToAdd)
    YellowishGreenauraListeners[listenerName] = functionToAdd
  end

  function handlers.removeYellowishGreeneauraListener(listenerName)
    YellowishGreenauraListeners[listenerName] = nil
  end

  function handlers.YellowishGreenauraHandler(aura)
    for i,v in ipairs(YellowishGreenauraListeners) do
      v(aura)
    end
  end

registerAnonymousEventHandler("GreenauraEvent", "handlers.GreenauraHandler")
  local GreenauraListeners = {}
  function handlers.addGreenauraListener(listenerName, functionToAdd)
    GreenauraListeners[listenerName] = functionToAdd
  end

  function handlers.removeGreeneauraListener(listenerName)
    GreenauraListeners[listenerName] = nil
  end

  function handlers.GreenauraHandler(aura)
    for i,v in ipairs(GreenauraListeners) do
      v(aura)
    end
  end

registerAnonymousEventHandler("BluishGreenauraEvent", "handlers.BluishGreenauraHandler")
  local BluishGreenauraListeners = {}
  function handlers.addBluishGreenauraListener(listenerName, functionToAdd)
    BluishGreenauraListeners[listenerName] = functionToAdd
  end

  function handlers.removeBluishGreeneauraListener(listenerName)
    BluishGreenauraListeners[listenerName] = nil
  end

  function handlers.BluishGreenauraHandler(aura)
    for i,v in ipairs(BluishGreenauraListeners) do
      v(aura)
    end
  end

registerAnonymousEventHandler("GreenishBlueauraEvent", "handlers.GreenishBlueauraHandler")
  local GreenishBlueauraListeners = {}
  function handlers.addGreenishBlueauraListener(listenerName, functionToAdd)
    GreenishBlueauraListeners[listenerName] = functionToAdd
  end

  function handlers.removeGreenishBlueeauraListener(listenerName)
    GreenishBlueauraListeners[listenerName] = nil
  end

  function handlers.GreenishBlueauraHandler(aura)
    for i,v in ipairs(GreenishBlueauraListeners) do
      v(aura)
    end
  end

registerAnonymousEventHandler("BlueauraEvent", "handlers.BlueauraHandler")
  local BlueauraListeners = {}
  function handlers.addBlueauraListener(listenerName, functionToAdd)
    BlueauraListeners[listenerName] = functionToAdd
  end

  function handlers.removeBlueeauraListener(listenerName)
    BlueauraListeners[listenerName] = nil
  end

  function handlers.BlueauraHandler(aura)
    for i,v in ipairs(BlueauraListeners) do
      v(aura)
    end
  end

registerAnonymousEventHandler("IntenseBlueauraEvent", "handlers.IntenseBlueauraHandler")
  local IntenseBlueauraListeners = {}
  function handlers.addIntenseBlueauraListener(listenerName, functionToAdd)
    IntenseBlueauraListeners[listenerName] = functionToAdd
  end

  function handlers.removeIntenseBlueeauraListener(listenerName)
    IntenseBlueauraListeners[listenerName] = nil
  end

  function handlers.IntenseBlueauraHandler(aura)
    for i,v in ipairs(IntenseBlueauraListeners) do
      v(aura)
    end
  end

registerAnonymousEventHandler("DimIndigoauraEvent", "handlers.DimIndigoauraHandler")
  local DimIndigoauraListeners = {}
  function handlers.addDimIndigoauraListener(listenerName, functionToAdd)
    DimIndigoauraListeners[listenerName] = functionToAdd
  end

  function handlers.removeDimIndigoeauraListener(listenerName)
    DimIndigoauraListeners[listenerName] = nil
  end

  function handlers.DimIndigoauraHandler(aura)
    for i,v in ipairs(DimIndigoauraListeners) do
      v(aura)
    end
  end

registerAnonymousEventHandler("IndigoauraEvent", "handlers.IndigoauraHandler")
  local IndigoauraListeners = {}
  function handlers.addIndigoauraListener(listenerName, functionToAdd)
    IndigoauraListeners[listenerName] = functionToAdd
  end

  function handlers.removeIndigoeauraListener(listenerName)
    IndigoauraListeners[listenerName] = nil
  end

  function handlers.IndigoauraHandler(aura)
    for i,v in ipairs(IndigoauraListeners) do
      v(aura)
    end
  end

registerAnonymousEventHandler("IntenseIndigoauraEvent", "handlers.IntenseIndigoauraHandler")
  local IntenseIndigoauraListeners = {}
  function handlers.addIntenseIndigoauraListener(listenerName, functionToAdd)
    IntenseIndigoauraListeners[listenerName] = functionToAdd
  end

  function handlers.removeIntenseIndigoeauraListener(listenerName)
    IntenseIndigoauraListeners[listenerName] = nil
  end

  function handlers.IntenseIndigoauraHandler(aura)
    for i,v in ipairs(IntenseIndigoauraListeners) do
      v(aura)
    end
  end

registerAnonymousEventHandler("DimVioletauraEvent", "handlers.DimVioletauraHandler")
  local DimVioletauraListeners = {}
  function handlers.addDimVioletauraListener(listenerName, functionToAdd)
    DimVioletauraListeners[listenerName] = functionToAdd
  end

  function handlers.removeDimVioleteauraListener(listenerName)
    DimVioletauraListeners[listenerName] = nil
  end

  function handlers.DimVioletauraHandler(aura)
    for i,v in ipairs(DimVioletauraListeners) do
      v(aura)
    end
  end

registerAnonymousEventHandler("VioletauraEvent", "handlers.VioletauraHandler")
  local VioletauraListeners = {}
  function handlers.addVioletauraListener(listenerName, functionToAdd)
    VioletauraListeners[listenerName] = functionToAdd
  end

  function handlers.removeVioleteauraListener(listenerName)
    VioletauraListeners[listenerName] = nil
  end

  function handlers.VioletauraHandler(aura)
    for i,v in ipairs(VioletauraListeners) do
      v(aura)
    end
  end

registerAnonymousEventHandler("IntenseVioletauraEvent", "handlers.IntenseVioletauraHandler")
  local IntenseVioletauraListeners = {}
  function handlers.addIntenseVioletauraListener(listenerName, functionToAdd)
    IntenseVioletauraListeners[listenerName] = functionToAdd
  end

  function handlers.removeIntenseVioleteauraListener(listenerName)
    IntenseVioletauraListeners[listenerName] = nil
  end

  function handlers.IntenseVioletauraHandler(aura)
    for i,v in ipairs(IntenseVioletauraListeners) do
      v(aura)
    end
  end

registerAnonymousEventHandler("DimOctarineauraEvent", "handlers.DimOctarineauraHandler")
  local DimOctarineauraListeners = {}
  function handlers.addDimOctarineauraListener(listenerName, functionToAdd)
    DimOctarineauraListeners[listenerName] = functionToAdd
  end

  function handlers.removeDimOctarineeauraListener(listenerName)
    DimOctarineauraListeners[listenerName] = nil
  end

  function handlers.DimOctarineauraHandler(aura)
    for i,v in ipairs(DimOctarineauraListeners) do
      v(aura)
    end
  end

registerAnonymousEventHandler("OctarineauraEvent", "handlers.OctarineauraHandler")
  local OctarineauraListeners = {}
  function handlers.addOctarineauraListener(listenerName, functionToAdd)
    OctarineauraListeners[listenerName] = functionToAdd
  end

  function handlers.removeOctarineeauraListener(listenerName)
    OctarineauraListeners[listenerName] = nil
  end

  function handlers.OctarineauraHandler(aura)
    for i,v in ipairs(OctarineauraListeners) do
      v(aura)
    end
  end

registerAnonymousEventHandler("IntenseOctarineauraEvent", "handlers.IntenseOctarineauraHandler")
  local IntenseOctarineauraListeners = {}
  function handlers.addIntenseOctarineauraListener(listenerName, functionToAdd)
    IntenseOctarineauraListeners[listenerName] = functionToAdd
  end

  function handlers.removeIntenseOctarineeauraListener(listenerName)
    IntenseOctarineauraListeners[listenerName] = nil
  end

  function handlers.IntenseOctarineauraHandler(aura)
    for i,v in ipairs(IntenseOctarineauraListeners) do
      v(aura)
    end
  end

registerAnonymousEventHandler("ScintilatingauraEvent", "handlers.ScintilatingauraHandler")
  local ScintilatingauraListeners = {}
  function handlers.addScintilatingauraListener(listenerName, functionToAdd)
    ScintilatingauraListeners[listenerName] = functionToAdd
  end

  function handlers.removeScintilatingeauraListener(listenerName)
    ScintilatingauraListeners[listenerName] = nil
  end

  function handlers.ScintilatingauraHandler(aura)
    for i,v in ipairs(ScintilatingauraListeners) do
      v(aura)
    end
  end

--Alignment
registerAnonymousEventHandler("alignmentEvent", "handlers.alignmentHandler")
  local alignmentListeners = {}
  function handlers.addalignmentListener(listenerName, functionToAdd)
    alignmentListeners[listenerName] = functionToAdd
  end

  function handlers.removealignmentListener(listenerName)
    alignmentListeners[listenerName] = nil
  end

  function handlers.alignmentHandler(conviction, alignment)
    for i,v in ipairs(alignmentListeners) do
      v(conviction, alignment)
    end
  end

--Skills
registerAnonymousEventHandler("skillImproveEvent", "handlers.skillImproveHandler")
  local skillImproveListeners = {}
  function handlers.addskillImproveListener(listenerName, functionToAdd)
    skillImprove[listenerName] = functionToAdd
  end

  function handlers.removeskillImproveListener(listenerName)
    skillImproveListeners[listenerName] = nil
  end

  function handlers.skillImproveHandler(who, skill)
    for i,v in ipairs(skillImproveListeners) do
      v(who, skill)
    end
  end

registerAnonymousEventHandler("skillMistakeEvent", "handlers.skillMistakeHandler")
  local skillMistakeListeners = {}
  function handlers.addskillMistakeListener(listenerName, functionToAdd)
    skillMistake[listenerName] = functionToAdd
  end

  function handlers.removeskillMistakeListener(listenerName)
    skillMistakeListeners[listenerName] = nil
  end

  function handlers.skillMistakeeHandler(who, skill)
    for i,v in ipairs(skillMistakeListeners) do
      v(who, skill)
    end
  end
return handlers
