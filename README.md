     ================== 
      |@@@@----@|--@@|          _                          _____ _____ 
      |@@@----@@|--@@|         | |                        |  _  /  ___|
      |@@----@@@|--@@|     __ _| |__   __ _  ___ _   _ ___| | | \ `--. 
      |@----@@@@|--@@|    / _` | '_ \ / _` |/ __| | | / __| | | |`--. \
      |@@@@@----|@--@|   | (_| | |_) | (_| | (__| |_| \__ \ \_/ /\__/ /
      |@@@@----@|@--@|    \__,_|_.__/ \__,_|\___|\__,_|___/\___/\____/ 
     ==================

Simple 64-bit OS built with assembly code and C

I've provided a simple bochsrc for simple virtualization, just make sure to switch to your path where the boot.img will be built `ata0-master: type=disk, path="<SWITCH TO YOUR PATH>", mode=flat, cylinders=0, heads=16, spt=63, sect_size=512, model="Generic 1234", biosdetect=auto, translation=auto`

Make sure that you have bochsrc installed, nasm and gcc and trigger a build with the build script

More info coming soon...
