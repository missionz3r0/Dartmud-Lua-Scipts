local createTrigger = dm_test.utilities.createTrigger


local condensor = {}
local trigger = createTrigger("^(?:> )?([\\s\\S]+)")
--local alias = createAlias("\\")
local lines = {}
local deletes = 0

local function load()
end

local function unload()
  killTrigger(trigger.triggerID)
end

local function processNoMatch(text)
    local newLine = {}
    newLine.y = getLineCount()
    newLine.count = 1
    lines[text] = newLine
end

local function processMatch(text)
    lines[text].count = lines[text].count + 1
    moveCursor(0, lines[text].y)
    deleteLine()
    moveCursorEnd()
    cecho("<red> x"..lines[text].count.."\n")
    insertText("")

    for k,v in pairs(lines) do
      if v.y > lines[text].y then
        lines[k].y = lines[k].y - 1
      end
    end

    lines[text].y = getLineCount() - 1
end

local function processLine(tableVar)
    local text = tableVar[1]

    if (lines[text] == nil) then --if there is no match
      processNoMatch(text)
    else --if there is a match
      processMatch(text)
    end
    --display(lines)
end

trigger.addListener(processLine)

condensor = {
  load = load,
  unload = unload
}

return condensor
