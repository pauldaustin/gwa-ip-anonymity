return {
  no_consumer = true,
  fields = {
    ipv4_mask = {
      type = "number",
      default = "0",
      regex = "([:digit:]|[:digit:][:digit:]|1[:digit:][:digit:]|2[0-4][:digit:]|25[0-5])"
    },
    ipv6_mask = {
      type = "number",
      default = "0",
      regex = "[:xdigit:]{1,4}"
    }
  }
}
