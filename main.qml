import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Window {
    id: win
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    function request(url, callback) {
        var xhr = new XMLHttpRequest()
        xhr.onreadystatechange = (function (myxhr) {
            return function () {
                if (myxhr.readyState === 4) {
                    callback(myxhr)
                }
            }
        })(xhr)

        xhr.open("GET", url)
        xhr.send()
    }

    ColumnLayout {
        TextField {
            Layout.alignment: Qt.AlignTop
            height: win.height / 2
            width: win.width / 2
        }

        Button {
            Layout.alignment: Qt.AlignBottom
            height: win.height / 2
            width: win.width / 2

            id: apiRequestButton
            text: "Click Me!"

            onClicked: {
                console.log("Hello")
                request("https://newton.now.sh/api/v2/derive/x%5E2",
                        function (o) {
                            if (o.status === 200) {
                                console.log(o.responseText)
                            } else {
                                console.log("Some error has occurred")
                            }
                        })
            }
        }
    }
}
