{
    networking.networkmanager.enable = true;
    hardware.bluetooth.enable = true; 
    hardware.bluetooth.powerOnBoot = false;
    services.blueman.enable = true;
# services.pipewire.wireplumber.extraConfig = {
#   "10-bluez-ldac" = {
#     "monitor.bluez.rules" = [
#       {
#         matches = [
#           {
#             # Match any Bluetooth device
#             "device.name" = "~bluez_card.*";
#           }
#         ];
#         actions = {
#           update-props = {
#             "bluez5.a2dp.ldac.quality" = "hq"; # hq = 990kbps, sq = 660kbps, nq = 330kbps
#             "bluez5.enable-ldac" = true;
#           };
#         };
#       }
#     ];
#   };
# };
    services.pipewire.wireplumber.extraConfig = {
        "bluetooth" = {
            "monitor.bluez.properties" = {
                "bluez5.codecs" = [ "ldac" "sbc" "sbc_xq" "aac" "aptx" "aptx_hd" ];
            };
        };
    };
}
