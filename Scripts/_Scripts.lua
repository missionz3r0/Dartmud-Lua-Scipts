local _Scripts = {}

local modules = {}

modules.casting = require("Casting")
modules.channelling = require("Channelling")
modules.inscribing = require("Inscribing")
modules.skills = require("Skills")
modules.status = require("Status")
modules.ui = require("UI")

local function load()
  for k,v in pairs(modules) do
    v.load()
  end
end

local function unload()
  for k,v in pairs(modules) do
    v.unload()
  end
end

local function reload()
  load()
  unload()
end

_Scripts = {
  load = load
  ,unload = unload
  ,reload = reload
}

return _Scripts
