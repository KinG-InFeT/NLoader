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

//Librerie richieste
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
			
			this.StartLoader(jo.getString("title"), jo.getString("text"), jo.getInt("cancelable"), callbackContext); 
			
        } else if(action.equals("stoploader")) {
		
			this.StopLoader(callbackContext);
			
		} else {
            return false;
        }
		
		callbackContext.success();
		return true;
		
    }
	
	public void StartLoader(String title, String text, Integer cancelable, CallbackContext callbackContext) {
	
		//Default value
		if(text == "") {
			text = "Please wait";
		}
		
		this.showWaitingDialog(title, text, cancelable);
		callbackContext.success();

	}
	
	public void StopLoader(CallbackContext callbackContext) {
		this.hideWaitingDialog();
		callbackContext.success();
	}
	
	//Avvio il loader
	public void showWaitingDialog(String title, String text, Integer cancelable) {
		//OLD
		//waitingDialog = ProgressDialog.show(this.cordova.getActivity(), "", text);
		
		//NEW
		//Avvio l'istanza
		waitingDialog = new ProgressDialog(this.cordova.getActivity());
		
		//setto se è possibile cancellarla al tocco dello schermo
		if(cancelable == 1) {
			waitingDialog.setCancelable(true);
		}else{
			waitingDialog.setCancelable(false);
		}
		
		//Setto il testo da apparire
		waitingDialog.setMessage(text);
		
		//Setto il titolo
		if(title != '') {
			waitingDialog.setTitle(title);
		]
		
		//Setto di che tipologia deve essere la progressbar
		waitingDialog.setProgressStyle(ProgressDialog.STYLE_SPINNER);
		
		// FOR -> STYLE_HORIZONTAL
		//waitingDialog.setProgress(0);
		//waitingDialog.setMax(100);
		
		//Appare
		waitingDialog.show();
			
	}
	
	public void hideWaitingDialog() {
	
		if (waitingDialog != null) { //Aperto? chiudilo
		
			waitingDialog.dismiss();
			waitingDialog = null;
			
		} else {// altrimenti gestisco l'exeption e non eseguo niente
		
			//LOG.d("WaitingDialog", "Nothing to dismiss");
		}
	}
	
}
