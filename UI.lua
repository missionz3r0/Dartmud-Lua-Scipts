UI = {}

local triggers = {}

local topBorder = 164
local bottomBorder = 30

local chat_border = nil
local chat_container = nil

local updateDisplayListenerName = "updateDisplay"
local updateChatBoxListenerName = "updateChatBox"
local improveBoxListenerName = "improveBox"

local function updateDisplay(evt, x, y)
    local mainWidth, mainHeight = getMainWindowSize()
    x = mainWidth
    y = mainHeight
    local width = (x + 15) / 2
    local height = 160
    local fontSize = 10
    local fontWidth = calcFontSize(fontSize)
    local wrap = width/fontWidth
  	if chat_border then
  		chat_border:resize(width, 164)
  		chat_border:move(0, 0)
  		chat_container:resize(width-4,160)
  		setWindowWrap("ChatBox", wrap)
  		return
  	end

    chat_border = Geyser.Label:new({x=width+4,y=0,width=width+4,height=height+4})
    chat_border:setStyleSheet([[border:2px solid white;background-color: black]])

    chat_container = Geyser.MiniConsole:new({
        name="ChatBox",
        x=2, y=2,
        fontSize=fontSize,
        width=width, height=height,
        color="black"
    }, chat_border)
    setWindowWrap("ChatBox", wrap)
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
  x = mainWidth
  y = mainHeight
  local width = (x + 15) / 2
  local height = 160
  local fontSize = 10
  local fontWidth = calcFontSize(fontSize)
  local wrap = width/fontWidth

  chat_border = Geyser.Label:new({x=width+4,y=0,width=width+4,height=height+4})
  chat_border:setStyleSheet([[border:2px solid white;background-color: black]])

  chat_container = Geyser.MiniConsole:new({
      name="ChatBox",
      x=2, y=2,
      fontSize=fontSize,
      width=width, height=height,
      color="black"
  }, chat_border)
  setWindowWrap("ChatBox", wrap)

  display(updateDisplay)

  Handlers.addwindowResizeListener(updateDisplayListenerName, updateDisplay)
  Handlers.addchatListener(updateChatBoxListenerName, onChat)
  Handlers.addskillImproveListener(improveBoxListenerName, onImprove)

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
