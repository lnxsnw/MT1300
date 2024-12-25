# lnxsnw/MT1300
Modifications to the GL-iNET MT1300 Beryl Travel Router.

Currently, this includes the following modifications:
- For the admin page: redirect the user to HTTPS if user is not.
- Added AdGuard Home integrations, extracted from gl-sdk4-ui-adguardhome and gl-sdk4-adguardhome. This has my special modifications though:
	- The AdGuardHome binary **is expected to be at an external storage**. This is so that we do not do the [extroot method](https://forum.gl-inet.com/t/does-gl-mt1300-beryl-support-adguard-home-and-gl-product-questions/14360/26).
	- *The gl-sdk4-ui-adguardhome and gl-sdk4-adguardhome plug-ins/ipks were removed from the GL-iNET repository, unfortunately. However, sourcing from the [gl-inet/glinet](https://github.com/gl-inet/glinet) repository, I was able to get it back (the ipk installation gives an unsupported architecture error, but nothing inside of those were architecture-specific files), I just extracted the files from it.*
	- Update the binary by placing `AdGuardHome.new` to the external storage (more explanation in the `/etc/init.d/adguardhome` file).
	- **Commands to run (these are the commands that setup.sh runs):**
		- `mkdir -p /etc/AdGuardHome`
		- `chmod +x /etc/init.d/adguardhome`
		- `/etc/init.d/adguardhome enable`
		- `ln -s (EXTERNAL_AGH_DIRECTORY) /etc/AdGuardHome`
		- `ln -s /etc/AdGuardHome/AdGuardHome /usr/bin/AdGuardHome`
		- `chmod +x /usr/bin/AdGuardHome`
	- Alternatively, you can just quickly set it up by: 
		- `cd /tmp`
		- `wget https://github.com/lnxsnw/MT1300/archive/refs/heads/main.zip -O a.zip`
		- `unzip a.zip`
		- `chmod +x /tmp/MT1300-main/setup.sh`
		- `/tmp/MT1300-main/setup.sh`
	- The update.sh file:
		- Place this script on the directory where the AdGuardHome binary is.
		- Run by:
			`/fullpath/update.sh link_here`
		- An example link is:
		    `https://github.com/AdguardTeam/AdGuardHome/releases/download/v0.107.55/AdGuardHome_linux_mipsle_softfloat.tar.gz`
		- Just copy the link found in the releases and you are good to go! Select the appropriate architecture though, MT1300 uses `mipsle_softfloat`.
