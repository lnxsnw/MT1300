# lnxsnw/MT1300
Modifications to the GL-iNET MT1300 Beryl Travel Router.

Currently, this includes the following modifications:
- For the admin page: redirect the user to HTTPS if user is not.
- Added AdGuard Home integrations, extracted from gl-sdk4-ui-adguardhome and gl-sdk4-adguardhome. This has my special modifications though:
	- The AdGuardHome binary is expected to be at an external storage.
	- Update the binary by placing `AdGuardHome.new` to the external storage (more explanation in the `/etc/init.d/adguardhome` file).
	- **Commands to run (these are the commands that setup.sh runs):**
		- `mkdir -p /etc/AdGuardHome`
		- `mkdir -p /usr/bin/AdGuardHome`
		- `chmod +x /etc/init.d/adguardhome`
		- `/etc/init.d/adguardhome enable`
		- `chmod +x /usr/bin/AdGuardHome/AdGuardHome`
		- `ln -s /etc/AdGuardHome (EXTERNAL_AGH_DIRECTORY)`
		- `ln -s /etc/AdGuardHome/AdGuardHome /usr/bin/AdGuardHome/AdGuardHome`
	- Alternatively, you can just quickly set it up by:
		- `cd /tmp`
		- `wget https://github.com/lnxsnw/MT1300/archive/refs/heads/main.zip -O a.zip`
		- `unzip a.zip`
		- `chmod +x /tmp/MT1300-main/setup.sh`
		- `/tmp/MT1300-main/setup.sh`
