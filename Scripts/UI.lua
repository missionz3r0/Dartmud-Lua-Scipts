local UI = {}

local sourceName = "ui"

local windows = {}
local windows_ByPosition = {}
windows_ByPosition.topRight = {}
windows_ByPosition.topLeft = {}
windows_ByPosition.right = {}

local tabBar = {}
local tabs = {}

local topBorder = 164
local tabSize = 40
local bottomBorder = 0

local topLeftMinSize = 700
local topRightMinSize = 500

local topLeftWidth = 0
local rightWidth = 0

local function createUIConsole()

  local border = {}
  local container = {}

  local x, y = getMainWindowSize()

  if(x <= topLeftMinSize) then
    topLeftWidth = x-4
    rightWidth = 0
  elseif (x > topLeftMinSize and x < (topLeftMinSize+topRightMinSize)) then
    topLeftWidth = topLeftMinSize-4
    rightWidth = x-topLeftMinSize
  else
    topLeftWidth = x - topRightMinSize
    rightWidth = topRightMinSize
  end

  setBorderTop(topBorder)
  setBorderBottom(bottomBorder)
  setBorderRight(rightWidth)

  local height = topBorder - 4
  local fontSize = 10
  local fontWidth = calcFontSize(fontSize)
  local wrap = topLeftWidth/fontWidth
  local y = 5
  local yDelta = 15

  border = Geyser.Label:new({x=topLeftWidth,y=0,width=rightWidth+4,height=height+4})
  border:setStyleSheet([[border:2px solid white;background-color: black]])

  local name = "NameBox"

  container = Geyser.MiniConsole:new({  name=name,
                                        x=2, y=y,
                                        fontSize=fontSize,
                                        width="99%", height=yDelta,
                                        color="black"
                                      }, border)

  local window = {border = border
                 ,container = container}

  windows[name] = window
  windows_ByPosition["topRight"][name] = window
  y=y+yDelta

  local name = "AgeBox"
  container = Geyser.MiniConsole:new({  name=name,
                                        x=2, y=y,
                                        fontSize=fontSize,
                                        width="99%", height=yDelta,
                                        color="black"
                                      }, border)
  local window = {border = border
                 ,container = container}
  windows[name] = window
  windows_ByPosition["topRight"][name] = window
  y=y+yDelta


  local name = "HungerBox"
  container = Geyser.MiniConsole:new({  name=name,
                                        x=2, y=y,
                                        fontSize=fontSize,
                                        width="99%", height=yDelta,
                                        color="black"
                                      }, border)
  local window = {border = border
                 ,container = container}
  windows[name] = window
  windows_ByPosition["topRight"][name] = window
  y=y+yDelta

  local name = "ThirstBox"
  container = Geyser.MiniConsole:new({  name=name,
                                        x=2, y=y,
                                        fontSize=fontSize,
                                        width="99%", height=yDelta,
                                        color="black"
                                      }, border)
  local window = {border = border
                 ,container = container}
  windows[name] = window
  windows_ByPosition["topRight"][name] = window
  y=y+yDelta

  local name = "EncumbranceBox"
  container = Geyser.MiniConsole:new({  name=name,
                                        x=2, y=y,
                                        fontSize=fontSize,
                                        width="99%", height=yDelta,
                                        color="black"
                                      }, border)
  local window = {border = border
                 ,container = container}
  windows[name] = window
  windows_ByPosition["topRight"][name] = window
  y=y+yDelta

  local name = "MovementBox"
  container = Geyser.MiniConsole:new({  name=name,
                                        x=2, y=y,
                                        fontSize=fontSize,
                                        width="99%", height=yDelta,
                                        color="black"
                                      }, border)
  local window = {border = border
                 ,container = container}
  windows[name] = window
  windows_ByPosition["topRight"][name] = window
  y=y+yDelta

  local name = "DateBox"
  container = Geyser.MiniConsole:new({  name=name,
                                        x=2, y=y,
                                        fontSize=fontSize,
                                        width="99%", height=yDelta*2,
                                        color="black"
                                      }, border)
  local window = {border = border
                 ,container = container}
  windows[name] = window
  windows_ByPosition["topRight"][name] = window
  y=y+yDelta+20

  local name = "ConcBox"
  container = Geyser.MiniConsole:new({  name=name,
                                        x=2, y=y,
                                        fontSize=fontSize,
                                        width="99%", height=yDelta,
                                        color="black"
                                      }, border)
  local window = {border = border
                 ,container = container}
  windows[name] = window
  windows_ByPosition["topRight"][name] = window
  y=y+yDelta

  local name = "AuraBox"
  container = Geyser.MiniConsole:new({  name=name,
                                        x=2, y=y,
                                        fontSize=fontSize,
                                        width="99%", height=yDelta,
                                        color="black"
                                      }, border)
  local window = {border = border
                 ,container = container}
  windows[name] = window
  windows_ByPosition["topRight"][name] = window

  local name = "ChatBox"
  local height = topBorder - 4
  local fontSize = 10
  local fontWidth = calcFontSize(fontSize)
  local wrap = rightWidth/fontWidth

  border = Geyser.Label:new({x=0,y=0,width=topLeftWidth+4,height=height+4})
  border:setStyleSheet([[border:2px solid white;background-color: black]])

  container = Geyser.MiniConsole:new({  name=name,
                                        x=2, y=2,
                                        fontSize=fontSize,
                                        width=rightWidth-4, height=height,
                                        color="black"
                                      }, border)

  local window = {border = border
                 ,container = container}

  windows[name] = window
  windows_ByPosition["topLeft"][name] = window

  local height = y-topBorder - tabSize
  local fontSize = 10
  local fontWidth = calcFontSize(fontSize)
  local wrap = rightWidth/fontWidth

  border = Geyser.Label:new({name="General", x=topLeftWidth,y=topBorder + tabSize,width=rightWidth,height=height})
  border:setStyleSheet([[border:2px solid white;background-color: black]])

  tabs[0] = {}
  tabs[0].name = "General"
  tabs[0].border = border

  local name = "WhoBox"
  container = Geyser.MiniConsole:new({  name=name,
                                        x=2, y="1%",
                                        fontSize=fontSize,
                                        width="99%", height="48%",
                                        color="black"
                                      }, border)

  local window = {border = border
                 ,container = container}

  windows[name] = window
  windows_ByPosition["right"][name] = window

  local name = "ImpBox"
  container = Geyser.MiniConsole:new({  name=name,
                                        x=2, y="49%",
                                        fontSize=fontSize,
                                        width="99%", height="25%",
                                        color="black"
                                      }, border)
  setWindowWrap(name, wrap)

  local window = {border = border
  ,container = container}

  windows[name] = window
  windows_ByPosition["right"][name] = window

  local name = "MessageHistoryBox"
  container = Geyser.MiniConsole:new({  name=name,
                                        x=2, y="74%",
                                        fontSize=fontSize,
                                        width="99%", height="25%",
                                        color="black"
                                      }, border)
  setWindowWrap(name, wrap)

  local window = {border = border
  ,container = container}

  windows[name] = window
  windows_ByPosition["right"][name] = window

  border = Geyser.Label:new({name="Magic", x=topLeftWidth,y=topBorder + tabSize,width=rightWidth,height=height})
  border:setStyleSheet([[border:2px solid white;background-color: black]])

  tabs[1] = {}
  tabs[1].name = "Magic"
  tabs[1].border = border

  border = Geyser.Label:new({name="Combat", x=topLeftWidth,y=topBorder + tabSize,width=rightWidth,height=height})
  border:setStyleSheet([[border:2px solid white;background-color: black]])

  tabs[2] = {}
  tabs[2].name = "Combat"
  tabs[2].border = border

  border = Geyser.Label:new({name="Location", x=topLeftWidth,y=topBorder + tabSize,width=rightWidth,height=height})
  border:setStyleSheet([[border:2px solid white;background-color: black]])

  tabs[3] = {}
  tabs[3].name = "Location"
  tabs[3].border = border

  hideWindow("Magic")
  hideWindow("Combat")
  hideWindow("Location")

  border = Geyser.Label:new({x=topLeftWidth,y=topBorder,width=rightWidth,height=tabSize})
  border:setStyleSheet([[border:2px solid white;background-color: black]])

  tabBar = border

  for i, v in pairs(tabs) do
    local tab = Geyser.Label:new({
      name = "tab_"..v.name
      ,x = 2 + (i * 45)
      ,y = 2
      ,width = 45
      ,height = tabSize-4
      ,message = [[<center>]]..v.name..[[</center>]]
    },border)
    tab:setStyleSheet([[border:1px solid white;background-color: black]])
    tab:setClickCallback("Events.raiseEvent","tab"..v.name.."ClickedEvent", {})
  end

end

local function onGeneralTabClick(args)
  showWindow("General")
  hideWindow("Magic")
  hideWindow("Combat")
  hideWindow("Location")
end

local function onMagicTabClick(args)
  hideWindow("General")
  showWindow("Magic")
  hideWindow("Combat")
  hideWindow("Location")
end

local function onCombatTabClick(args)
  hideWindow("General")
  hideWindow("Magic")
  showWindow("Combat")
  hideWindow("Location")
end

local function onLocationTabClick(args)
  hideWindow("General")
  hideWindow("Magic")
  hideWindow("Combat")
  showWindow("Location")
end

local function updateDisplay(args)
    local mainWidth, mainHeight = getMainWindowSize()
    local x = mainWidth
    local y = mainHeight

    local previousrightWidth = rightWidth

    if(x <= topLeftMinSize) then
      topLeftWidth = x
      rightWidth = 0
    elseif (x > topLeftMinSize and x < (topLeftMinSize+topRightMinSize)) then
      topLeftWidth = topLeftMinSize
      rightWidth = x-topLeftMinSize
    else
      topLeftWidth = x - topRightMinSize
      rightWidth = topRightMinSize
    end

    --We do this because setting the border is a window resize event.
    --If we didn't do this, we'd get stuck in an infinite loop.
    if previousrightWidth ~= rightWidth then
      setBorderRight(rightWidth)
    end

    local height = topBorder - 4
    local fontSize = 10
    local fontWidth = calcFontSize(fontSize)
    local topLeftWrap = topLeftWidth/fontWidth

    --Update Top Right Window
    for key,window in pairs(windows_ByPosition["topRight"]) do
      local border = window["border"]
      local container = window["container"]

      border:resize(rightWidth, topBorder)
      border:move(topLeftWidth,0)
      border:setStyleSheet([[border:2px solid white;background-color: black]])
    end

    --Update Top Left Window
    for key,window in pairs(windows_ByPosition["topLeft"]) do
      local border = window["border"]
      local container = window["container"]

      border:resize(topLeftWidth, topBorder)
      border:move(0,0)
      border:setStyleSheet([[border:2px solid white;background-color: black]])
      container:resize(topLeftWidth-4,topBorder - 4)
      setWindowWrap(key, topLeftWrap)
    end

    --Update Right Side Window
    for key,window in pairs(windows_ByPosition["right"]) do
      local border = window["border"]
      local container = window["container"]

      border:resize(rightWidth, y-topBorder - tabSize)
      border:move(topLeftWidth,topBorder + tabSize)
      border:setStyleSheet([[border:2px solid white;background-color: black]])
    end

    tabBar:move(topLeftWidth, topBorder)
    tabBar:resize(rightWidth, tabSize)
end

local function onChat(args)
  local text = args["message"]
	local ts = getTime(true, "hh:mm:ss")
  local container = windows["ChatBox"]["container"]
	container:echo(ts.." ")

	-- even though we get the text passed into the event we will get the text
  -- from buffer to preserve colors/formatting
	selectCurrentLine()
	copy()
	appendBuffer("ChatBox")
end

local function onImprove(args)
  local who = args["name"]
  local skill_name = args["skill_name"]
  local ts = getTime(true, "hh:mm:ss")
  local container = windows["ImpBox"]["container"]
  local count = 0
  local output = ''

  local skillVar = Skills.getSkill({who = who, skill_name = skill_name})

  if skillVar ~= -1 then
    count = tonumber(skillVar.count)+1
  else
    count = 1
  end

  local level = Skills.imp2lvl(count)
  local nextLevel = level.next_level
  if nextLevel == nil then
    if(who ~= Status.name) then
      output = ts.." ("..who..") "..skill_name.." - "..count.." ("..level.abbr..")"
    else
      output = ts.." "..skill_name.." - "..count.." ("..level.abbr..")"
    end
  else
    local tilNext = nextLevel.min - count
    if(who ~= Status.name) then
      output = ts.." ("..who..") "..skill_name.." - "..count.." ("..level.abbr..") - ("..tilNext.." / "..nextLevel.abbr..")"
    else
      output = ts.." "..skill_name.." - "..count.." ("..level.abbr..") - ("..tilNext.." / "..nextLevel.abbr..")"
    end
  end

  container:echo(" "..output.."\n")
end

local function onSkillMistake(args)
  local container = windows["ImpBox"]["container"]
  selectCurrentLine("ImpBox")
  deleteLine("ImpBox")
  container:echo("")
end

local function onWho(args)
  local container = windows["WhoBox"]["container"]
  selectCurrentLine()
  copy()
  appendBuffer("WhoBox")
  deleteLine()
end

local function onStartWho(args)
  local container = windows["WhoBox"]["container"]
  clearWindow("WhoBox")
  selectCurrentLine()
	copy()
	appendBuffer("WhoBox")
  Events.addListener("whoEvent", sourceName, onWho)
  deleteLine()
end

local function onWhoEnd(args)
  local container = windows["WhoBox"]["container"]
  selectCurrentLine()
  copy()
  appendBuffer("WhoBox")
  Events.removeListener("whoEvent", sourceName)
  deleteLine()
end

local function onName(args)
  name = args["name"]
  cecho("\n"..name)
  clearWindow("NameBox")
  cecho("NameBox", " Name: "..name)
  deleteLine()
end

local function onAge(args)
  years = args["years"]
  months = args["months"]
  clearWindow("AgeBox")
  cecho("AgeBox", " Age: "..years.." years, "..months.." months")
  deleteLine()
end

local function onHunger(args)
  hunger = args["hunger"]

  clearWindow("HungerBox")
  cecho("HungerBox", " Hunger: ")
  selectString(hunger, 1)
  copy()
  appendBuffer("HungerBox")
  moveCursorEnd()
end

local function onThirst(args)
  thirst = args["thirst"]

  clearWindow("ThirstBox")
  cecho("ThirstBox", " Thirst: ")
  selectString(thirst, 1)
  copy()
  appendBuffer("ThirstBox")
  deleteLine()
  moveCursorEnd()
end

local function onEncumbrance(args)
  encumbrance = args["encumbrance"]

  clearWindow("EncumbranceBox")
  cecho("EncumbranceBox", " Encumbrance: ")
  selectString(encumbrance, 1)
  copy()
  appendBuffer("EncumbranceBox")
  deleteLine()
  moveCursorEnd()
end

local function onMovement(args)
  movement = args["movement"]

  clearWindow("MovementBox")
  cecho("MovementBox", " Movement: ")
  selectString(movement, 1)
  copy()
  appendBuffer("MovementBox")
  deleteLine()
  moveCursorEnd()
end

local function onMessage(args)
  message = args["message"]


  cecho("MessageHistoryBox", " "..message)
end

local function onConc(args)
  conc = args["conc"]

  clearWindow("ConcBox")
  cecho("ConcBox", " Concentration: ")
  selectString(conc, 1)
  copy()
  appendBuffer("ConcBox")
  deleteLine()
  moveCursorEnd()
end

local function onAura(args)
  aura = args["aura"]

  clearWindow("AuraBox")
  cecho("AuraBox", " Aura: ")
  selectString(aura, 1)
  copy()
  appendBuffer("AuraBox")
  deleteLine()
  moveCursorEnd()
end

local function refreshUI(args)
  for key,window in pairs(windows) do
    local container = window["container"]

    insertText(container["name"], "")
  end

  clearWindow("DateBox")
  cecho("DateBox", " Date(common): "..date.format(os.time(), 3, "common").."\n Date(Thorpian): "..date.format(os.time(), 3, "thorpian"))
end

local function setup(args)
  createUIConsole()

  Events.addListener("sysWindowResizeEvent", sourceName, updateDisplay)
  Events.addListener("chatEvent", sourceName, onChat)
  Events.addListener("skillImproveEvent", sourceName, onImprove)
  Events.addListener("skillMistakeEvent", sourceName, onSkillMistake)
  Events.addListener("startWhoEvent", sourceName, onStartWho)
  Events.addListener("endWhoEvent", sourceName, onWhoEnd)
  Events.addListener("refreshUIEvent", sourceName, refreshUI)
  Events.addListener("nameEvent", sourceName, onName)
  Events.addListener("SoulAgeEvent", sourceName, onAge)
  Events.addListener("hungerEvent", sourceName, onHunger)
  Events.addListener("thirstEvent", sourceName, onThirst)
  Events.addListener("encumbranceEvent", sourceName, onEncumbrance)
  Events.addListener("movementEvent", sourceName, onMovement)
  Events.addListener("messageEvent", sourceName, onMessage)
  Events.addListener("concEvent", sourceName, onConc)
  Events.addListener("auraEvent", sourceName, onAura)

  Events.addListener("tabGeneralClickedEvent", sourceName, onGeneralTabClick)
  Events.addListener("tabMagicClickedEvent", sourceName, onMagicTabClick)
  Events.addListener("tabCombatClickedEvent", sourceName, onCombatTabClick)
  Events.addListener("tabLocationClickedEvent", sourceName, onLocationTabClick)
end

local function unsetup(args)
  Events.removeListener("sysWindowResizeEvent", sourceName)
  Events.removeListener("chatEvent", sourceName)
  Events.removeListener("skillImproveEvent", sourceName)
  Events.removeListener("skillMistakeEvent", sourceName)
  Events.removeListener("startWhoEvent", sourceName)
  Events.removeListener("whoEvent", sourceName)
  Events.removeListener("endWhoEvent", sourceName)
  Events.removeListener("nameEvent", sourceName)
  Events.removeListener("SoulAgeEvent", sourceName)
  Events.removeListener("hungerEvent", sourceName)
  Events.removeListener("thirstEvent", sourceName)
  Events.removeListener("encumbranceEvent", sourceName)
  Events.removeListener("movementEvent", sourceName)
  Events.removeListener("messageEvent", sourceName)
  Events.removeListener("concEvent", sourceName)
  Events.removeListener("auraEvent", sourceName)

  Events.removeListener("tabGeneralClickedEvent", sourceName)
  Events.removeListener("tabMagicClickedEvent", sourceName)
  Events.removeListener("tabCombatClickedEvent", sourceName)
  Events.removeListener("tabLocationClickedEvent", sourceName)

  for key,window in pairs(windows) do
    local container = window["container"]
    local border = window["border"]

    Geyser:remove(container)
    Geyser:remove(border)
  end

  windows = {}
  windows_ByPosition = {}
end

local function resetup(args)
  unsetup(args)
  resetup(args)
end


UI = {
  setup = setup
  ,unsetup = unsetup
  ,resetup = resetup
}

return UI
