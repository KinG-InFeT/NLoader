# NLoader plugin for Android and iOS (Phonegap/Cordova) >= 3.0.0

By Luongo Vincenzo _ @KinG-InFeT

Thanks @bormansquirrel and @smithimage


## Installation the plugin

### Phonegap/Cordova v3.0.0 and later


* Run into your terminal

```text
cordova plugins add https://github.com/KinG-InFeT/NLoader.git
```

* [ANDROID] Go to the folder **_plugins/org.apache.cordova.nloader/src/android_** and open the **NLoader.java** file and replace this line

```java
import com.luongovincenzo.tools.R;
```

with your app id and save file

    [BUILD PROBLEM?] Read This: https://github.com/KinG-InFeT/NLoader/issues/1


* [IOS] Beware, it could happen that the framework **QuartzCore.framework** not added correctly (_BUG of cordova?_) And for not having compilation problems, please add it manually.


* Call the plugin for run loader

```javascript
var title = 'My App'; //Default title NULL (not view title and icon)
var message = 'Loading...'; //Default message "Please wait"
var cancelable = 1; //Default cancelable 0 => NO

NLoader.StartLoader(title, message, cancelable);
```

**NOTE: For the ios platform, title and cancelable parameters are not supported!**

* Call the plugin for stop loader

```javascript
NLoader.StopLoader();
```

* FINISH :D


## CHANGELOG

### 12/02/2014 (v0.4.0)
* Add spinner and network spinner in iOS version

### 10/02/2014 (v0.3.0)
* Initial support for iOS

### 07/02/2014 (v0.2.0)
* Adding personalization title
* Added customization cancellation Touch
* FIX runOnUiThread runnable on Activity
* Implemented try/catch for JSON functions
* ADD not show icon and title when the title is not declared

### 06/02/2014 (v0.1.0)
* Initial release (Tested with Cordova 3.3.0, platform android v4.3.1 and 4.4.2)



## BUG? Read here

If you find a bug you can report it here: https://github.com/KinG-InFeT/NLoader/issues


Thanks
