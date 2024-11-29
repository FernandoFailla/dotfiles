#!/bin/sh

load_display_config() {
    if xrandr | grep "HDMI-0 connected"; then
        echo "SIU"
        /home/fernando/.screenlayout/ispadrao.sh
    else
        echo "NÃO"
        /home/fernando/.screenlayout/notebook_only.sh
    fi
}

load_display_config
