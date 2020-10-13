#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <wiringPi.h>

#define FlamePin 0
#define BuzzPin 3


double temperatura(void) //očitavanje temperature
{
FILE *ft;
char tekst[100];
ft=fopen("/sys/bus/w1/devices/28-00000a41dec3/w1_slave","r");
if(ft==NULL) return 0;
int i=0;
for(i=0;i<22;i++) //samo temperatura
fscanf(ft,"%s", tekst);
fclose(ft);
//obrisati „t=”
for(i=0;i<10;i++) tekst[i]=tekst[i+2];
int temp=atoi(tekst); //prebaci u double
double tem=(double)temp/1000;
return tem;
};
void myISR(void)
{	
	printf("\nWARNING: FLAME DETECTED !\n");
	pinMode(BuzzPin, OUTPUT);
	int i;
	for(i=0; i <= 40; i++){
	digitalWrite(BuzzPin, HIGH);
	delay(100);
	digitalWrite(BuzzPin, LOW);
	delay(100);
	}
	
	
}

void zapis(double temp) //log metod
{
FILE * log;
log=fopen("log","a+"); //otvoriti datoteku
if(log==NULL) return;
fprintf(log, "\n%.3f", temp);
fclose(log);
};
int main(void)
{
if(wiringPiSetup() == -1) {
		printf("setup wiringPi failed !\n");
		return 1;
}

if(wiringPiISR(FlamePin, INT_EDGE_FALLING, &myISR)) {
		printf("setup interrupt failed !\n");
		return 1;
}

FILE * log;
int cz=0, j=0;
struct timespec ts1, ts2; //merenje vremena
long czas;
log=fopen("log","w");
if(log==NULL) return 0;
fprintf(log, "\n\t\t***Temperatura***\nIzmerena temperatura = %.3f \xC2\xB0 C\t C\n",temperatura());
fclose(log);
printf("\n\nPočetna Temp = %.3f \xC2\xB0 C", temperatura());


while(1)
{

j++; //broj iteracija
clock_gettime(CLOCK_REALTIME, &ts1);
printf("\n%d.\tTemp = %.3f\xC2\xB0 C", j, temperatura());
clock_gettime(CLOCK_REALTIME, &ts2);
//trajanje pojedinacnog //merenja
czas = (ts2.tv_nsec - ts1.tv_nsec)/1000000;
if(czas<=0) czas=czas+999;
/* Prethodni red koriguje povremenu gresku pri merenju
kada se dobija rezultat koji je manji za 999ms u odnosu
na stvarni 
printf("\tTrajanje merenja: %ld ms.", czas);*/
zapis(temperatura()); //upis u datoteku


	if(temperatura() > 23.0) {
			
		myISR();
		break; 
	
	}



}
return 0;
}
