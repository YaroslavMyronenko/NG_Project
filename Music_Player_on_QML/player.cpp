#include <QCoreApplication>
#include <QMediaPlayer>
#include <QMediaMetaData>
#include <QDebug>

int main(int argc, char *argv[]) {
    QCoreApplication app(argc, argv);

    QMediaPlayer player;
    player.setSource(QUrl::fromLocalFile("path/to/audio.mp3"));

    QObject::connect(&player, &QMediaPlayer::mediaStatusChanged, [&](QMediaPlayer::MediaStatus status) {
        if (status == QMediaPlayer::LoadedMedia) {
            qDebug() << "Доступные метаданные:";
            for (const auto &key : player.metaData().keys()) {
                qDebug() << key << ":" << player.metaData().value(key).toString();
            }

            if (player.metaData().contains(QMediaMetaData::Artist)) {
                qDebug() << "Artist:" << player.metaData().value(QMediaMetaData::Artist).toString();
            } else {
                qDebug() << "Метаданные исполнителя отсутствуют.";
            }
        }
    });

    player.play();
    return app.exec();
}
