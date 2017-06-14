#ifndef HANDLERSIGNALS_H
#define HANDLERSIGNALS_H

#include <QQuickView>
#include <QObject>
#include <QVariant>
#include <QNetworkRequest>
#include <QNetworkReply>
#include <QNetworkCookie>
#include <QQmlContext>
#include <QQmlEngine>

static QNetworkAccessManager autorizate;
static QNetworkCookie c;

class HandlerSignals : public QObject
{
    Q_OBJECT
public:
    explicit HandlerSignals(QObject *parent = 0);

signals:

public slots:
    void cppSlot();
};

#endif // HANDLERSIGNALS_H
