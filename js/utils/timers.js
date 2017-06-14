function Timer() {
    return Qt.createQmlObject("import QtQuick 2.0; Timer {}", mainItem);
}

function delay(delayTime, cb) {
    var timer = new Timer();
    timer.interval = delayTime;
    timer.repeat = false;
    timer.triggered.connect(cb);
    timer.start();
    return timer;
}

function stop(timer){
    timer.stop();
}

function restart(timer){
    timer.restart();
}
