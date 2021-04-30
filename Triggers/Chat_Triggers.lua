local Chat = {}

local triggers = {}

local function setup(args)
  local tempTriggers = {}

  tempTriggers.generalChatTrigger
    = tempRegexTrigger("^(?:> )?.* (say|says|ask|asks|exclaim|exclaims|shout|shouts|yell|yells|tells)(?: |,|:).*"
                        ,[[
                          local message = matches[1]
                          local arguments = {message = message}
                          Events.raiseEvent("chatEvent", arguments)
                        ]])

  triggers = tempTriggers
end

local function unsetup(args)
  for i,v in pairs(triggers) do
    killTrigger(v)
  end
  triggers = {}
end

local function resetup(args)
  unsetup(args)
  setup(args)
end

Chat = {
  setup = setup
  ,unsetup = unsetup
  ,resetup = resetup
}

return Chat
