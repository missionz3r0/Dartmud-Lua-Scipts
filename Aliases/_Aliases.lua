local _Aliases = {}

local modules = {}

modules.channelling = require("Channelling_Aliases")
modules.channelling = require("Magic_Aliases")
modules.channelling = require("Skill_Aliases")

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
  reload()
end

_Aliases = {
  load = load
  ,unload = unload
  ,reload = reload
}

return _Aliases
