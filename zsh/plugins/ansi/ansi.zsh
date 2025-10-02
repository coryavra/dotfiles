# POSIX-Compliant ANSI Escape Sequences

# https://notes.burke.libbey.me/ansi-escape-codes/
# https://gist.github.com/fnky/458719343aabd01cfb17a3a4f7296797
# https://en.wikipedia.org/wiki/ANSI_escape_code#C0_control_codes

# POSIX sh supports hexadecimal and octal escape sequences
escape_hex="\x1b"
escape_oct="\033"

# We'll default to hex escape sequence
escape="${escape_hex}"

# Sequence prefixes
csi="${escape}["  # Control Sequence Introducer
dcs="${escape}P"  # Device Control String
osc="${escape}]"  # Operating System Command

# Function to set graphics rendition (SGR) code
SetGraphicsRendition() {
  printf "${csi}%sm" "$1"
}

# Abbreviate SetGraphicsRendition to SGR for easier usage
SGR() {
  SetGraphicsRendition "$@"
}

# Reset all attributes
ansi_reset=$(SGR 0)                       # Reset all text attributes

# Text Effects (Enable)
ansi_bold=$(SGR 1)                        # Bold on
ansi_dim=$(SGR 2)                         # Dim (faint) on
ansi_italic=$(SGR 3)                      # Italic on
ansi_underline=$(SGR 4)                   # Underline on
ansi_blink=$(SGR 5)                       # Slow blink on
ansi_blink_fast=$(SGR 6)                  # Rapid blink on
ansi_reverse_video=$(SGR 7)               # Reverse video on (invert colors)
ansi_invisible=$(SGR 8)                   # Conceal (invisible) on
ansi_strikethrough=$(SGR 9)               # Crossed-out (strikethrough) on

# Text Effects (Disable)
ansi_bold_off=$(SGR 21)                   # Bold off (normal intensity)
ansi_italic_off=$(SGR 23)                 # Italic off
ansi_underline_off=$(SGR 24)              # Underline off
ansi_blink_off=$(SGR 25)                  # Blink off
ansi_reverse_video_off=$(SGR 27)          # Reverse video off
ansi_conceal_off=$(SGR 28)                # Invisible off
ansi_crossed_out_off=$(SGR 29)            # Crossed-out off

# Foreground color
ansi_foreground_black=$(SGR 30)
ansi_foreground_red=$(SGR 31)
ansi_foreground_green=$(SGR 32)
ansi_foreground_yellow=$(SGR 33)
ansi_foreground_blue=$(SGR 34)
ansi_foreground_magenta=$(SGR 35)
ansi_foreground_cyan=$(SGR 36)
ansi_foreground_white=$(SGR 37)

# Set foreground color to xterm 256 value
ansi_set_fg_color() {
  SGR "38;5;$1"                           # 38;5 = 256 color mode
}

# Set foreground color to RGB value
ansi_set_fg_rgb() {
  SGR "38;2;$1;$2;$3"                     # 38;2 = RGB color mode
}

# Reset foreground color to default
ansi_reset_fg=$(SGR 39)

# Background color
ansi_background_black=$(SGR 40)
ansi_background_red=$(SGR 41)
ansi_background_green=$(SGR 42)
ansi_background_yellow=$(SGR 43)
ansi_background_blue=$(SGR 44)
ansi_background_magenta=$(SGR 45)
ansi_background_cyan=$(SGR 46)
ansi_background_white=$(SGR 47)

# Set background color to xterm 256 value
ansi_set_bg_color() {
  SGR "48;5;$1"                           # 48;5 = 256 color mode
}

# Set background color to RGB value
ansi_set_bg_rgb() {
  SGR "48;2;$1;$2;$3"                     # 48;2 = RGB color mode
}

# Reset background color to default
ansi_reset_bg=$(SGR 49)

# 50-89: Rarely used, not supported

# Bright foreground colors
ansi_foreground_bright_black=$(SGR 90)
ansi_foreground_bright_red=$(SGR 91)
ansi_foreground_bright_green=$(SGR 92)
ansi_foreground_bright_yellow=$(SGR 93)
ansi_foreground_bright_blue=$(SGR 94)
ansi_foreground_bright_magenta=$(SGR 95)
ansi_foreground_bright_cyan=$(SGR 96)
ansi_foreground_bright_white=$(SGR 97)

# Bright background colors
ansi_background_bright_black=$(SGR 100)
ansi_background_bright_red=$(SGR 101)
ansi_background_bright_green=$(SGR 102)
ansi_background_bright_yellow=$(SGR 103)
ansi_background_bright_blue=$(SGR 104)
ansi_background_bright_magenta=$(SGR 105)
ansi_background_bright_cyan=$(SGR 106)
ansi_background_bright_white=$(SGR 107)

# Miscellaneous
ansi_bell="\a"                            # Trigger the terminal bell
ansi_tab="\t"                             # Horizontal tab
ansi_backspace="\b"                       # Backspace

# Flash the screen
ansi_flash_screen="${csi}?5h${csi}?5l"

# Cursor control
ansi_cursor_up() { local n=${1:-1}; echo "${csi}${n}A"; }
ansi_cursor_down() { local n=${1:-1}; echo "${csi}${n}B"; }
ansi_cursor_right() { local n=${1:-1}; echo "${csi}${n}C"; }
ansi_cursor_left() { local n=${1:-1}; echo "${csi}${n}D"; }
ansi_cursor_home="${csi}H"
ansi_cursor_pos() { local row=$1 col=$2; echo "${csi}${row};${col}H"; }

# Screen and cursor modes
ansi_save_cursor="${csi}s"
ansi_restore_cursor="${csi}u"
ansi_hide_cursor="${csi}?25l"
ansi_show_cursor="${csi}?25h"
ansi_alt_screen="${csi}?1049h"
ansi_main_screen="${csi}?1049l"

# Erasing and clearing
ansi_clear_screen="${csi}2J"
ansi_clear_line_right="${csi}K"
ansi_clear_line_left="${csi}1K"
ansi_clear_line_all="${csi}2K"

# Text manipulation
ansi_insert_line="${csi}L"
ansi_delete_line="${csi}M"

# Key mappings (for reference)
ansi_key_f1="${csi}OP"
ansi_key_f2="${csi}OQ"
ansi_key_f3="${csi}OR"
ansi_key_f4="${csi}OS"
ansi_key_f5="${csi}15~"
ansi_key_f6="${csi}17~"
ansi_key_f7="${csi}18~"
ansi_key_f8="${csi}19~"
ansi_key_f9="${csi}20~"
ansi_key_f10="${csi}21~"
ansi_key_f11="${csi}23~"
ansi_key_f12="${csi}24~"
ansi_key_insert="${csi}2~"
ansi_key_delete="${csi}3~"
ansi_key_home="${csi}OH"
ansi_key_end="${csi}OF"
ansi_key_page_up="${csi}5~"
ansi_key_page_down="${csi}6~"

# Device Control String (DCS) commands
# https://en.wikipedia.org/wiki/ANSI_escape_code#Device_Control_String
# https://vt100.net/docs/vt510-rm/DECSTR.html
# https://vt100.net/docs/vt510-rm/DECSLRM.html

# Set left and right margins
ansi_set_left_margin="${dcs} $ q"
ansi_set_right_margin="${dcs} $ r"

# Operating System Command (OSC) commands
# https://en.wikipedia.org/wiki/ANSI_escape_code#Operating_System_Command

# Set window title
ansi_set_window_title() {
  printf "${osc}2;%s${escape}" "$1"
}

# Set icon name
ansi_set_icon_name() {
  printf "${osc}1;%s${escape}" "$1"
}

# Set clipboard
ansi_set_clipboard() {
  printf "${osc}52;%s${escape}" "$1"
}

# Reset clipboard
ansi_reset_clipboard="${osc}52;${escape}"

# Set cursor shape
ansi_set_cursor_shape() {
  printf "${csi}?%s${escape}" "$1"
}

# Reset cursor shape
ansi_reset_cursor_shape="${csi}?0${escape}"

# Set cursor color
ansi_set_cursor_color() {
  printf "${csi}?%s${escape}" "$1"
}

# Reset cursor color
ansi_reset_cursor_color="${csi}?112${escape}"

# Set cursor foreground color
ansi_set_cursor_fg_color() {
  printf "${csi}?%s${escape}" "$1"
}

# Reset cursor foreground color
ansi_reset_cursor_fg_color="${csi}?110${escape}"

# Set cursor background color
ansi_set_cursor_bg_color() {
  printf "${csi}?%s${escape}" "$1"
}

# Reset cursor background color
ansi_reset_cursor_bg_color="${csi}?111${escape}"

# Set cursor highlight color
ansi_set_cursor_highlight_color() {
  printf "${csi}?%s${escape}" "$1"
}

# Reset cursor highlight color
ansi_reset_cursor_highlight_color="${csi}?113${escape}"

# Set cursor highlight foreground color
ansi_set_cursor_highlight_fg_color() {
  printf "${csi}?%s${escape}" "$1"
}

# Reset cursor highlight foreground color
ansi_reset_cursor_highlight_fg_color="${csi}?114${escape}"

# Set cursor highlight background color
ansi_set_cursor_highlight_bg_color() {
  printf "${csi}?%s${escape}" "$1"
}

# Reset cursor highlight background color
ansi_reset_cursor_highlight_bg_color="${csi}?115${escape}"

# Set cursor shape to block
ansi_set_cursor_block="${csi}?1${escape}"

# Set cursor shape to underline
ansi_set_cursor_underline="${csi}?3${escape}"

# Set cursor shape to bar
ansi_set_cursor_bar="${csi}?5${escape}"

# Set cursor shape to legacy
ansi_set_cursor_legacy="${csi}?6${escape}"

# Set cursor shape to invisible
ansi_set_cursor_invisible="${csi}?8${escape}"

# Set cursor shape to outline
ansi_set_cursor_outline="${csi}?9${escape}"