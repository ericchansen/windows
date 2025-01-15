
# Turn off USB selective suspend for all power plans.
# I haven't used this on my latest Windows install.
$guid_usb_settings = "2a737441-1930-4402-8d77-b2bebba308a3"
$guid_usb_selective_suspend_settings = "48e6b7a6-50f5-4782-a5d4-53bb8f07e226"
$results = POWERCFG /LIST
foreach ($line in $results) {
    $split_line = $line.Split()
    if ($split_line[2] -eq "GUID:") {
        $guid_power_plan = $split_line[3]
        POWERCFG /SETACVALUEINDEX $guid_power_plan $guid_usb_settings $guid_usb_selective_suspend_settings 0
        POWERCFG /SETDCVALUEINDEX $guid_power_plan $guid_usb_settings $guid_usb_selective_suspend_settings 0
    }
}
