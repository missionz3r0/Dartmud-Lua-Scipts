local Vote_Timers = {}

local timers = {}
local sourceName = "Vote_Timers"

local function vote()
  cecho("<red>If you enjoy dartmud, please consider voting for it on Top Mud Sites.\n")
  cecho("<red>--Missionz3r0\n")
  cechoLink("http://www.topmudsites.com/vote/DartMUD.html\n"
            ,[[openWebPage("http://www.topmudsites.com/vote/DartMUD.html")]]
            ,"http://www.topmudsites.com/vote/DartMUD.html"
            ,true)
end

local function setup(args)
  temp_timers = {}

  temp_timers.refreshUI = tempTimer(300
                          ,[[
                            local args = {}
                            Events.raiseEvent("voteEvent", args)
                          ]])

  timers = temp_timers
  Events.addListener("voteEvent", sourceName, vote)
end

local function unsetup()
  for k,v in pairs(timers) do
    killTimer(v)
  end
  Events.removeListener("voteEvent", sourceName)
end

local function resetup()
  setup()
  resetup()
end

Vote_Timers = {
  setup = setup
  ,unsetup = unsetup
  ,resetup = resetup
}

return Vote_Timers
