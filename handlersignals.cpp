#include "handlersignals.h"

HandlerSignals::HandlerSignals(QObject *parent) : QObject(parent)
{

}

static QString ATocken;
static QString jsonToken;

int l = 1;

void HandlerSignals::cppSlot() {
    QObject* textArea = this->parent()->findChild<QObject*>("textArea");
    switch (l) {
    case 1:
        //Найдем строки ввода
        QObject* field1 = this->parent()->findChild<QObject*>("field1");
        QObject* field2 = this->parent()->findChild<QObject*>("field2");
        //Найдем поле вывода
         //Считаем информацию со строк ввода через свойство text
        QString str1=(field1->property("text")).toString();
        QString str2=(field2->property("text")).toString();
        QUrl url("http://gup.com.ua:8183/api/oauth/login/");

        QNetworkRequest request(url);
        request.setHeader(QNetworkRequest::ContentTypeHeader,"application/json;charset=utf-8");
        QByteArray email = str1.toUtf8().left(1000) ;
        QByteArray password = str2.toUtf8().left(1000) ;

        QByteArray json = "{\"email\": \"" + email + "\", \"password\": \"" + password + "\"}";

        ///Юзаем для авторизации пост запрос ///
        QNetworkReply* reply = autorizate.post(request,json);
        connect( reply, &QNetworkReply::finished, [reply]{
            ///Нужно но не сейчас  /// /// \brief data
            QString data = reply->readAll(); ///
            //qDebug() << data;
            ///[2]! Метод получения куки///
            QVariant var = reply->header(QNetworkRequest::SetCookieHeader);
            QList<QNetworkCookie> cookies = qvariant_cast<QList<QNetworkCookie> >(var);
            qDebug()<< cookies;
            foreach(c, cookies) {

                ///Получили и хорошо///
                jsonToken = QString(c.value());

            }

        });



        l++;
        break;
    }


    textArea->setProperty("text", jsonToken);

}


