#!/system/bin/sh
# Copyright (c) 2009-2015, The Linux Foundation. All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#     * Redistributions of source code must retain the above copyright
#       notice, this list of conditions and the following disclaimer.
#     * Redistributions in binary form must reproduce the above copyright
#       notice, this list of conditions and the following disclaimer in the
#       documentation and/or other materials provided with the distribution.
#     * Neither the name of The Linux Foundation nor
#       the names of its contributors may be used to endorse or promote
#       products derived from this software without specific prior written
#       permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NON-INFRINGEMENT ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR
# CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
# EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
# PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
# OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
# WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
# OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
# ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#

for i in $(seq 5); do
    if [ -f /sys/class/display/disp_param/panel_display ]; then
	panel_display=`cat /sys/class/display/disp_param/panel_display`
	if [ -n "$panel_display" ]; then
	    /system/bin/log -p i -t panel-info-sh Get panel_display successfully $panel_display
	    break
	else
	    /system/bin/log -p i -t panel-info-sh Get panel_display unsuccessfully, try again...
	    sleep 1
	    continue
	fi
	else
	panel_display="0"
	/system/bin/log -p i -t panel-info-sh Get panel_display unsuccessfully, try again...
	sleep 1
    fi
done

case "$panel_display" in
    "1")
        setprop vendor.panel.display 1
        ;;
    "2")
        setprop vendor.panel.display 2
        ;;
    "3")
        setprop vendor.panel.display 3
        ;;
    "4")
        setprop vendor.panel.display 4
        ;;
    "5")
        setprop vendor.panel.display 5
        ;;
    "6")
        setprop vendor.panel.display 6
        ;;
    "7")
        setprop vendor.panel.display 7
        ;;
    "8")
        setprop vendor.panel.display 8
        ;;
    "9")
        setprop vendor.panel.display 9
        ;;
    "@")
        setprop vendor.panel.display 10
        ;;
    "A")
        setprop vendor.panel.display 11
        ;;
    "B")
        setprop vendor.panel.display 12
        ;;
    *)
        setprop vendor.panel.display UNKNOWN
        ;;
esac
