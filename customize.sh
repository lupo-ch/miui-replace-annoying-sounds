
##########################################################################################
# Defines
##########################################################################################

# NOTE: This part has to be adjusted to fit your own needs

# This will be the folder name under /magisk
# This should also be the same as the id in your module.prop to prevent confusion
MODID=miui-replace-annoying-sounds

# Set to true if you need to enable Magic Mount
# Most mods would like it to be enabled
AUTOMOUNT=true

# Set to true if you need to load system.prop
PROPFILE=false

# Set to true if you need post-fs-data script
POSTFSDATA=false

# Set to true if you need late_start service script
LATESTARTSERVICE=false

##########################################################################################
# System Check
##########################################################################################


if $BOOTMOE; then
  ui_print "- Installing from Magisk app"
else
  ui_print "*********************************************************"
  ui_print "! Install from recovery is NOT supported"
  ui_print "! Some recovery has broken implementations, install with such recovery will finally cause this module not working"
  ui_print "! Please install from Magisk app"
  abort "*********************************************************"
fi

# check Magisk
ui_print "- Magisk version: $MAGISK_VER ($MAGISK_VER_CODE)"

# check android
if [ "$API" -lt 23 ]; then
  ui_print "! Unsupported sdk: $API"
  abort "! Minimal supported sdk is 23 (Android 6.0)"
else
  ui_print "- Device sdk: $API"
fi

# check architecture
if [ "$ARCH" != "arm" ] && [ "$ARCH" != "arm64" ] && [ "$ARCH" != "x86" ] && [ "$ARCH" != "x64" ]; then
  abort "! Unsupported platform: $ARCH"
else
  ui_print "- Device platform: $ARCH"
fi


##########################################################################################
# Installation Message
##########################################################################################

# Set what you want to show when installing your mod

ui_print "**********************************"
ui_print " Replace the annoying MIUI sounds "
ui_print "**********************************"

##########################################################################################
# Replace list
##########################################################################################

# List all directories you want to directly replace in the system
# By default Magisk will merge your files with the original system
# Directories listed here however, will be directly mounted to the correspond directory in the system

REPLACE="
/system/media/audio/ui/charging.ogg
/system/media/audio/ui/disconnect.ogg
/system/media/audio/ui/silence.ogg
/system/media/audio/ui/disconnect-orig.ogg
/system/media/audio/ui/silence-orig.ogg
"

##########################################################################################
# Permissions
##########################################################################################

# NOTE: This part has to be adjusted to fit your own needs

set_perm_recursive  $MODPATH  0  0  0755  0644
