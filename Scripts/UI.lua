local UI = {}

local sourceName = "ui"

local windows = {}
local windows_ByPosition = {}
windows_ByPosition.topRight = {}
windows_ByPosition.topLeft = {}
windows_ByPosition.right = {}


local buttonBarBorder = 0
local topBorder = 164
local bottomBorder = 0

local topLeftMinSize = 700
local topRightMinSize = 500

local topLeftWidth = 0
local rightWidth = 0

local function createUIConsole(name, position)
  local border = {}
  local container = {}

  local x, y = getMainWindowSize()

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


  if position == "topLeft" then
    local height = topBorder - 4
    local fontSize = 10
    local fontWidth = calcFontSize(fontSize)
    local wrap = topLeftWidth/fontWidth

    border = Geyser.Label:new({x=0,y=0,width=topLeftWidth+4,height=height+4})
    border:setStyleSheet([[border:2px solid white;background-color: black]])

    container = Geyser.MiniConsole:new({  name=name,
                                          x=2, y=2,
                                          fontSize=fontSize,
                                          width=topLeftWidth, height=height,
                                          color="black"
                                        }, border)
    setWindowWrap(name, wrap)

  elseif position == "topRight" then
    local height = topBorder - 4
    local fontSize = 10
    local fontWidth = calcFontSize(fontSize)
    local wrap = rightWidth/fontWidth

    border = Geyser.Label:new({x=topLeftWidth,y=0,width=rightWidth+4,height=height+4})
    border:setStyleSheet([[border:2px solid white;background-color: black]])

    container = Geyser.MiniConsole:new({  name=name,
                                          x=2, y=2,
                                          fontSize=fontSize,
                                          width=rightWidth-4, height=height,
                                          color="black"
                                        }, border)

  elseif position == "right" then
    local height = y-topBorder - buttonBarBorder - 4
    local fontSize = 10
    local fontWidth = calcFontSize(fontSize)
    local wrap = rightWidth/fontWidth

    border = Geyser.Label:new({x=topLeftWidth,y=topBorder + buttonBarBorder,width=rightWidth+4,height=height+4})
    border:setStyleSheet([[border:2px solid white;background-color: black]])

    container = Geyser.MiniConsole:new({  name=name,
                                          x=2, y=2,
                                          fontSize=fontSize,
                                          width=rightWidth-4, height=height,
                                          color="black"
                                        }, border)
  end

  local window = {border = border
                 ,container = container}

  windows[name] = window
  windows_ByPosition[position][name] = window
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
      container:resize(rightWidth-4,topBorder - 4)
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

      border:resize(rightWidth, y-topBorder)
      border:move(topLeftWidth,topBorder + buttonBarBorder)
      border:setStyleSheet([[border:2px solid white;background-color: black]])
      container:resize(rightWidth-4,y-topBorder - buttonBarBorder - 4)
    end
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
  local skill = args["skill_name"]
  local ts = getTime(true, "hh:mm:ss")
  local container = windows["ImpBox"]["container"]
  local count = 0
  local output = ''

  local skillVar = Skills.getSkill(args)

  if skillVar then
    count = tonumber(skillVar.count)+1
  else
    count = 1
  end

  local level = Skills.imp2lvl(count)
  local nextLevel = level.next_level
  local tilNext = nextLevel.min - count
  if(who ~= Status.name) then
    output = ts.." ("..who..") "..skill.." - "..count.." ("..level.abbr..") - ("..tilNext.." / "..nextLevel.abbr..")"
  else
    output = ts.." "..skill.." - "..count.." ("..level.abbr..") - ("..tilNext.." / "..nextLevel.abbr..")"
  end

  container:echo(output.."\n")
end

local function onSkillMistake(args)
  local container = windows["ImpBox"]["container"]
  selectCurrentLine("ImpBox")
  deleteLine("ImpBox")
  container:echo("")
end

local function onStartWho(args)
  local container = windows["WhoBox"]["container"]
  clearWindow("WhoBox")
  selectCurrentLine()
	copy()
	appendBuffer("WhoBox")
end

local function onWho(args)
  local container = windows["WhoBox"]["container"]
  selectCurrentLine()
  copy()
  appendBuffer("WhoBox")
end

local function onWhoEnd(args)
  local container = windows["WhoBox"]["container"]
  selectCurrentLine()
  copy()
  appendBuffer("WhoBox")
end

local function refreshUI(args)
  for key,window in pairs(windows) do
    local container = window["container"]

    container:cecho("")
  end
end

local function load(args)
  setBorderTop(topBorder+buttonBarBorder)
  setBorderBottom(bottomBorder)
  setBorderRight(rightWidth)

  createUIConsole("ImpBox","topRight")
  createUIConsole("ChatBox","topLeft")
  createUIConsole("WhoBox","right")

  Events.addListener("sysWindowResizeEvent", sourceName, updateDisplay)
  Events.addListener("chatEvent", sourceName, onChat)
  Events.addListener("skillImproveEvent", sourceName, onImprove)
  Events.addListener("skillMistakeEvent", sourceName, onSkillMistake)
  Events.addListener("startWhoEvent", sourceName, onStartWho)
  Events.addListener("whoEvent", sourceName, onWho)
  Events.addListener("endWhoEvent", sourceName, onWhoEnd)
  Events.addListener("refreshUIEvent", sourceName, refreshUI)
end

local function unload(args)
  Events.removeListener("sysWindowResizeEvent", sourceName)
  Events.removeListener("chatEvent", sourceName)
  Events.removeListener("skillImproveEvent", sourceName)
  Events.removeListener("skillMistakeEvent", sourceName)
  Events.removeListener("startWhoEvent", sourceName)
  Events.removeListener("whoEvent", sourceName)
  Events.removeListener("endWhoEvent", sourceName)
  Events.removeListener("refreshUIEvent", sourceName)

  for key,window in pairs(windows) do
    local container = window["container"]
    local border = window["border"]

    Geyser:remove(container)
    Geyser:remove(border)
  end

  windows = {}
  windows_ByPosition = {}
end

local function reload(args)
  unload(args)
  reload(args)
end


UI = {
  load = load
  ,unload = unload
  ,reload = reload
}

return UI
