local UI = {}

local sourceName = "ui"

local topBorder = 164
local bottomBorder = 0

local chat_border = nil
local alt_border = nil

local chat_container = nil
local imp_container = nil
local alt_container = nil
local alt_containers = {}

local chatBoxMinSize = 700
local altBoxMaxSize = 500

local chatWidth = 0
local altWidth = 0

local function updateDisplay(x, y)
    local mainWidth, mainHeight = getMainWindowSize()
    local x = mainWidth
    local y = mainHeight

    local previousAltWidth = altWidth

    if(x <= chatBoxMinSize) then
      chatWidth = x
      altWidth = 0
    elseif (x > chatBoxMinSize and x < (chatBoxMinSize+altBoxMaxSize)) then
      chatWidth = chatBoxMinSize
      altWidth = x-chatBoxMinSize
    else
      chatWidth = x - altBoxMaxSize
      altWidth = altBoxMaxSize
    end

    if previousAltWidth ~= altWidth then
      setBorderRight(altWidth)
    end

    local height = 160
    local fontSize = 10
    local fontWidth = calcFontSize(fontSize)
    local chatWrap = chatWidth/fontWidth
    local altWrap = altWidth/fontWidth

    if alt_border then
      alt_border:resize(altWidth, 164)
      alt_border:move(chatWidth,0)
      alt_border:setStyleSheet([[border:2px solid white;background-color: black]])
      alt_container:resize(altWidth,160)
    end

  	if chat_border then
  		chat_border:resize(chatWidth, 164)
  		chat_border:move(0, 0)
  		chat_container:resize(chatWidth-4,160)
  		setWindowWrap("ChatBox", chatWrap)
  	end
end

local function onChat(text)
	local ts = getTime(true, "hh:mm:ss")
	chat_container:echo(ts.." ")
	--[[ even though we get the text passed into the event get text from buffer
		  to preserve colors/formatting
	]]
	selectCurrentLine()
	copy()
	appendBuffer("ChatBox")
end

local function onImprove(who, skill)
  local ts = getTime(true, "hh:mm:ss")

  local skill = Skills.getSkill(who, skill)
  local count = toNumber(skill.Count)

  local level = Skills.imp2lvl(count)
  local nextLevel = Skills.nextLevel(count)
  local tilNext = nextLevel.min - count

  if(who ~= Status.name) then
    output = ts.." ("..who..") "..skill.." - "..count.." ("..level..")"
  else
    output = ts.." "..skill.." - "..count.." ("..level..")"
  end



  imp_container:echo(ts.." ".. who .. " ".. skill.."\n")
end

local function load()
  setBorderTop(topBorder)
  setBorderBottom(bottomBorder)

  local mainWidth, mainHeight = getMainWindowSize()
  local x = mainWidth
  local y = mainHeight

  if(x <= chatBoxMinSize) then
    chatWidth = x
    altWidth = 0
  elseif (x > chatBoxMinSize and x < (chatBoxMinSize+altBoxMaxSize)) then
    chatWidth = chatBoxMinSize
    altWidth = x-chatBoxMinSize
  else
    chatWidth = x - altBoxMaxSize
    altWidth = altBoxMaxSize
  end
  setBorderRight(altWidth)

  local height = 160
  local fontSize = 10
  local fontWidth = calcFontSize(fontSize)
  local chatWrap = chatWidth/fontWidth
  local altWrap = altWidth/fontWidth

  alt_border = Geyser.Label:new({x=chatWidth,y=0,width=altWidth+4,height=height+4})
  alt_border:setStyleSheet([[border:2px solid white;background-color: black]])

  imp_container = Geyser.MiniConsole:new({
    name="ImpBox",
    x=2, y=2,
    fontSize=fontSize,
    width=altWidth-4, height=height,
    color="black"
  }, alt_border)

  chat_border = Geyser.Label:new({x=0,y=0,width=chatWidth+4,height=height+4})
  chat_border:setStyleSheet([[border:2px solid white;background-color: black]])

  chat_container = Geyser.MiniConsole:new({
      name="ChatBox",
      x=2, y=2,
      fontSize=fontSize,
      width=chatWidth, height=height,
      color="black"
  }, chat_border)
  setWindowWrap("ChatBox", chatWrap)

  Handlers.addWindowResizeListener(sourceName, updateDisplay)
  Handlers.addChatListener(sourceName, onChat)
  Handlers.addSkillImproveListener(sourceName, onImprove)

  alt_container = imp_container
  alt_containers["imp_container"] = imp_container

  triggers = tempTriggers
end

local function unload()
  Handlers.removeWindowResizeListener(sourceName)
  Handlers.removeChatListener(sourceName)
  Handlers.removeSkillImproveListener(sourceName)
  resetProfile()
end

local function reload()
  unload()
  reload()
end


UI = {
  load = load
  ,unload = unload
  ,reload = reload
}

return UI
