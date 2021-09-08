# ZoomSDK_macOS
This is a sample project written in swift for Zoom Video SDK of macOS

<img width="500" alt="screen1" src="https://raw.githubusercontent.com/tommy19970714/ZoomSDK_macOS/main/screenshots/screen1.png">
<img width="500" alt="screen3" src="https://raw.githubusercontent.com/tommy19970714/ZoomSDK_macOS/main/screenshots/screen3.png">

# To Build

Open terminal in this project root path and run the following script.

```
sh ./codesign.sh "Apple Development: Developer Name"
```

# Setup
Open ViewController.swift L26-L27 and rewrite your ZoomSDK key and secret.
You can get Zoom SDK keys from [Zoom App Marketplace](https://marketplace.zoom.us/)

```
let kZoomSDKKey = "SDK_API_KEY"
let kZoomSDKSecret = "SDK_API_SECRET"
```
