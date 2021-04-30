local Score = {}

local timers = {}
local sourceName = "Score_Timers"

local function scoreTimer()
  timers.refresh = tempTimer(300
                        ,[[
                          send("score")
                          local args = {}
                          Events.raiseEvent("ScoreEvent", args)
                        ]])
end

local function setup(args)
  temp_timers = {}

  temp_timers.refreshUI = tempTimer(300
                          ,[[
                            send("score")
                            local args = {}
                            Events.raiseEvent("ScoreEvent", args)
                          ]])

  timers = temp_timers
  Events.addListener("ScoreEvent", sourceName, scoreTimer)
end

local function unsetup()
  for k,v in pairs(timers) do
    killTimer(v)
  end
  Events.removeListener("refreshUIEvent", sourceName)
end

local function resetup()
  unsetup()
  setup()
end

Score = {
  setup = setup
  ,unsetup = unsetup
  ,resetup = resetup
}

return Score
