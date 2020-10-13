#include "dialog.h"
#include "ui_dialog.h"
#include <string>
#include <iostream>

using namespace std;




Dialog::Dialog(QWidget *parent) :
    QDialog(parent),
    ui(new Ui::Dialog)
{
    ui->setupUi(this);

    myTimer1 = new QTimer(this);
    connect(myTimer1, SIGNAL(timeout()), this, SLOT(getTemp()));    //povezi tajmer sa getTemp() funkcijom
    myTimer1->start(1000);    //izvrsavaj sTe svake sekunde
    myTimer2 = new QTimer(this);
    connect(myTimer2, SIGNAL(timeout()), this, SLOT(buzz()));
    myTimer2->start(1000);
    pinMode(3, OUTPUT); //buzzer
    pinMode(0, OUTPUT); //flame pin
    QPixmap pix(":/slike/flame.png");



}

double Dialog::getTemp(void){

    FILE *ft;
    char tekst[100];
    ft=fopen("/sys/bus/w1/devices/28-00000a41dec3/w1_slave","r");

    int i=0;
    for(i=0;i<22;i++) //samo temperatura
    fscanf(ft,"%s", tekst);
    fclose(ft);
    for(i=0;i<10;i++) tekst[i]=tekst[i+2];

    double temp=atoi(tekst); //prebaci u double
    double tem=temp/1000;

    qDebug() << tem;
    ui->tempLcdNumber->display(tem);


    return tem;


    }

void Dialog::buzz() {

    pinMode(3, OUTPUT);
    int j;
    if(getTemp()>24.0) {

         QPixmap pix(":/slike/flame.png");
         ui->flame->setPixmap(pix.scaled(200,200,Qt::KeepAspectRatio));
        for(j = 0;j<20;j++)
        {
            digitalWrite(3, HIGH);
            delay(100);
            digitalWrite(3, LOW);
            delay(100);
        }



    }

}

Dialog::~Dialog()
{
    delete ui;
}


