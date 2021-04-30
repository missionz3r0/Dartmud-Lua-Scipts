local AntiSpam = {}

local sourceName = "antispam"

local isAntiSpam = false
local numLinesToCheck = 20
local textMemory = {}

local function blockSpam(args)
  local text = args["text"]

  local linesToDelete = {}
  local currentLineNum = getLineNumber()

  if currentLineNum > 0 then
    local numDeleted = 0

    for i = 1, numLinesToCheck, 1 do
      moveCursor(0, currentLineNum-i)

      local cursorText = string.gsub(getCurrentLine(), ' x%d+', '')

      if(selectString(text, 1) > -1) and (string.len(text) == string.len(cursorText)) then
        linesToDelete[currentLineNum-i] = true
        numDeleted = numDeleted + 1

      end
    end

    if textMemory[text] ~= nil then
      if(os.time() - textMemory[text]["time"] < 200) then
        textMemory[text]["time"] = os.time()
        textMemory[text]["numDeleted"] = textMemory[text]["numDeleted"] + numDeleted
      else
        textMemory[text]["time"] = os.time()
        textMemory[text]["numDeleted"] = numDeleted
      end
    else
        textMemory[text] = {}

        textMemory[text]["time"] = os.time()
        textMemory[text]["numDeleted"] = numDeleted
    end


    for k,v in pairs(linesToDelete) do
      moveCursor(0, k)
      deleteLine()
    end

    moveCursorEnd("main")
    if(numDeleted > 0) and (text ~= '> ') then
      cecho(" <green>x"..textMemory[text]["numDeleted"]+1)
    end
    insertText("")
  end
end

local function antispamOn(args)
  Events.raiseEvent("messageEvent", {message="<yellow>AntiSpam On.\n"})
  Events.addListener("anyEvent",sourceName, blockSpam)
  AntiSpam.save()
end

local function antispamOff(args)
  Events.raiseEvent("messageEvent", {message="<yellow>AntiSpam Off.\n"})
  Events.removeListener("anyEvent",sourceName)
  AntiSpam.save()
end

local function setup(args)
  Events.addListener("antiSpamOnEvent",sourceName, antispamOn)
  Events.addListener("antiSpamOffEvent",sourceName, antispamOff)
end

local function unsetup(args)
  Events.removeListener("antiSpamOnEvent",sourceName)
  Events.removeListener("antiSpamOffEvent",sourceName)
end

local function resetup(args)
  unsetup(args)
  setup(args)
end

local function loaderFunction(sentTable)
  if sentTable then
    numLinesToCheck = sentTable["numLinesToCheck"]
    isAntiSpam = sentTable["isAntiSpam"]

    if(isAntiSpam) then
      antispamOn({})
    end
  end
end

local function load()
  Events.raiseEvent("loadEvent",{sourceName = sourceName, functionToSendData = loaderFunction})
end

local function save()
  Events.raiseEvent("saveEvent",
      {
        sourceName = sourceName
        ,tableToSave = {
          numLinesToCheck = numLinesToCheck
          ,isAntiSpam = isAntiSpam
        }
      })
end

AntiSpam = {
  setup = setup
  ,unsetup = unsetup
  ,resetup = resetup
  ,load = load
  ,save = save
}

return AntiSpam
