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

package org.apache.cordova.nloader;


import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.CallbackContext;

import android.content.Intent;

import android.app.LoaderManager;
import android.app.ProgressDialog;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;


//import android.provider.Settings;

public class NLoader extends CordovaPlugin {

	private ProgressDialog waitingDialog = null;

	/**
     * Constructor.
     */
    public NLoader() {
    }

	@Override
    public boolean execute(String action, JSONArray args, CallbackContext callbackContext) throws JSONException {
		
		if (action.equals("startloader")) {
			
			JSONObject jo = args.getJSONObject(0);
			
			this.StartLoader(jo.getString("text"), callbackContext); 
			
        } else if(action.equals("stoploader")) {
		
			this.StopLoader(callbackContext);
			
		} else {
            return false;
        }
		
		callbackContext.success();
		return true;
		
    }
	
	public void StartLoader(String text, CallbackContext callbackContext) {
	
		//Default value
		if(text == '') {
			String text = "Please wait";
		}
		
		this.showWaitingDialog(text);
		callbackContext.success();
		return true;

	}
	
	public void StopLoader(CallbackContext callbackContext) {
		this.hideWaitingDialog();
		callbackContext.success();
		return true;
	}
	
	public void showWaitingDialog(String text) {
		waitingDialog = ProgressDialog.show(this.cordova.getActivity(), "", text);
	}
	
	public void hideWaitingDialog() {
		if (waitingDialog != null) {
			waitingDialog.dismiss();
			//LOG.d("WaitingDialog", "Dialog dismissed");
			waitingDialog = null;
		} else {
			//LOG.d("WaitingDialog", "Nothing to dismiss");
		}
	}
	
}
