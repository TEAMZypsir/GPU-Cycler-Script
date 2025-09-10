# GPU Cycler Script
 This is a basic Powershell script to temporarily disable a secondary gpu so that games that conflict with two running on load can work with LSFG.



I made this for Cyberpunk 2077 specifically in regards to the issue of the game failing to initialize Ray Tracing.

This script does not require any 3rd party installs or utilities to function.

I have a 9070xt and a 2080S as my secondary as the confirmed use case this addressed.

In order for your computer to not defer to software rendering you need to ensure with this script that you have a secondary cable connected to your main GPU from your monitor that you will use to game on. This allows the display and render to initialize on the same GPU and the game will start. If you do not do this then the game crashes as it can't transition the render pipeline from windows basic display adapter to a dedicated GPU.

Use this command to get the device ID of your secondary GPU:

wmic path win32_VideoController get name, pnpDeviceID

Once you set your gpuid and game path in the script you are good to go.

**MAKE SURE TO RUN AS ADMIN**

Happy gaming!
