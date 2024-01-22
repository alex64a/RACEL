# Fire alarm detection system based on RaspberryPi model 3B+ 

## Requirements 

1. RaspberryPi with RaspberryPi OS installed on SD Card

2. DS18B20 temperature sensor

3. Flame sensor (IR Reciver)

4. Active buzzer module 

## Pin connections

### DS18B20
![raspberrypi_to_ds18b20](https://github.com/alex64a/RACEL/assets/50616697/e938962d-e24c-41bf-ac3e-4af87cb9f721)

### Buzzer module
![raspberrypi_to_buzzer_module](https://github.com/alex64a/RACEL/assets/50616697/3015a027-ff1d-43da-bde8-b415cd239b6d)


### Flame sensor
1.VCC->3.3-5V
2.GND->GND

## Installation 

Download and mount the RaspberryPi OS to an SD card, I would recommend using the raspberryPi installation software for a easier setup
https://www.raspberrypi.com/software/

QT Creator : https://www.qt.io/product/development-tools

Install required libraries, and add them to the project .pro file with command 
`LIBS += -L/usr/local/include -lwiringPi`

## Demonstration


https://github.com/alex64a/RACEL/assets/50616697/4823e3a7-2bcd-4c7f-8e3b-de0126118cdd




## Credits 
Prof. dr. Ivan Mezei
