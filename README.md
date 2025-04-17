# lnxsnw/MT1300
Modifications to the GL-iNET MT1300 Beryl Travel Router.

Currently, this includes the following modifications:
- For the admin page: redirect the user to HTTPS if user is not with tweaks for AGH.
- Added AdGuard Home integrations, extracted from gl-sdk4-ui-adguardhome and gl-sdk4-adguardhome. The ipk for these files are long gone in the app repository but [saved in the ipk folder here](https://github.com/lnxsnw/MT1300/tree/e53994b74ae782a681b4c36cd7ad1d1ac4d0161e)[^1], thanks GL-iNET Support for still having them!
- You can just quickly set it up by copypasting: 
	- `cd /tmp`
	- `wget https://github.com/lnxsnw/MT1300/archive/refs/heads/v2.zip -O a.zip`
	- `unzip a.zip`
	- `chmod +x /tmp/MT1300-2/setup.sh`
	- `/tmp/MT1300-2/setup.sh`

Yes, this work used ai but with assurance by extensive testing lol.
The ipk folder will not be copied to the filesystem, it's there for archive purposes.

## AdGuardHome Integration
This has been modified to use the ram as storage and also for app data.
However, stats will not persist.

This method uses the internet to download the latest AGH then runs it in ram.
If it fails or is offline, it uses a local copy as backup, should you have one.
Be sure to set where that directory is in the setup or in the `/etc/init.d/adguardhome` file.

I originally used both these setups (was my starting point):
- https://forum.gl-inet.com/t/does-gl-mt1300-beryl-support-adguard-home-and-gl-product-questions/14360
- https://forum.openwrt.org/t/howto-running-adguard-home-on-openwrt/51678
however, i just wanted to use the ram since it is quite enough and does not mess with the filesystem that much unlike that extroot method.

check out the `/etc/init.d/adguardhome` file for the implementation.

[^1]: Subsequently removed because it slowed down quite a lot when downloading, even on a fast network. Though I wanted to preserve the files for references or something else.