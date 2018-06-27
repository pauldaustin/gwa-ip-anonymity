local BasePlugin = require "kong.plugins.base_plugin"

local BcGovIpAnonymousHandler = BasePlugin:extend()

function anonymizeIps(ips)
  if ips == nil then
    return nil
  else
    -- ipv6
    ips = ips:gsub('([%da-fA-F]*:[%da-fA-F:]*:)[%da-fA-F]+', '%10')
    
    -- ipv4
    ips = ips:gsub('(%d+%.%d+%.%d+%.)%d+', '%10')
    return ips
  end
end


function anonymizeHeaderIps(name)
  local ips = ngx.req.get_headers()[name];
  ips = anonymizeIps(ips)
  ngx.req.set_header(name, ips)
  return ips
end

function BcGovIpAnonymousHandler:new()
  BcGovIpAnonymousHandler.super.new(self, "gwa-ip-anonymity")
end

function BcGovIpAnonymousHandler:access(conf)
  BcGovIpAnonymousHandler.super.access(self)
  anonymizeHeaderIps('Forwarded')
  ngx.var.upstream_x_forwarded_for = anonymizeHeaderIps('x-forwarded-for')
end

BcGovIpAnonymousHandler.PRIORITY = 10000

return BcGovIpAnonymousHandler
