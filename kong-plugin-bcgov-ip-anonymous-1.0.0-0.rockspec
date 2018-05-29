package = "kong-plugin-bcgov-ip-anonymous"
version = "1.0.0-0"
supported_platforms = {"linux", "macosx"}
source = {
  url = "https://gogs.data.gov.bc.ca/DataBC/kong-plugin-bcgov-ip-anonymous",
  tag = "1.0.0"
}
description = {
  summary = "BC Government Kong Plugin IP Address Anonymizer",
  license = "Apache-2.0"
}
dependencies = {
  "lua ~> 5.1"
}
build = {
  type = "builtin",
  modules = {
    ["kong.plugins.bcgov-ip-anonymous.handler"] = "kong/plugins/bcgov-ip-anonymous/handler.lua",
    ["kong.plugins.bcgov-ip-anonymous.schema"] = "kong/plugins/bcgov-ip-anonymous/schema.lua"
  }
}
