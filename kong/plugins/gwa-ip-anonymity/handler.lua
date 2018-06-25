local BasePlugin = require "kong.plugins.base_plugin"

local BcGovIpAnonymousHandler = BasePlugin:extend()

function BcGovIpAnonymousHandler:new()
  BcGovIpAnonymousHandler.super.new(self, "gwa-ip-anonymity")
end


function BcGovIpAnonymousHandler:access(conf)
  BcGovIpAnonymousHandler.super.access(self)
  local origin = ngx.var.upstream_x_forwarded_for
  origin = origin:gsub('%s+', '')
  
  local origins = {}
  origin:gsub('([^,]+)', function(clientIp)
    origins[#origins+1] = clientIp:gsub('([.:])%d+$', '%10')
  end)

  ngx.var.upstream_x_forwarded_for = table.concat(origins, ', ')
end

BcGovIpAnonymousHandler.PRIORITY = 0

return BcGovIpAnonymousHandler
