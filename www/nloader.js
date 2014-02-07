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

    StartLoader: function(text, cancelable, title) {
		var options = {"text" : text, "cancelable" : cancelable, "title" : title};
        exec( null, null, 'NLoader', 'startloader', [options]);
    },
	StopLoader: function() {
		var options = {};
        exec( null, null, 'NLoader', 'stoploader', [options]);
    },
};