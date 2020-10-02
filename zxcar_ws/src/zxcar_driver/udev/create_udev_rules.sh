#!/bin/bash

echo "remap the device serial port(ttyUSBX) to zxcar"
echo "zxcar usb connection as /dev/zxcar , check it using the command : ls -l /dev|grep ttyUSB"
echo "start copy zxcar.rules to  /etc/udev/rules.d/"
echo "`rospack find zxcar_driver`/udev/zxcar.rules"
sudo cp `rospack find zxcar_driver`/udev/zxcar.rules  /etc/udev/rules.d
echo " "
echo "Restarting udev"
echo ""
sudo service udev reload
sudo service udev restart
echo "finish "
