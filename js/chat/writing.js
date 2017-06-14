Qt.include("./../utils/timers.js")

var writingTimer = null;
function setWritingState(state){
    SocketManager.writeChat('writing', {
        dialogId:dialogIdUser,
        writing: state
    })
}

function startWritingTimer(){
    writingTimer = delay(1000, function(){
        setWritingState(false)
        writingTimer = null
    })
}
function startWritingTimer(){
    writingTimer = delay(1000, function(){
        setWritingState(false)
        writingTimer = null
    })
}

function receiveToggleState(){
    if (!writingTimer) {
        setWritingState(true)
        startWritingTimer()
    }
    else {
        stop(writingTimer)
        startWritingTimer()
    }
}
