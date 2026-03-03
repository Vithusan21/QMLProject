#pragma once

#include <QObject>
#include <QTimer>

class TimerBackend : public QObject
{
    Q_OBJECT
    Q_PROPERTY(double seconds READ seconds NOTIFY secondsChanged)
    Q_PROPERTY(bool running READ running NOTIFY runningChanged)

public:
    explicit TimerBackend(QObject *parent = nullptr);

    double seconds() const { return m_seconds; }
    bool running() const { return m_running; }

    Q_INVOKABLE void start();
    Q_INVOKABLE void pause();
    Q_INVOKABLE void reset();

signals:
    void secondsChanged();
    void runningChanged();

private:
    void setRunning(bool value);
    void onTick();

    QTimer m_timer;
    double m_seconds = 0.0;     // seconds, increments by 0.5
    bool m_running = false;
};