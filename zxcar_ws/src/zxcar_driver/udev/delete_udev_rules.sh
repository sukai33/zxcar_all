#!/bin/bash

echo "delete remap the device serial port(ttyUSBX) to zxcar"
echo "sudo rm   /etc/udev/rules.d/zxcar.rules"
sudo rm   /etc/udev/rules.d/zxcar.rules
echo " "
echo "Restarting udev"
echo ""
sudo service udev reload
sudo service udev restart
echo "finish  delete"
