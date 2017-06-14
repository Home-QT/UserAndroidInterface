#include "addcontacttosociallist.h"

addContactToSocialList::addContactToSocialList(QObject *parent) : QObject(parent)
{

}

void addContactToSocialList::addPeopleToContact() {
     QObject* atherPeopleId = this->parent()->findChild<QObject*>("contactAtherId");
     QString contactIdUser=(atherPeopleId->property("text")).toString();
     qDebug()<<contactIdUser;
     QNetworkAccessManager *nwam = new QNetworkAccessManager;
     QByteArray json = "{\"email\": \"1speedhack@gmail.com\", \"password\": \"Qweprstar123\"}";

        QUrl url("http://gup.com.ua:8184//api/rest/profilesService/profile/id/"+contactIdUser+"/myContactList/add");
        QNetworkRequest request(url);
        ///Юзаем для авторизации пост запрос ///
        request.setHeader(QNetworkRequest::ContentTypeHeader,"application/json");
        QNetworkReply *reply = nwam->post(request,json);
        QObject::connect( reply, &QNetworkReply::finished, [reply]{
            QString data = reply->readAll();
            qDebug() << data;
        });

}
