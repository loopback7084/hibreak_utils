#!/bin/bash

list="
./product/overlay/Icon*
./product/app/TrichromeLibrary
./system/system/app/OnlineTTs
./system/system/app/OfflineTTs
./system/system/app/XRZ_Wreader
./system/system/app/ScanDoc
./system/system/app/XRZCalendar
./system/system/app/OP18Dialer
./system/system/app/WifiTransferBook
./system/system/app/Op18Contacts
./system/system/app/LogCollect
./system/system/app/PrintRecommendationService
./system/system/app/LiveWallpapersPicker
./system/system/app/SouGoInput
./system/system/app/xReader
./system/system/app/GW_Gallery2
./system/system/app/OneNote
./system/system/app/Launcher
./system/system/app/XRZImageExplorer
./system/system/app/Op18Mms
./system/system/app/XRZ_Wps
./system/system/app/BK_Input
./system/system/app/NfcNci
./system/system/app/PrintSpooler
./system/system/app/Kindle
./system/system/app/LevBoll
./system/system/app/ChatGPT
./system/system/app/BasicDreams
./system/system/app/BookMall
./system/system/app/DawoYuji
./system/system/app/xMusic
./system/system/app/CompanionDeviceManager
./system/system/app/XVideo
./system/system/app/HTMLViewer
./system/system/app/XRZWebExport
./system/system/app/FileManager
./system/system/app/XRZ_OuLuDict
./system/system/app/BookSelf
./system/system/system_ext/app/Camera
./system/system/system_ext/app/MtkGallery2
./system/system/system_ext/priv-app/MtkDialer
./system/system/system_ext/priv-app/EmergencyInfo
./system/system/system_ext/priv-app/MtkContacts
./system/system/priv-app/MtkMmsService
./system/system/priv-app/CellBroadcastLegacyApp
./system/system/priv-app/MtkMms
./vendor/etc/camera/CameraRoot
./product/priv-app/GoogleGuide
./system/system/app/BluetoothMidiService
./system/system/app/MtkBluetooth
./system/system/app/Calculator
./system/system/app/ClockProd
./system/media/bootanimation.zip
./system/system/app/XRZAppManager
./product/app/WebViewGoogle/WebViewGoogle.apk
"

ignore="
./system/system/app/XrzSettings
"
### For each element in the list... remove the package or folder.
for f in $list
do
    rm -rf $f
done

### Copies a pre-prepared hosts file ( adblock / telemetry nerf etc ) into the system structure.
cp ./hosts.txt ./system/system/etc/hosts

### Fixup a bunch of localistation nonsense ( some of these are in binary packages ).
sed -i 's#ro.build.locale.area=http://ereader.xrztech.com:8090#ro.build.locale.area=http://localhost:8090#g' ./system/system/build.prop
sed -i 's#ro.product.locale=zh-CN#ro.product.locale=en-GB#g' ./system/system/build.prop
sed -i 's#persist.sys.timezone=Asia/Shanghai#persist.sys.timezone=Europe/London#g' ./system/system/build.prop
sed -i 's#persist.sys.country=CN#persist.sys.country=GB#g' ./system/system/build.prop
sed -i 's#persist.sys.language=zh#persist.sys.language=gb#g' ./system/system/build.prop
sed -i 's#www.baidu.com#localhost:443#g' ./vendor/app/GoogleNetworkStackResOverlay/GoogleNetworkStackResOverlay.apk
sed -i 's#www.baidu.com#localhost:443#g' ./vendor/app/NetworkStackInProcessResOverlay/NetworkStackInProcessResOverlay.apk
sed -i 's#www.baidu.com#localhost:443#g' ./vendor/app/NetworkStackResOverlay/NetworkStackResOverlay.apk


