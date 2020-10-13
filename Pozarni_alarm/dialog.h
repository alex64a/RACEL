#ifndef DIALOG_H
#define DIALOG_H

#include <QDialog>
#include <QApplication>
#include <QWidget>
#include <wiringPi.h>
#include <stdio.h>
#include <QtGlobal>
#include <stdlib.h>
#include <QDebug>
#include <QFile>
#include <stdlib.h>
#include <iostream>
#include <string>
#include <QTimer>
#include <QMessageBox>
#include <QString>
#include <QTextStream>
#include <QImage>
#include <QPixmap>

using namespace std;





namespace Ui {
class Dialog;
}

class Dialog : public QDialog
{
    Q_OBJECT

public:
    explicit Dialog(QWidget *parent = nullptr);
    ~Dialog();
    FILE *ft;





public slots:
  double getTemp(void);
  void buzz();

private:
    Ui::Dialog *ui;
    QString tekst;
    QTimer *myTimer1;
    QTimer *myTimer2;
    //double tem;




};

#endif // DIALOG_H
