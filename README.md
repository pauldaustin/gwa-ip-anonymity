# kong-plugin-gwa-ip-anonymity

Kong Plugin to change the X-Forwarded-For header so that the original client's IP address
last part is set to zero. For example 24.5.6.11 would become 24.5.6.0.  

NOTE: This version requires kong 0.12.x

## Releasing
Follow these instructions to create a new release for a version (e.g. 1.0.0).

```bash
VERSION=1.0.0

# Clone the source code (always checkout a clean copy)
git clone https://github.com/bcgov/kong-plugin-gwa-ip-anonymity
cd kong-plugin-gwa-ip-anonymity

# Create a new branch
git checkout -b $VERSION-branch

# Rename the rockspec file to the new version (if required).
mv kong-plugin-gwa-ip-anonymity-*-0.rockspec kong-plugin-gwa-ip-anonymity-${VERSION}-0.rockspec

# Edit the rockspec file for the new version
vi kong-plugin-gwa-ip-anonymity-${VERSION}-0.rockspec
```

```
  version = "1.0.0-0"
  tag = "1.0.0"
```

```bash
# Commit the changes and tag version
git commit -a -m "Version $VERSION"
git tag $VERSION
git push origin $VERSION

# Delete the checked out repository
cd ..
rm -rf kong-plugin-gwa-ip-anonymity
```

## Installing

Follow these instructions to deploy the plugin to each Kong server in the cluster.

### Install the luarocks file

```bash
VERSION=1.0.0

# Clone the source code (always checkout a clean copy)
git clone https://gogs.data.gov.bc.ca/DataBC/kong-plugin-gwa-ip-anonymity
cd kong-plugin-gwa-ip-anonymity

# Checkout the version to a branch
git checkout tags/$VERSION -b $VERSION-branch

# Make the lua rock file and deploy to the shared lua repository
luarocks make

# Delete the checked out repository
cd ..
rm -rf kong-plugin-gwa-ip-anonymity
```

### Add the plugin to the kong configuration

Edit the kong.conf file 

```
custom_plugins = otherplugin,gwa-ip-anonymity
```
