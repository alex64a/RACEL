#include <wiringPi.h>
#include <stdio.h>

#define BuzzPin 3

int main(void)
{
if(wiringPiSetup() == -1){ // When wiringpi initialization failed printf "WiringPi Failed" 
printf("wiringPi initialization failed !");
return 1;
}
// printf("14CORE | RPI: GPIO %d(wiringPi pin)\n",SoundPin);

pinMode(BuzzPin, OUTPUT);

while(1){
digitalWrite(BuzzPin, HIGH);
delay(100);
digitalWrite(BuzzPin, LOW);
delay(100);
}

return 0;
}
