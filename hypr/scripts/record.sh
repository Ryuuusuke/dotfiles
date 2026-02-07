#!/bin/bash

SAVE_DIR="$HOME/Videos"
FILE_NAME="recording_$(date +%H:%M_%d-%m-%Y).mp4"
PID_FILE="/tmp/wf-recorder.pid"
AUDIODEVICE="alsa_output.pci-0000_04_00.6.analog-stereo.monitor"
FRAGFILE="$SAVE_DIR/frag_$(date +%H:%M_%d-%m-%Y).mp4"
#AUDIODEVICE="alsa_input.pci-0000_04_00.6.analog-stereo"

if [ -f "$PID_FILE" ]; then
    PID=$(cat "$PID_FILE")
    kill -s SIGINT "$PID"
    rm "$PID_FILE"
    notify-send "Screen Recorder" "Recording Saved: $FILE_NAME" -t 3000
else
    wf-recorder -r 60  -f "$SAVE_DIR/$FILE_NAME" --audio=$AUDIODEVICE -c h264_vaapi -d /dev/dri/renderD128 -p qp=15 &
    
    REC_PID=$!
    echo "$REC_PID" > "$PID_FILE"
    
    notify-send "Screen Recorder" "Recording in Progress..." -t 1500
fi
