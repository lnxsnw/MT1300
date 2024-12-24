# lnxsnw/MT1300
Modifications to the GL-iNET MT1300 Beryl Travel Router.

Currently, this includes the following modifications:
- If typing out the IP Address opens as HTTP, redirect the user to HTTPS.
- Added AdGuard Home integrations, extracted from gl-sdk4-ui-adguardhome and gl-sdk4-adguardhome. This has my special modifications though:
	- The AdGuardHome binary is expected to be at an external storage.
	- Update the binary by placing `AdGuardHome.new` to the external storage (more explanation in the `/etc/init.d/adguardhome` file).
