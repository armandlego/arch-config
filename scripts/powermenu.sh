rofi_command="rofi -theme $HOME/.config/rofi/config-power.rasi -p "power""

#### Options ###
power_off=""
reboot=""
lock=""
suspend=""
log_out=""
# Variable passed to rofi
options="$reboot\n$power_off\n$lock\n$suspend\n$log_out"

chosen="$(echo -e "$options" | $rofi_command -dmenu -selected-row 2 -u 0:2)"
case $chosen in
    $lock)
        i3lock -e -f -u -i ~/.config/wallpapers/lockscreen.png && sleep 1 && xset dpms force off
	;;
    $power_off)
        systemctl poweroff
        ;;
    $reboot)
        systemctl reboot
        ;;
    $suspend)
	i3lock -e -f -u -i $HOME/.config/wallpapers/lockscreen.png && sleep 2 && systemctl suspend
        ;;
    $log_out)
        pkill xinit
        ;;
esac

