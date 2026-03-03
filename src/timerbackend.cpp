#include "timerbackend.h"

TimerBackend::TimerBackend(QObject *parent)
    : QObject(parent)
{
    m_timer.setInterval(500);
    m_timer.setTimerType(Qt::PreciseTimer);

    connect(&m_timer, &QTimer::timeout, this, &TimerBackend::onTick);
}

void TimerBackend::start()
{
    if (m_running)
        return;

    setRunning(true);
    m_timer.start();
}

void TimerBackend::pause()
{
    if (!m_running)
        return;

    m_timer.stop();
    setRunning(false);
}

void TimerBackend::reset()
{
    m_seconds = 0.0;
    emit secondsChanged();
}

void TimerBackend::setRunning(bool value)
{
    if (m_running == value)
        return;

    m_running = value;
    emit runningChanged();
}

void TimerBackend::onTick()
{
    // every 500 ms -> +0.5 seconds
    m_seconds += 0.5;
    emit secondsChanged();
}