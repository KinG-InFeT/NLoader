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

    StartLoader: function(text) {
		var options = {"text": text};
        exec( null, null, 'NLoader', 'startloader', [options]);
    },
	StopLoader: function() {
		var options = {};
        exec( null, null, 'NLoader', 'stoploader', [options]);
    },
};