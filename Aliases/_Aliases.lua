local _Aliases = {}

local modules = {}

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
