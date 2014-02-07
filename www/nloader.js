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
		var options = {"title" : title, "text" : text, "cancelable" : cancelable};
        exec( null, null, 'NLoader', 'startloader', [options]);
    },
	StopLoader: function() {
		var options = {};
        exec( null, null, 'NLoader', 'stoploader', [options]);
    },
};