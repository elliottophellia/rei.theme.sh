
# Rei Oh-My-Bash Theme Based on Font Theme

CLOCK_THEME_PROMPT_PREFIX=''
CLOCK_THEME_PROMPT_SUFFIX=''
THEME_SHOW_CLOCK=${THEME_SHOW_CLOCK:-"true"}
THEME_CLOCK_FORMAT=${THEME_CLOCK_FORMAT:-"${_omb_prompt_bold_white}%I:%M:%S"}

function _omb_theme_PROMPT_COMMAND() {
local RC="$?"

local pwd="$(pwd | sed 's/\(.*\)/\U\1/')"
local cwd="${_omb_prompt_bold_yellow}[${_omb_prompt_bold_white}${pwd}${_omb_prompt_bold_yellow}]"
local clock_prompt="${_omb_prompt_bold_yellow}[$(clock_prompt)${_omb_prompt_bold_yellow}]"
local user="$(id -u -n | sed 's/\(.*\)/\U\1/')"
local host="$(uname -n | sed 's/\(.*\)/\U\1/')"
local userhost="${_omb_prompt_bold_yellow}[${_omb_prompt_bold_red}${user}${_omb_prompt_bold_white}@${_omb_prompt_bold_cyan}${host}${_omb_prompt_bold_yellow}]"

if [[ ${RC} == 0 ]]; then
    ret_status="${_omb_prompt_bold_green}"
else
    ret_status="${_omb_prompt_bold_brown}"
fi

history -a

PS1="${_omb_prompt_bold_yellow}┌${clock_prompt}${cwd}
${_omb_prompt_bold_yellow}│
└${userhost}[${ret_status}令${_omb_prompt_bold_yellow}]${_omb_prompt_bold_white} "
}

_omb_util_add_prompt_command _omb_theme_PROMPT_COMMAND
