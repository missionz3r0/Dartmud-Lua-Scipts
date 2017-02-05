Handlers = {}

--Event Handlers.
--Why are we declaring all of these here though?
--Because you can't turn off an anonymous event handler. So
--I'm going to declare all the ones that I want here as well as the functions
--That will handle them. Then have the handler functions tell all the appropriate
--other functions what to do.
--This way we can add and remove listeners as we want.

--Name
registerAnonymousEventHandler("nameEvent", "Handlers.nameEventHandler")
  local nameEventListeners = {}
  function Handlers.addNameEventListener(listenerName, functionToAdd)
    nameEventListeners[listenerName] = functionToAdd
  end

  function Handlers.removeNameEventListener(listenerName)
    nameEventListeners[listenerName] = nil
  end

  function Handlers.nameEventHandler(name)
    for l,v in pairs(nameEventListeners) do
      v(name)
    end
  end

--Youth
registerAnonymousEventHandler("youthfullnessEvent", "Handlers.youthfullnessEventHandler")
  local youthfullnessEventListeners = {}
  function Handlers.addyouthfullnessEventListener(listenerName, functionToAdd)
    youthfullnessEventListeners[listenerName] = functionToAdd
  end

  function Handlers.removeyouthfullnessEventListener(listenerName)
    youthfullnessEventListeners[listenerName] = nil
  end

  function Handlers.youthfullnessEventHandler(youthfullness)
    for l,v in pairs(youthfullnessEventListeners) do
      v(youthfullness)
    end
  end

--SoulAge
registerAnonymousEventHandler("ageEvent", "Handlers.ageEventHandler")
  local ageEventListeners = {}
  function Handlers.addageEventListener(listenerName, functionToAdd)
    ageEventListeners[listenerName] = functionToAdd
  end

  function Handlers.removeageEventListener(listenerName)
    ageEventListeners[listenerName] = nil
  end

  function Handlers.ageEventHandler(years, months)
    for l,v in pairs(ageEventListeners) do
      v(years, months)
    end
  end

--Hunger
registerAnonymousEventHandler("hungerEvent", "Handlers.hungerEventHandler")
  local hungerEventListeners = {}
  function Handlers.addhungerEventListener(listenerName, functionToAdd)
    hungerEventListeners[listenerName] = functionToAdd
  end

  function Handlers.removehungerEventListener(listenerName)
    hungerEventListeners[listenerName] = nil
  end

  function Handlers.hungerEventHandler(hunger)
    for l,v in pairs(hungerEventListeners) do
      v(hunger)
    end
  end

--Thirst
registerAnonymousEventHandler("thirstEvent", "Handlers.thirstEventHandler")
  local thirstEventListeners = {}
  function Handlers.addthirstEventListener(listenerName, functionToAdd)
    thirstEventListeners[listenerName] = functionToAdd
  end

  function Handlers.removethirstEventListener(listenerName)
    thirstEventListeners[listenerName] = nil
  end

  function Handlers.thirstEventHandler(thirst)
    for l,v in pairs(thirstEventListeners) do
      v(thirst)
    end
  end

--Encumberance
registerAnonymousEventHandler("encumbranceEvent", "Handlers.encumbranceEventHandler")
  local encumbranceEventListeners = {}
  function Handlers.addencumbranceEventListener(listenerName, functionToAdd)
    encumbranceEventListeners[listenerName] = functionToAdd
  end

  function Handlers.removeencumbranceEventListener(listenerName)
    encumbranceEventListeners[listenerName] = nil
  end

  function Handlers.encumbranceEventHandler(encumberance)
    for l,v in pairs(encumbranceEventListeners) do
      v(encumberance)
    end
  end

--Concentration
registerAnonymousEventHandler("concEvent", "Handlers.concEventHandler")
  local concEventListeners = {}
  function Handlers.addconcEventListener(listenerName, functionToAdd)
    concEventListeners[listenerName] = functionToAdd
  end

  function Handlers.removeconcEventListener(listenerName)
    concEventListeners[listenerName] = nil
  end

  function Handlers.concEventHandler(conc)
    for l,v in pairs(concEventListeners) do
      v(conc)
    end
  end

registerAnonymousEventHandler("BEBTconcEvent", "Handlers.BEBTconcHandler")
  local BEBTconcEventListeners = {}
  function Handlers.addBEBTconcEventListener(listenerName, functionToAdd)
    BEBTconcEventListeners[listenerName] = functionToAdd
  end

  function Handlers.removeBEBTconcEventListener(listenerName)
    BEBTconcEventListeners[listenerName] = nil
  end

  function Handlers.BEBTconcEventHandler(conc)
    for l,v in pairs(BEBTconcEventListeners) do
      v(conc)
    end
  end

registerAnonymousEventHandler("BOBconcEvent", "Handlers.BOBconcHandler")
  local BOBconcEventListeners = {}
  function Handlers.addBOBconcEventListener(listenerName, functionToAdd)
    BOBconcEventListeners[listenerName] = functionToAdd
  end

  function Handlers.removeBOBconcEventListener(listenerName)
    BOBconcEventListeners[listenerName] = nil
  end

  function Handlers.BOBconcEventHandler(conc)
    for l,v in pairs(BOBconcEventListeners) do
      v(conc)
    end
  end

registerAnonymousEventHandler("SDconcEvent", "Handlers.SDconcHandler")
  local SDconcEventListeners = {}
  function Handlers.addSDconcEventListener(listenerName, functionToAdd)
    SDconcEventListeners[listenerName] = functionToAdd
  end

  function Handlers.removeSDconcEventListener(listenerName)
    SDconcEventListeners[listenerName] = nil
  end

  function Handlers.SDconcEventHandler(conc)
    for l,v in pairs(SDconcEventListeners) do
      v(conc)
    end
  end

registerAnonymousEventHandler("OBconcEvent", "Handlers.OBconcHandler")
  local OBconcEventListeners = {}
  function Handlers.addOBconcEventListener(listenerName, functionToAdd)
    OBconcEventListeners[listenerName] = functionToAdd
  end

  function Handlers.removeOBconcEventListener(listenerName)
    OBconcEventListeners[listenerName] = nil
  end

  function Handlers.OBconcEventHandler(conc)
    for l,v in pairs(OBconcEventListeners) do
      v(conc)
    end
  end

registerAnonymousEventHandler("DAOBconcEvent", "Handlers.DAOBconcHandler")
  local DAOBconcEventListeners = {}
  function Handlers.addDAOBconcEventListener(listenerName, functionToAdd)
    DAOBconcEventListeners[listenerName] = functionToAdd
  end

  function Handlers.removeDAOBconcEventListener(listenerName)
    DAOBconcEventListeners[listenerName] = nil
  end

  function Handlers.DAOBconcEventHandler(conc)
    for l,v in pairs(DAOBconcEventListeners) do
      v(conc)
    end
  end

registerAnonymousEventHandler("SHOTconcEvent", "Handlers.SHOTconcHandler")
  local SHOTconcEventListeners = {}
  function Handlers.addSHOTconcEventListener(listenerName, functionToAdd)
    SHOTconcEventListeners[listenerName] = functionToAdd
  end

  function Handlers.removeSHOTconcEventListener(listenerName)
    SHOTconcEventListeners[listenerName] = nil
  end

  function Handlers.SHOTconcEventHandler(conc)
    for l,v in pairs(SHOTconcEventListeners) do
      v(conc)
    end
  end

registerAnonymousEventHandler("TCTRNconcEvent", "Handlers.TCTRNconcHandler")
  local TCTRNconcEventListeners = {}
  function Handlers.addTCTRNconcEventListener(listenerName, functionToAdd)
    TCTRNconcEventListeners[listenerName] = functionToAdd
  end

  function Handlers.removeTCTRNconcEventListener(listenerName)
    TCTRNconcEventListeners[listenerName] = nil
  end

  function Handlers.TCTRNconcEventHandler(conc)
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

  function Handlers.UnconsciousEventHandler(conc)
    for l,v in pairs(UnconsciousEventListeners) do
      v(conc)
    end
  end

--Movement
registerAnonymousEventHandler("movementEvent", "Handlers.movementEventHandler")
  local movementEventListeners = {}
  function Handlers.addmovementEventListener(listenerName, functionToAdd)
    movementEventListeners[listenerName] = functionToAdd
  end

  function Handlers.removemovementEventListener(listenerName)
    movementEventListeners[listenerName] = nil
  end

  function Handlers.movementEventHandler(conc)
    for l,v in pairs(movementEventListeners) do
      v(conc)
    end
  end

--Aura
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

--Alignment
registerAnonymousEventHandler("alignmentEvent", "Handlers.alignmentHandler")
  local alignmentListeners = {}
  function Handlers.addalignmentListener(listenerName, functionToAdd)
    alignmentListeners[listenerName] = functionToAdd
  end

  function Handlers.removealignmentListener(listenerName)
    alignmentListeners[listenerName] = nil
  end

  function Handlers.alignmentHandler(conviction, alignment)
    for l,v in pairs(alignmentListeners) do
      v(conviction, alignment)
    end
  end

--Skills
registerAnonymousEventHandler("skillImproveEvent", "Handlers.skillImproveHandler")
  local skillImproveListeners = {}
  function Handlers.addskillImproveListener(listenerName, functionToAdd)
    skillImproveListeners[listenerName] = functionToAdd
  end

  function Handlers.removeskillImproveListener(listenerName)
    skillImproveListeners[listenerName] = nil
  end

  function Handlers.skillImproveHandler(who, skill)
    for l,v in pairs(skillImproveListeners) do
      v(who, skill)
    end
  end

registerAnonymousEventHandler("skillMistakeEvent", "Handlers.skillMistakeHandler")
  local skillMistakeListeners = {}
  function Handlers.addskillMistakeListener(listenerName, functionToAdd)
    skillMistakeListeners[listenerName] = functionToAdd
  end

  function Handlers.removeskillMistakeListener(listenerName)
    skillMistakeListeners[listenerName] = nil
  end

  function Handlers.skillMistakeeHandler(who, skill)
    for l,v in pairs(skillMistakeListeners) do
      v(who, skill)
    end
  end

registerAnonymousEventHandler("sysWindowResizeEvent", "Handlers.windowResizeHandler")
  local windowResizeListeners = {}
  function Handlers.addwindowResizeListener(listenerName, functionToAdd)
    windowResizeListeners[listenerName] = functionToAdd
  end

  function Handlers.removewindowResizeListener(listenerName)
    windowResizeListeners[listenerName] = nil
  end

  function Handlers.windowResizeHandler(event, x, y)
    for k,v in pairs(windowResizeListeners) do
      v(event, x, y)
    end
  end

registerAnonymousEventHandler("chatEvent", "Handlers.chatHandler")
  local chatListeners = {}
  function Handlers.addchatListener(listenerName, functionToAdd)
    chatListeners[listenerName] = functionToAdd
  end

  function Handlers.removechatListener(listenerName)
    chatListeners[listenerName] = nil
  end

  function Handlers.chatHandler(event, text)
    for l,v in pairs(chatListeners) do
      v(event, text)
    end
  end

return Handlers
