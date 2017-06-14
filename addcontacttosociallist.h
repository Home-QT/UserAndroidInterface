#ifndef ADDCONTACTTOSOCIALLIST_H
#define ADDCONTACTTOSOCIALLIST_H

#include <QQuickView>
#include <QObject>
#include <QQmlProperty>
#include <QQmlComponent>
#include <QQmlEngine>
#include <QQmlContext>
#include <QNetworkRequest>
#include <QNetworkReply>
#include <QNetworkCookie>

class addContactToSocialList : public QObject
{
     Q_OBJECT
public:
explicit addContactToSocialList(QObject *parent = 0);
public slots:
    void addPeopleToContact();
};

#endif // ADDCONTACTTOSOCIALLIST_H
