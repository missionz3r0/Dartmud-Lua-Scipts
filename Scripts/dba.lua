--[[ dba.lua
    Handles luasql in a generic way.
    Maintains a connection to the DB, and returns result sets independantly.
--]]

require "luasql.sqlite3"

dba = {}

local loader_game = "Database_dartmud"
local dbFile = string.upper(loader_game)..".db"

local env = assert(luasql.sqlite3(),"Failed to setup( luasql.sqlite3")
local db = env:connect(string.format("%s/%s",getMudletHomeDir(),dbFile))
local transaction = false

--[[
    Function: dba.execute
    Parameters:
        sql: The actual SQL statement to be executed.
    Returns:
        Nothing.
    Description:
        Simply executes a given statement. A failure will display the statement unable to be executed.
--]]
function execute(sql)
    return assert(db:execute(sql),string.format("Failed to execute sql: %s",sql))
end

--[[
    Function: dba.query
    Parameters:
        sql: The actual SQL statement to be executed.
    Returns:
        A php:Table containing all of the results from the query.
    Description:
        Execute an SQL statement that returns results. the php:Table function is required
        in order to maintain the ordering of the results.
--]]
function query(sql)
    local cur = assert(db:execute(sql),string.format("Failed to execute sql: %s",sql))
    local results = php:Table()
    row = cur:fetch({},"a")
    local c = 1
    while row do
        results[c] = {}
        for col,value in pairs(row) do
            results[c][col] = value
        end
        row = cur:fetch(row,"a")
        c = c + 1
    end
    cur:close()
    return results
end

function begin()
    if transaction then return false end
    assert(db:execute("BEGIN TRANSACTION"),"Unable to begin transaction!")
    transaction = true
    return true
end

function commit()
    assert(db:execute("COMMIT TRANSACTION"),"Unable to commit transaction!")
    transaction = false
    return true
end

dba = {
  execute = execute
  ,begin = begin
  ,commit = commit
  ,query = query
}

return dba
