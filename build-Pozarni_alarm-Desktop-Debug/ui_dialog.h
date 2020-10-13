/********************************************************************************
** Form generated from reading UI file 'dialog.ui'
**
** Created by: Qt User Interface Compiler version 5.11.3
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_DIALOG_H
#define UI_DIALOG_H

#include <QtCore/QVariant>
#include <QtWidgets/QApplication>
#include <QtWidgets/QDialog>
#include <QtWidgets/QGridLayout>
#include <QtWidgets/QLCDNumber>
#include <QtWidgets/QLabel>

QT_BEGIN_NAMESPACE

class Ui_Dialog
{
public:
    QGridLayout *gridLayout;
    QLCDNumber *tempLcdNumber;
    QLabel *tempLabel;
    QLabel *flame;

    void setupUi(QDialog *Dialog)
    {
        if (Dialog->objectName().isEmpty())
            Dialog->setObjectName(QStringLiteral("Dialog"));
        Dialog->resize(700, 567);
        gridLayout = new QGridLayout(Dialog);
        gridLayout->setSpacing(6);
        gridLayout->setContentsMargins(11, 11, 11, 11);
        gridLayout->setObjectName(QStringLiteral("gridLayout"));
        tempLcdNumber = new QLCDNumber(Dialog);
        tempLcdNumber->setObjectName(QStringLiteral("tempLcdNumber"));
        QPalette palette;
        QBrush brush(QColor(52, 101, 164, 255));
        brush.setStyle(Qt::SolidPattern);
        palette.setBrush(QPalette::Active, QPalette::WindowText, brush);
        palette.setBrush(QPalette::Active, QPalette::Light, brush);
        palette.setBrush(QPalette::Active, QPalette::Dark, brush);
        QBrush brush1(QColor(0, 0, 0, 255));
        brush1.setStyle(Qt::SolidPattern);
        palette.setBrush(QPalette::Active, QPalette::Text, brush1);
        palette.setBrush(QPalette::Active, QPalette::ButtonText, brush1);
        palette.setBrush(QPalette::Inactive, QPalette::WindowText, brush);
        palette.setBrush(QPalette::Inactive, QPalette::Light, brush);
        palette.setBrush(QPalette::Inactive, QPalette::Dark, brush);
        palette.setBrush(QPalette::Inactive, QPalette::Text, brush1);
        palette.setBrush(QPalette::Inactive, QPalette::ButtonText, brush1);
        palette.setBrush(QPalette::Disabled, QPalette::WindowText, brush);
        palette.setBrush(QPalette::Disabled, QPalette::Light, brush);
        palette.setBrush(QPalette::Disabled, QPalette::Dark, brush);
        palette.setBrush(QPalette::Disabled, QPalette::Text, brush);
        palette.setBrush(QPalette::Disabled, QPalette::ButtonText, brush);
        tempLcdNumber->setPalette(palette);
        tempLcdNumber->setDigitCount(6);
        tempLcdNumber->setProperty("value", QVariant(0));

        gridLayout->addWidget(tempLcdNumber, 0, 3, 1, 1);

        tempLabel = new QLabel(Dialog);
        tempLabel->setObjectName(QStringLiteral("tempLabel"));
        QFont font;
        font.setPointSize(24);
        font.setBold(true);
        font.setWeight(75);
        tempLabel->setFont(font);

        gridLayout->addWidget(tempLabel, 0, 0, 1, 1);

        flame = new QLabel(Dialog);
        flame->setObjectName(QStringLiteral("flame"));
        flame->setEnabled(true);
        flame->setMaximumSize(QSize(400, 400));
        QFont font1;
        font1.setPointSize(12);
        flame->setFont(font1);
        flame->setPixmap(QPixmap(QString::fromUtf8("flame.png")));
        flame->setScaledContents(false);

        gridLayout->addWidget(flame, 0, 4, 1, 1);


        retranslateUi(Dialog);

        QMetaObject::connectSlotsByName(Dialog);
    } // setupUi

    void retranslateUi(QDialog *Dialog)
    {
        Dialog->setWindowTitle(QApplication::translate("Dialog", "Dialog", nullptr));
        tempLabel->setText(QApplication::translate("Dialog", "<html><head/><body><p><span style=\" font-size:24pt; font-weight:600; color:#ef2929;\">Temperature</span></p></body></html>", nullptr));
        flame->setText(QString());
    } // retranslateUi

};

namespace Ui {
    class Dialog: public Ui_Dialog {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_DIALOG_H
