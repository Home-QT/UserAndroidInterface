QT       += qml quick
QT       += network
QT       += core
QT       -= gui
QT       += positioning
QT       += svg
QT       += opengl
QT       += multimedia
QT       += quick androidextras
QT       += qml quick core gui widgets androidextras

CONFIG += c++11

SOURCES += \
    main.cpp \
    handlersignals.cpp \
    addcontacttosociallist.cpp \
    getlistoftransaction.cpp \
    notificationclient.cpp\
    backend.cpp
RESOURCES += \
    js.qrc \
    qml.qrc \
    image.qrc

QML_IMPORT_PATH =


QML_DESIGNER_IMPORT_PATH =

DEFINES += QT_DEPRECATED_WARNINGS

qnx: target.path = /tmp/$${TARGET}/bin \  $$[QT_INSTALL_EXAMPLES]/androidextras/notification
else: unix:android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

HEADERS += \
    handlersignals.h \
    addcontacttosociallist.h \
    getlistoftransaction.h \
    notificationclient.h\
    backend.h

DISTFILES += \
    android/AndroidManifest.xml \
    android/gradle/wrapper/gradle-wrapper.jar \
    android/gradlew \
    android/res/values/libs.xml \
    android/build.gradle \
    android/gradle/wrapper/gradle-wrapper.properties \
    android/gradlew.bat \
    android/AndroidManifest.xml \
    android/res/values/libs.xmlx \
    js/grupChat/selectedPeople.js \
    android/src/com/example/contacts/fetch/FetchClass.java \
    android/src/com/example/notification/NotificationClient.java

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android
#{"body":"123321","author":"58ed61ab4c8ebd9459277498","dialogId":45,"time":"2017-05-16T11:23:43.090Z"}
