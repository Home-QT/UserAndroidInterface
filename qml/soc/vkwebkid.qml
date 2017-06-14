import QtQuick 2.0
/*import QtQuick.Window 2.0
import QtWebKit 3.0
import "qrc:/js/soc/URLQuery.js" as URLQuery
*/
Item{
    id: loginWindow
    Image {
        id: image
        x: sizeWidthConfig *0
        y: sizeHeigthConfig *  0
        width: sizeWidthConfig *  481
        height: sizeHeigthConfig * 85
        z: 1
        source: "qrc:/image/title/blue.png"
        smooth: true
        Component.onCompleted: {
            p1model.clear()
            seqr = 0

        }
    }
    /*property string applicationId
    property string permissions
    property var finishRegExp: /^https:\/\/oauth.vk.com\/blank.html/

    signal succeeded(string token)
    signal failed(string error)

    function login() {
        var params = {
            client_id: applicationId,
            display: 'popup',
            response_type: 'token',
            redirect_uri: 'http://oauth.vk.com/blank.html'
        }
        if (permissions) {
            params['scope'] = permissions
        }
        webView.url = "https://oauth.vk.com/authorize?%1".arg(URLQuery.serializeParams(params))
    }

    width: 1024
    height: 768

    WebView {
        id: webView

        anchors.fill: parent

        onLoadingChanged: {
            console.log(loadRequest.url.toString())

            if (loadRequest.status === WebView.LoadFailedStatus) {
                loginWindow.failed("Loading error:", loadRequest.errorDomain, loadRequest.errorCode, loadRequest.errorString)
                return
            } else if (loadRequest.status === WebView.LoadStartedStatus) {
                return
            }

            if (!finishRegExp.test(loadRequest.url.toString())) {
                return
            }

            var result = URLQuery.parseParams(loadRequest.url.toString())
            if (!result) {
                loginWindow.failed("Wrong responce from server", loadRequest.url.toString())
                return
            }
            if (result.error) {
                loginWindow.failed("Error", result.error, result.error_description)
                return
            }
            if (!result.access_token) {
                loginWindow.failed("Access token absent", loadRequest.url.toString())
                return
            }

            succeeded(result.access_token)
            return
        }
    }*/
}
