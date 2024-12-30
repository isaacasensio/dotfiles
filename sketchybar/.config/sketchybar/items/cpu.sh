#!/bin/bash

cpu_top=(
  label.font="$FONT:Semibold:7"
  label=CPU
  icon.drawing=off
  width=0
  padding_right=15
  y_offset=6
)

cpu_percent=(
  label.font="$FONT:Heavy:12"
  label=CPU
  y_offset=-4
  padding_right=15
  width=55
  icon.drawing=off
  update_freq=4
)

cpu_sys=(
  width=0
  graph.color=$RED
  graph.fill_color=$RED
  label.drawing=off
  icon.drawing=off
  background.height=30
  background.drawing=on
  background.color=$TRANSPARENT
)

cpu_user=(
  graph.color=$BLUE
  label.drawing=off
  icon.drawing=off
  background.height=30
  background.drawing=on
  background.color=$TRANSPARENT
)

CORE_COUNT=$(sysctl -n machdep.cpu.thread_count)
CPU_INFO=$(ps -eo pcpu,user)
CPU_SYS=$(echo "$CPU_INFO" | grep -v $(whoami) | sed "s/[^ 0-9\.]//g" | awk "{sum+=\$1} END {print sum/(100.0 * $CORE_COUNT)}")
CPU_USER=$(echo "$CPU_INFO" | grep $(whoami) | sed "s/[^ 0-9\.]//g" | awk "{sum+=\$1} END {print sum/(100.0 * $CORE_COUNT)}")

TOPPROC=$(LANG=C && ps axo "%cpu,ucomm" | sort -nr | tail +1 | head -n1 | awk '{printf "%.0f%% %s\n", $1, $2}' | sed -e 's/com.apple.//g')
CPUP=$(echo $TOPPROC | sed -nr 's/([^\%]+).*/\1/p')

CPU_PERCENT="$(echo "$CPU_SYS $CPU_USER" | awk '{printf "%.0f\n", ($1 + $2)*100}')"

sketchybar --set  cpu.percent label=$CPU_PERCENT% \
                              label.color=$COLOR  \
           --add item cpu.percent right           \
           --set cpu.percent "${CPU_PERCENT}"     \
           --add item cpu.top right               \
           --set  cpu.top     label="$TOPPROC"    \
           --add graph cpu.sys right 75           \
           --push cpu.sys     $CPU_SYS            \
           --add graph cpu.user right 75          \
           --push cpu.user    $CPU_USER

# sketchybar --add item cpu.top right              \
#            --set cpu.top "${TOPPROC}"            \
#                                                  \
#            --add item cpu.percent right          \
#            --set cpu.percent "${CPU_PERCENT}"    \
#                                                  \
#            --add graph cpu.sys right 75          \
#            --set cpu.sys "${CPU_SYS}"            \
#                                                  \
#            --add graph cpu.user right 75         \
#            --set cpu.user "${CPU_USER}"

