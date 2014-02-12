/*
 *
 * NLoader plugin for Android
 *
 * @Author Luongo Vincenzo
 *
 * @licenze GPL v3
 *
 *
 */

var exec = require('cordova/exec');

module.exports = {

    StartLoader: function(title, text, cancelable) {
	
		if(device.platform == "iOS") {
			exec( null, null, 'NLoader', 'startloader', [text]);
			exec( null, null, 'NLoader', 'activityStart', []);
		} else {
			var options = {"title" : title, "text" : text, "cancelable" : cancelable};
			exec( null, null, 'NLoader', 'startloader', [options]);
		}
    },
	StopLoader: function() {
		if(device.platform == "IOS") {
			exec( null, null, 'NLoader', 'stoploader', []);
			exec( null, null, 'NLoader', 'activityStop', []);
		} else {
			var options = {};
			exec( null, null, 'NLoader', 'stoploader', [options]);
		}
    },
};