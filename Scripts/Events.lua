Events = {}

local eventlist = {}

local function load()
end

local function unload()
end

local function reload()
  load()
  unload()
end

local function createEventList(eventName)
  if(not eventList[eventName]) then
    eventList[eventName] = {}
  end
end

local function raiseEvent(eventName, args)
  createEventList(eventName)

  for k,v in pairs(EventList[eventName]) do
    v(args)
  end
end

local function addListener(eventName, sourceName, listenerFunction)
  createEventList(eventName)

  EventList[eventName][sourceName] = listenerFunction
end

local function removeListener(eventName, sourceName)
  createEventList(eventName)

  EventList[eventName][sourceName] = nil
end

Events = {
  load = load
  ,unload = unload
  ,reload = reload
  ,raiseEvent = raiseEvent
  ,addListener = addListener
  ,removeListener = removeListener
}

return Events
