#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QNetworkRequest>
#include <QNetworkReply>
#include <QNetworkCookie>
#include <QQmlContext>
#include <QtWidgets/QApplication>
#include <QtQuick/QQuickView>
#include <QtQml/QQmlEngine>
#include <QtQml/QQmlContext>
#include <QVariant>

#include "handlersignals.h"
#include "addcontacttosociallist.h"
#include "getlistoftransaction.h"
//#include "backend.h"
//#include "notificationclient.h"

///[0]! Кароче тут сама суть работы   ///
///описан конект к серваку при запуске///

int main(int argc, char *argv[])
{
    ///[QML] В принципе этим все сказано ///
   //QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;
        engine.load(QUrl(QLatin1String("qrc:/qml/main.qml")));
        QObject* root = engine.rootObjects()[0];
        HandlerSignals *handlerSignals= new HandlerSignals(root);
        addContactToSocialList *addUserContact= new addContactToSocialList(root);
        getListOfTransaction *getListTransactions= new getListOfTransaction(root);
        /*BackEnd backend;
        engine.rootContext()->setContextProperty("backEnd", &backend);*/
        /*NotificationClient *notificationClient = new NotificationClient(&engine);
           engine.rootContext()->setContextProperty(QLatin1String("notificationClient"),
                                                            notificationClient);*/
        QObject::connect(root, SIGNAL(qmlSignal()),
                         handlerSignals, SLOT(cppSlot()));
        QObject::connect(root, SIGNAL(contactSignal()),
                         addUserContact, SLOT(addPeopleToContact()));
        QObject::connect(root, SIGNAL(getLOT()),
                         getListTransactions, SLOT(getList()));



    return app.exec();
}

