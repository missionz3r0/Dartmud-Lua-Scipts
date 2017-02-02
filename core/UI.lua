UI = {}

local topBorder = 164
local bottomBorder = 30
local leftBorder = 0
local rightBorder = 0

local chat_border = nil
local chat_container = nil

local function load()
  setBorderTop(topBorder)
  setLeftBorder(leftBorder)
  setRightBorder(rightBorder)
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
end

local function updateDisplay(evt, x, y)
  local mainWidth, mainHeight = getMainWindowSize()
  x = mainWidth
  y = mainHeight
  local width = (x + 15) / 2
  local height = 160
  local fontSize = 10
  local fontWidth = calcFontSize(fontSize)
  local wrap = width/fontWidth

  if skill_border then
      skill_border:resize(width, topBorder)
      skill_border:move(width-2,0)
      skill_border:setStyleSheet([[border:2px solid white;background-color: black]])
      skill_container:resize(width-4,topBorder-4)
      --setWindowWrap("SkillBox", wrap)
  end
  if chat_border then
      chat_border:resize(width, topBorder)
      chat_border:move(0, 0)
      chat_container:resize(width-4,topBorder-4)
      setWindowWrap("ChatBox", wrap)
  end
end
