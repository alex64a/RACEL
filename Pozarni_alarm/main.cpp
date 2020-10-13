#include "dialog.h"
#include <QApplication>

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
    wiringPiSetup();
    Dialog w;
    w.setFixedSize(800, 200);
    w.setWindowTitle("Temperature sensor");
    w.show();

    return a.exec();
}
