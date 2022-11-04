rofi_command="rofi -theme $HOME/.config/rofi/config-web.rasi"

chosen="$($rofi_command -dmenu -p '  Web')"
if [ -z "$chosen" ]
then
    exit
else
    url=$(echo $chosen | python3 -c "import urllib.parse, sys; print(urllib.parse.quote(sys.stdin.read()))")
    firefox --new-tab -url https://www.google.com/search?q=$url
fi
