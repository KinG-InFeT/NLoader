# NLoader plugin for Android/(Phonegap/Cordova) >= 3.0.0
By Luongo Vincenzo _ @KinG-InFeT


## Installation the plugin

### Phonegap/Cordova v3.0.0 and later


* Run into your terminal

```text
cordova plugins add https://github.com/KinG-InFeT/NLoader.git
```

* Call the plugin for run loader

```javascript
var title = 'My App'; //Default title NULL (not view)
var message = 'Loading...'; //Default message "Please wait"
var cancelable = 1; //Default cancelable 0 => NO
NLoader.StartLoader(message, cancelable, title);
```

* Call the plugin for stop loader

```javascript
NLoader.StopLoader();
```

* FINISH :D



## CHANGELOG

### 07/02/2014 (v0.1.0)
* Initial release (Tested with Cordova 3.3.0, platform android v4.3.1 and 4.4.2)



## BUG? Read here

If you find a bug you can report it here: https://github.com/KinG-InFeT/NLoader/issues


Thanks