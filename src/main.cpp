#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include "timerbackend.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    // Expose TimerBackend to QML as a creatable type
    qmlRegisterType<TimerBackend>("App", 1, 0, "TimerBackend");

    QQmlApplicationEngine engine;
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);

    engine.loadFromModule("QMLProject", "Main");
    return app.exec();
}