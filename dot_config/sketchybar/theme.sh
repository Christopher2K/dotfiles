BACKGROUND_COLOR=0xFFD5C4A1
FOREGROUND_COLOR=0xFF665C54
FOREGROUND_2_COLOR=0xFF504945
ACCENT_COLOR=0xFFD65D0E
FONT_FAMILY="JetBrainsMono Nerd Font Mono"
WHITE_COLOR=0xFFFFFFFF

BAR_HEIGHT=40
BAR_RADIUS=8
FONT_SIZE=14
ICON_FONT_SIZE=20

generate_spacer() {
        sketchybar --add item spacer.$1 $2 \
                --set spacer.$1 \
                width=16 \
                background.color=0x00FFFFFF
}
