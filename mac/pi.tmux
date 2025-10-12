kill-window -t PI

neww -n PI "ssh pi@firepick"

split-window -h "ssh pi@firepick"

split-window -v -p 25 "ssh pi@firepick"

select-pane -L
send-keys "clear" C-m
send-keys "tail -f /var/log/firefuse.log&" C-m

split-window -v -p 67 "ssh pi@firepick"
send-keys "clear" C-m
send-keys "tail -f /var/log/raspistill.log&" C-m

split-window -v "ssh pi@firepick"
send-keys "clear" C-m
send-keys "tail -f /var/log/raspistill.sh.log&" C-m
