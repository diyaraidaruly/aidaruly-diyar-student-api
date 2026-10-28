#!/bin/bash
# System report script
# Author: Aidaruly Diyar, group IT2-2307

LOG_FILE="$(dirname "$0")/../logs/Aidaruly_Diyar_system_report.log"

{
  echo "=============================================="
  echo "Student full name : Aidaruly Diyar"
  echo "Group             : IT2-2307"
  echo "Date and time     : $(date '+%Y-%m-%d %H:%M:%S')"
  echo "Current user      : $(whoami)"
  echo "----------------------------------------------"
  echo "Operating system  : $(grep PRETTY_NAME /etc/os-release | cut -d= -f2 | tr -d '\"')"
  echo "Kernel version    : $(uname -r)"
  echo "----------------------------------------------"
  echo "CPU info:"
  lscpu | grep -E 'Model name|^CPU\(s\)'
  echo "----------------------------------------------"
  echo "Memory info:"
  free -h
  echo "----------------------------------------------"
  echo "Disk usage:"
  df -h
  echo "----------------------------------------------"
  echo "Available disk space on /:"
  df -h / | awk 'NR==2 {print $4 " available"}'
  echo "=============================================="
} | tee -a "$LOG_FILE"
