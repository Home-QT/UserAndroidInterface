#include "getlistoftransaction.h"

getListOfTransaction::getListOfTransaction(QObject *parent): QObject(parent)
{

}

void getListOfTransaction :: getList(){
      qDebug()<<"ok";
      QUrl url("http://gup.com.ua:3000/bc/get-contracts-list/d31bc96b05d8291bde11707cb4e25fc89c7065ccecacf903c166ebffdf05d53d");
      QNetworkRequest request;
      request.setUrl(url);
      QEventLoop loop;
      QNetworkAccessManager manager;
      connect(&manager,SIGNAL(finished(QNetworkReply*)),&loop,SLOT(quit()));
      QNetworkReply *reply = manager.get(request);
      loop.exec();
      QByteArray data = reply->readAll();
          ///Нужно но не сейчас  /// /// \brief data

          qDebug() << data;
};
