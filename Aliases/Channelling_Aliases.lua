local Channelling = {}

local function load()
  --Add channeller alias
end

local function unload()
end

local function reload()
  unload()
  reload()
end

Channelling =
{
  load = load
  ,unload = unload
  ,reload = reload
}

return Channelling
