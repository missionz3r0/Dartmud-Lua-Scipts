UI = {}

local triggers = {}

local topBorder = 164
local bottomBorder = 0

local chat_border = nil
local alt_border = nil

local chat_container = nil
local imp_container = nil
local alt_container = nil
local alt_containers = {}

local updateDisplayListenerName = "updateDisplay"
local updateChatBoxListenerName = "updateChatBox"
local improveBoxListenerName = "improveBox"

local chatBoxMinSize = 700
local altBoxMaxSize = 500

local chatWidth = 0
local altWidth = 0

local function updateDisplay(evt, x, y)
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

local function onChat(event, text)
	local ts = getTime(true, "hh:mm:ss")
	chat_container:echo(ts.." ")
	--[[ even though we get the text passed into the event get text from buffer
		  to preserve colors/formatting
	]]
	selectCurrentLine()
	copy()
	appendBuffer("ChatBox")
end

local function onImprove(event, who, skill)
  local ts = getTime(true, "hh:mm:ss")

  imp_container:echo(ts.." ".. who .. " ".. skill.."\n")
end

local function load()
  local tempTriggers = {}

  tempTriggers.generalChatTrigger = tempRegexTrigger("^(?:> )?.* (say|says|ask|asks|exclaim|exclaims|shout|shouts|yell|yells|tells) .*"
                              ,[[
                                raiseEvent("chatEvent", matches[1])
                              ]])
  tempTriggers.magicChatTrigger = tempRegexTrigger("^(?:> )?.*(A voice seems to say|A mental touch tells you).*"
                              ,[[
                                raiseEvent("chatEvent", matches[1])
                              ]])


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

  Handlers.addwindowResizeListener(updateDisplayListenerName, updateDisplay)
  Handlers.addchatListener(updateChatBoxListenerName, onChat)
  Handlers.addskillImproveListener(improveBoxListenerName, onImprove)

  alt_container = imp_container
  alt_containers["imp_container"] = imp_container

  triggers = tempTriggers
end

local function unload()
  for i,v in ipairs(triggers) do
    killTrigger(v)
  end
  Handlers.removewindowResizeListener(updateDisplayListenerName)
  Handlers.removechatListener(updateChatBoxListenerName)
  Handlers.removeskillImproveListener(improveBoxListenerName)
  resetProfile()
end

local function reload()
  unload()
  reload()
end


UI = {
  load = load,
  unload = unload,
  reload = reload
}

return UI
