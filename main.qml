import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Window {
    id: win
    width: 640
    height: 480
    visible: true
    title: qsTr("Derivative calculator")

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
        Layout.fillHeight: true
        Layout.fillWidth: true
        anchors.fill: parent

        TextField {
            //            Layout.alignment: Qt.AlignTop
            id: textid
            Layout.fillHeight: true
            Layout.fillWidth: true
        }

        Button {
            //            Layout.alignment: Qt.AlignBottom
            Layout.fillHeight: true
            Layout.fillWidth: true
            id: apiRequestButton
            text: "Calculate"

            onClicked: {
                console.log("Calculating")
                request("https://newton.now.sh/api/v2/derive/" + textid.text,
                        function (o) {
                            if (o.status === 200) {
                                console.log(o.responseText)
                                const parsed = JSON.parse(o.responseText)
                                output.text = parsed.result
                            } else {
                                console.log("Some error has occurred")
                            }
                        })
            }
        }

        TextField {
            Layout.fillHeight: true
            Layout.fillWidth: true
            id: output
        }
    }
}
