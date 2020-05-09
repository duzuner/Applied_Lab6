import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Extras 1.4
import QtQuick.Layouts 1.3

Item {
    width: 300
    height: 400
    QtObject{
        id:priv
        property variant passcode: [1,2,3,4]
        property int inputIndex: -1
        property bool unlocked: false
        property bool programming: false
        function unlock() {
            priv.unlocked=true;
        }
    }

    function startUnlocking()
    {
        priv.inputIndex=0;
        priv.unlocked=false;
    }
    function lock()
    {
        priv.inputIndex=-1;
        priv.unlocked=false;
    }

    function numberInput(number)
    {
        if(priv.inputIndex>=0)
        {
            if(number!==priv.passcode[priv.inputIndex])
            {
                priv.lock();
                return
            }
            else if (number===priv.passcode[priv.inputIndex])
            {
                if(priv.inputIndex==3)
                {
                    priv.unlock();
                }
                else
                {
                    priv.inputIndex++
                }
            }
        }
        else
        {
            return
        }
    }

    Rectangle{
        anchors.fill: parent
        ColumnLayout {
            id: columnLayout
            anchors.fill: parent

            StatusIndicator {
                id: lockedIndicator
                anchors.horizontalCenter: parent.horizontalCenter
                active: !priv.unlocked
            }

            StatusIndicator {
                id: unlockkingIndicator
                color: "#ffe300"
                anchors.horizontalCenter: parent.horizontalCenter
                active: (!priv.unlocked && priv.inputIndex>=0)
            }

            StatusIndicator {
                id: unlockedIndicator
                color: "#42d617"
                anchors.horizontalCenter: parent.horizontalCenter
                active: priv.unlocked
            }

            StatusIndicator {
                id: programmingIndicator
                color: "#201a9c"
                anchors.horizontalCenter: parent.horizontalCenter
                active: priv.programming=true
            }


        }
    }

}
