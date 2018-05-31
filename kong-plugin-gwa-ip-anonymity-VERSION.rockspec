package = "kong-plugin-gwa-ip-anonymity"
version = "VERSION"
supported_platforms = {"linux", "macosx"}
source = {
  url = "git://github.com/bcgov/gwa-ip-anonymity",
  tag = "VERSION"
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
