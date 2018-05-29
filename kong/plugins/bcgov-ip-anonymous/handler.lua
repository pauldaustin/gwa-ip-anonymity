local BasePlugin = require "kong.plugins.base_plugin"

local BcGovIpAnonymousHandler = BasePlugin:extend()

function BcGovIpAnonymousHandler:new()
  BcGovIpAnonymousHandler.super.new(self, "bcgov-ip-anonymous")
end


function BcGovIpAnonymousHandler:access(conf)
  BcGovIpAnonymousHandler.super.access(self)
  local origin = ngx.var.upstream_x_forwarded_for
  local clientIp
  local commaIndex = origin:find(",")
  if commaIndex then
    clientIp = origin:sub( 1, commaIndex - 1)
  else
    clientIp = origin
  end
  clientIp = clientIp:gsub("([.:])%d+$", "%10")

  ngx.var.upstream_x_forwarded_for = clientIp..origin:sub(commaIndex)
end

BcGovIpAnonymousHandler.PRIORITY = 0

return BcGovIpAnonymousHandler
