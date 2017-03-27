local Chat = {}

local triggers = {}

local function load(args)
  local tempTriggers = {}

  tempTriggers.generalChatTrigger
    = tempRegexTrigger("^(?:> )?.* (say|says|ask|asks|exclaim|exclaims|shout|shouts|yell|yells|tells) .*"
                        ,[[
                          local message = matches[1]
                          local arguments = {message = message}
                          Events.raiseEvent("chatEvent", arguments)
                        ]])

  tempTriggers.szTrigger
    = tempRegexTrigger("^(?:> )?A voice seems to say:.*"
                        ,[[
                          local message = matches[1]
                          local arguments = {message = message}
                          Events.raiseEvent("chatEvent", arguments)
                        ]])

  triggers = tempTriggers
end

local function unload(args)
  for i,v in pairs(triggers) do
    killTrigger(v)
  end
  triggers = {}
end

local function reload(args)
  load(args)
  reload(args)
end

Chat = {
  load = load
  ,unload = unload
  ,reload = reload
}

return Chat
