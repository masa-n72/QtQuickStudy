import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Dialogs 1.2

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    background: Rectangle{
        color: "darkBlue"
    }

    Image{
        id:image
        anchors.fill:parent
        fillMode: Image.PreserveAspectFit
        asynchronous: true
    }

    header:ToolBar{
        Flow{
            anchors.fill:parent
            ToolButton{
                text: qsTr("Open")
                icon.name: "document-open"
                onClicked: fileOpenDialog.open()
            }
        }
    }

    FileDialog{
        id:fileOpenDialog
        title:"Select an image file"
        folder:shortcuts.documents
        nameFilters: [
            "Image files (*.png *.jpeg *.jpg)",
        ]
        onAccepted: {
            image.source=fileOpenDialog.fileUrl
        }
    }

    menuBar: MenuBar{
        Menu{
            title:qsTr("&File")
            Action { text: "Cut" }
            Action {
                id: copyAction
                text:qsTr("&Open2...")
                icon.name:"document-open"
                shortcut: StandardKey.Copy
                onTriggered:fileOpenDialog.open()
            }
//            MenuItem{
//                text:qsTr("&Open...")
//                icon.name:"document-open"
//                onTriggered:fileOpenDialog.open()

//            }
        }

        Menu{
            title:qsTr("&Help")
            MenuItem{
                text:qsTr("&About...")
                onTriggered: aboutDialog.open()
            }
        }
    }

    Dialog{
        id:aboutDialog
        title:qsTr("About")
        Label{
            anchors.fill:parent
            text:qsTr("QML Image Viewer https://qmlbook.github.io/ch06-controls/controls.html")
            horizontalAlignment:Text.AlignHCenter
        }

        standardButtons: StandardButton.Ok
    }
}
