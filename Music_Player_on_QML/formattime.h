#ifndef FORMATTIME_H
#define FORMATTIME_H

#include <QObject>

class FormatTime : public QObject
{
    Q_OBJECT
public:
    explicit FormatTime(QObject *parent = nullptr);

    Q_INVOKABLE QString formattime(int milliseconds) {
        int totalSeconds = milliseconds / 1000;
        int minutes = totalSeconds / 60;
        int seconds = totalSeconds % 60;

        QString minutesStr = (minutes < 10) ? "0" + QString::number(minutes) : QString::number(minutes);
        QString secondsStr = (seconds < 10) ? "0" + QString::number(seconds) : QString::number(seconds);

        return minutesStr + ":" + secondsStr;
    }

signals:
};

#endif // FORMATTIME_H
