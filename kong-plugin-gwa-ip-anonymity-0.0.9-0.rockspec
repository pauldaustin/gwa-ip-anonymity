package = "kong-plugin-gwa-ip-anonymity"
version = "0.0.9-0"
supported_platforms = {"linux", "macosx"}
source = {
  url = "git://github.com/pauldaustin/gwa-ip-anonymity",
  tag = "0.0.9-0"
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
    ["kong.plugins.gwa-ip-anonymity.handler"] = "kong/plugins/gwa-ip-anonymity/handler.lua",
    ["kong.plugins.gwa-ip-anonymity.schema"] = "kong/plugins/gwa-ip-anonymity/schema.lua"
  }
}
