# kong-plugin-gwa-ip-anonymity

A Kong plugin (current DataBC API Gateway) used for hide full or partial client IP to upstream services.

Change the X-Forwarded-For header so that the original client's IP address
last part is set to masked using the ipv4_mask or ipv6_mask values. For example 24.5.6.11
would become 24.5.6.0.  

NOTE: This version requires kong >= 0.12.x

## Installing

Follow these instructions to deploy the plugin to each Kong server in the cluster.

### Install the luarocks file

`luarocks install kong-plugin-gwa-ip-anonymity`

### Add the plugin to the kong configuration

Edit the kong.conf file 

```
custom_plugins = otherplugin,gwa-ip-anonymity
```

## Plugin Fields
The plugin accepts the following fields.

|Name     |Type  |Default |Description                                                        |
|---------|------|--------|-------------------------------------------------------------------|
|ipv4_mask|number|0       |The value (0-255) to mask the last part of an IPV4 address         |
|ipvd_mask|number|0       |The value (1-4 hex digits) to mask the last part of an IPV6 address|
