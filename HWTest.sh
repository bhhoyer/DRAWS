echo 'DRAWS HW TEST'
cat /proc/device-tree/hat/vendor
echo ''
cat /proc/device-tree/hat/product
echo ''
echo 'Revision:'
cat /proc/device-tree/hat/product_ver
sleep 1
echo ''
echo ''

echo 'I2C: UU at Adresses 108, 408, 500'
i2cdetect -y 1
sleep 2
echo ''

echo 'CODEC: card 2: udrc'
aplay -l | grep 'udrc'
sleep 2
echo ''

echo 'ADC: Voltages'
sensors | grep '+5V\|+12V\|User'
sleep 2
echo ''

echo "I2C Serial Ports: ttySC0, ttySC1"
ls /dev/ttySC*
sleep 2
echo ''

echo 'GPS: $GN*'
gpspipe -r -n 6 | grep '$G'
sleep 2
echo ''

echo 'PTT: Left & Right LEDs'
gpio -g write 12 1
sleep 2
gpio -g write 12 0
gpio -g write 23 1
sleep 2
gpio -g write 23 0
echo ''
echo 'COMPLETE!'