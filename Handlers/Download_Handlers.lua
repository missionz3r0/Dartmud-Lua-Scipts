registerAnonymousEventHandler("sysDownloadError", "downloadErrorHandler")
local downloadErrorListeners = {}
function Handlers.addDownloadErrorListener(listenerName, functionToAdd)
  downloadErrorListeners[listenerName] = functionToAdd
end

function Handlers.removeDownloadErrorListener(listenerName)
  downloadErrorListeners[listenerName] = nil
end

function Handlers.downloadErrorHandler(event, var1, var2)
  for l,v in pairs(downloadErrorListeners) do
    v(var1, var2)
  end
end
