import QtQuick 2.7
import QtQuick.Controls 2.2

Item {
    width: 90
    height: 90
    signal clickSignal(string number)
    property string number
    Button {
        id: button

        anchors.fill: parent
        text: number
        highlighted: false
        checkable: false
        font.pointSize: 40
        font.weight: Font.Bold
        font.family: "Arial"

        onClicked:parent.clickSignal(number)
    }
}
