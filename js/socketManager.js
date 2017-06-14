var Separator = '/'
var callbacks = {}
var subscribes = {}
var Context = {
    Chat: 'chat',
    Common: 'common'
}

var Socket = null

function callbid()
{
    var cbid = "";
    var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

    for( var i=0; i < 16; i++ )
        cbid += possible.charAt(Math.floor(Math.random() * possible.length));
    return cbid;
}

var EventType = {
    IN: 'IN',
    OUT: 'OUT'
}

function logEvent(type, addres, msg){
    var f = msg.err ? console.error : console.log
    var m = type + ': ' + addres + ' > ' + (msg.err ? msg.err : JSON.stringify(msg.data))
    f(m)
    console.log("current subscriptions: " + Object.keys(subscribes).join(", "))
}

function writeMessageRaw(context, method, data, cb){
    if (!Socket) throw new Error('Socket not applied now')
    var finalMessage = {
        method: context + Separator + method,
        data: {message: {data: JSON.stringify(data)}}
    }
    if (cb) {
        finalMessage.cbId = callbid()
        if (callbacks[finalMessage.cbId]){
                throw new Error('This callback id already defined')
        }
        callbacks[finalMessage.cbId] = function(err, res){
            logEvent(EventType.IN, finalMessage.method, {err: err, data: res})
            cb(err, res)
        }
    }
    Socket.sendTextMessage(JSON.stringify(finalMessage))
    logEvent(EventType.OUT, context + Separator + method, finalMessage)
}

function receiveMessage(message){
    var parsedMessage = JSON.parse(message)
    parsedMessage.data.data = parsedMessage.data.data ? JSON.parse(parsedMessage.data.data) : undefined
    if (parsedMessage.cbId){
        callbacks[parsedMessage.cbId](parsedMessage.data.err, parsedMessage.data.data)
        delete callbacks[parsedMessage.cbId]
    }
    else {
        var gottenSubs = subscribes[parsedMessage.method]
        if (!gottenSubs) {
            if (urlBilderForWebSocket === "qrc:/qml/friend/Friend.qml"){
                friendUrl = ""
                friendUrl = "qrc:/qml/friend/Friend.qml"
            }
            throw new Error('no subs for ' + parsedMessage.method + ", available subs " + Object.keys(subscribes).join(", "))
        }
        gottenSubs.forEach(function(s){
            s(parsedMessage.data.err, parsedMessage.data.data)
        })
    }
}

function subscribe(context, method, cb){
    var combinedAddr = context + Separator + method
    //console.log('Subscribing on ' + combinedAddr)
    var createdSub = function(err, res){
        logEvent(EventType.IN, combinedAddr, {err: err, data: res})
        cb(err, res)
    }
    subscribes[combinedAddr] = subscribes[combinedAddr] || []
    subscribes[combinedAddr].push(createdSub)
    //console.log("subs after subscription: " + Object.keys(subscribes).join(", "))
}

function applySocket(socket){
    if(Socket) throw new Error('Socket already applied')
    Socket = socket
}

function writeCommon(method, data, cb){
    writeMessageRaw(Context.Common, method, data, cb)
}

function searchCommon(method, data, cb){
    writeMessageRaw(Context.Chat, method, data, cb)
}

function writeChat(method, data, cb){
    writeMessageRaw(Context.Chat, method, data, cb)
}

function lastChat(method, data, cb){
    writeMessageRaw(Context.Chat, method, data, cb)
}

function getMessagesChat(method, data, cb){
    writeMessageRaw(Context.Chat, method, data, cb)
}

function writingAtherChat(method, data, cb){
    writeMessageRaw(Context.Chat, method, data, cb)
}
function rename(method, data, cb){
    writeMessageRaw(Context.Chat, method, data, cb)
}
function addMember(method, data, cb){
    writeMessageRaw(Context.Chat, method, data, cb)
}

function updateStatusSubscription(method, data, cb){
    writeMessageRaw(Context.Common, method, data, cb)
}


function geoPos(method, data, cb){
    writeMessageRaw(Context.Chat, method, data, cb)
}


