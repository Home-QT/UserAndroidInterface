#ifndef GETLISTOFTRANSACTION_H
#define GETLISTOFTRANSACTION_H

#include <QQuickView>
#include <QObject>
#include <QVariant>
#include <QNetworkRequest>
#include <QNetworkReply>
#include <QNetworkCookie>
#include <QQmlContext>
#include <QQmlEngine>
#include <QEventLoop>


class getListOfTransaction : public QObject
{
    Q_OBJECT
public:
    explicit getListOfTransaction(QObject *parent = 0);

signals:

public slots:
   void getList();
};

#endif // GETLISTOFTRANSACTION_H
