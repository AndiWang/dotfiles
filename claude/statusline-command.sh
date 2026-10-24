#!/bin/sh
input=$(cat)

cwd=$(echo "$input" | jq -r '.workspace.current_dir // .cwd // empty')
model=$(echo "$input" | jq -r '.model.display_name // empty')
remaining=$(echo "$input" | jq -r '.context_window.remaining_percentage // empty')
output_style=$(echo "$input" | jq -r '.output_style.name // empty')
five_hour=$(echo "$input" | jq -r '.rate_limits.five_hour.used_percentage // empty')
seven_day=$(echo "$input" | jq -r '.rate_limits.seven_day.used_percentage // empty')
effort=$(echo "$input" | jq -r '.effort_level // .effortLevel // .model.effort // empty')
if [ -z "$effort" ]; then
  effort=$(jq -r '.effortLevel // empty' "$HOME/.claude/settings.json" 2>/dev/null)
fi

# ANSI colors (256-color + styles)
DIM=$'\033[38;5;244m'
BOLD=$'\033[1m'
RESET=$'\033[0m'
CYAN=$'\033[38;5;24m'
MAGENTA=$'\033[38;5;90m'
YELLOW=$'\033[38;5;94m'
GREEN=$'\033[38;5;22m'
ORANGE=$'\033[38;5;130m'
RED=$'\033[38;5;124m'
GRAY=$'\033[38;5;240m'

SEP="${DIM} · ${RESET}"

# color by remaining percentage: green >50, orange 20-50, red <20
color_for_pct() {
  p=$1
  [ -z "$p" ] && { printf '%s' "$GRAY"; return; }
  n=$(printf '%.0f' "$p")
  if [ "$n" -ge 50 ]; then printf '%s' "$GREEN"
  elif [ "$n" -ge 20 ]; then printf '%s' "$ORANGE"
  else printf '%s' "$RED"
  fi
}

# Shorten home directory to ~
home="$HOME"
case "$cwd" in
  "$home"*) short_cwd="~${cwd#$home}" ;;
  *) short_cwd="$cwd" ;;
esac
cwd_part="${CYAN}${short_cwd}${RESET}"

# Git branch
branch_part=""
if git -C "$cwd" rev-parse --git-dir > /dev/null 2>&1; then
  branch=$(git -C "$cwd" -c core.hooksPath=/dev/null symbolic-ref --short HEAD 2>/dev/null)
  if [ -n "$branch" ]; then
    branch_part=" ${MAGENTA}⎇ ${branch}${RESET}"
  fi
fi

# Model
model_part=""
if [ -n "$model" ]; then
  model_part="${SEP}${YELLOW}◆ ${model}${RESET}"
fi

# Context remaining
ctx_part=""
if [ -n "$remaining" ]; then
  c=$(color_for_pct "$remaining")
  ctx_part="${SEP}${c}${remaining}%${RESET}${DIM} ctx${RESET}"
fi

# Effort
effort_part=""
if [ -n "$effort" ]; then
  case "$effort" in
    low)    ec="$GRAY" ;;
    medium) ec="$YELLOW" ;;
    high)   ec="$ORANGE" ;;
    xhigh)  ec="$RED" ;;
    max)    ec="${BOLD}${RED}" ;;
    *)      ec="$GRAY" ;;
  esac
  effort_part="${SEP}${ec}⚡ ${effort}${RESET}"
fi

# Output style (non-default)
style_part=""
if [ -n "$output_style" ] && [ "$output_style" != "default" ]; then
  style_part="${SEP}${GRAY}✎ ${output_style}${RESET}"
fi

# Quota (5h / 7d remaining)
rate_part=""
if [ -n "$five_hour" ] || [ -n "$seven_day" ]; then
  if [ -n "$five_hour" ]; then
    five_rem=$(printf '%.0f' "$(echo "$five_hour" | awk '{print 100 - $1}')")
    fc=$(color_for_pct "$five_rem")
    rate_part="${rate_part}${SEP}${fc}${five_rem}%${RESET}${DIM} 5h${RESET}"
  fi
  if [ -n "$seven_day" ]; then
    week_rem=$(printf '%.0f' "$(echo "$seven_day" | awk '{print 100 - $1}')")
    wc=$(color_for_pct "$week_rem")
    rate_part="${rate_part}${SEP}${wc}${week_rem}%${RESET}${DIM} 7d${RESET}"
  fi
fi

printf '%s%s%s%s%s%s%s' \
  "$cwd_part" "$branch_part" "$model_part" "$ctx_part" "$effort_part" "$style_part" "$rate_part"
