#ifndef PLAYER_BUTTONS_H
#define PLAYER_BUTTONS_H

#include <QObject>
#include <QDebug>
#include <QMediaPlayer>


class Player_Buttons : public QObject
{
    Q_OBJECT
public:
    explicit Player_Buttons(QObject *parent = nullptr);

public slots:

};

#endif // PLAYER_BUTTONS_H
