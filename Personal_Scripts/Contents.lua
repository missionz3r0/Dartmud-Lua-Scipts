local Contents = {}

local sourceName = "contents"

aliases = {}
triggers = {}

label = ""
totalContents = {}
byRoomContents = {}
byContainerbyRoomContents = {}

local function contentsClear(args)
  totalContents = {}
  byRoomContents = {}
  byContainerbyRoomContents = {}
end

local function contentsSetup(args)
  tempTriggers = {}

  tempTriggers.BeginOfContents =
    tempRegexTrigger('^(?:> )?\\[.+(?:labeled "(.+)")\\]'
                     ,[[
                         local label = ""
                         if matches[2] == nil then
                           label = matches[1]
                         else
                           label = matches[2]
                         end

                        local arguments = {label = label}
                        Events.raiseEvent("StartContentsEvent", arguments)
                      ]])

  tempTriggers.Contents =
    tempRegexTrigger("^(?:> )? +(\\d+|a|an) (?:(\\w*) of )?(.+)"
                     ,[[
                        local number =  matches[2]
                        local of =  matches[3]
                        local item =  matches[4]

                        if number == "a" or number == "an" then
                          number = 1
                        else
                          number = tonumber(number)
                        end

                        if of == nil then
                          of = ""
                        end
                        local arguments = { number = number, of = of, item = item }
                        Events.raiseEvent("parseContentsEvent", arguments)
                      ]])

  tempTriggers.MoreContents =
    tempRegexTrigger("^(?:> )?More \\(.+\\)"
                     ,[[
                        send("\\n")
                      ]])

  tempTriggers.EndOfContents =
    tempRegexTrigger("^(?:> )?<End of Text>"
                     ,[[
                        Events.raiseEvent("EndContentsEvent", {})
                      ]])

  triggers = tempTriggers
end

local function startOfContents(args)
  label = args["label"]
end

local function parseContents(args)
  local number = args["number"]
  local of = args["of"]
  local item = args["item"]

  if (totalContents[item] == nil) then
    totalContents[item] = {}
    totalContents[item]["number"] = number
    totalContents[item]["of"] = of
  else
    totalContents[item]["number"] = totalContents[item]["number"] + number
  end
end

local function endContents(args)
  for i,v in pairs(triggers) do
    killTrigger(v)
  end
  triggers = {}

  display(totalContents)
end


local function setup(args)
  tempAliases = {}

  tempAliases.contents =
    tempAlias("\\/[Cc][Oo][Nn][Tt][Ee][Nn][Tt][Ss] (.+)"
              ,[[
                local target = matches[2]
                local arguments = {target = target}

                Events.raiseEvent("contentsEvent", arguments)
                send("contents "..target)
              ]])

  tempAliases.clearContents =
    tempAlias("\\/[Cc][Oo][Nn][Tt][Ee][Nn][Tt][Ss] [Cc][Ll][Ee][Aa][Rr]"
              ,[[
                Events.raiseEvent("contentsClearEvent", {})
              ]])

  Events.addListener("contentsEvent", sourceName, contentsSetup)
  Events.addListener("contentsClearEvent", sourceName, contentsClear)
  Events.addListener("StartContentsEvent", sourceName, startOfContents)
  Events.addListener("parseContentsEvent", sourceName, parseContents)
  Events.addListener("EndContentsEvent", sourceName, endContents)

  aliases = tempAliases
end

local function unsetup(args)
  Events.removeListener("contentsEvent", sourceName)
  Events.removeListener("contentsClearEvent", sourceName)
  Events.removeListener("StartContentsEvent", sourceName)
  Events.removeListener("ContentsEvent", sourceName)
  Events.removeListener("EndContentsEvent", sourceName)

  for i,v in pairs(aliases) do
    killAlias(v)
  end
  aliases = {}

  for i,v in pairs(triggers) do
    killTrigger(v)
  end
  triggers = {}
end

local function resetup(args)
  unsetup(args)
  setup(args)
end

Contents = {
  setup = setup
  ,unsetup = unsetup
  ,resetup = resetup
}

return Contents
