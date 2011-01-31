package com.kaltura.delegates.metadataProfile
{
	import flash.utils.getDefinitionByName;

	import com.kaltura.config.KalturaConfig;
	import com.kaltura.net.KalturaCall;
	import com.kaltura.delegates.WebDelegateBase;
	import com.kaltura.errors.KalturaError;
	import com.kaltura.commands.metadataProfile.MetadataProfileAddFromFile;

	import flash.events.DataEvent;
	import flash.events.Event;
	import flash.net.URLRequest;

	import ru.inspirit.net.MultipartURLLoader;

	public class MetadataProfileAddFromFileDelegate extends WebDelegateBase
	{
		protected var mrloader:MultipartURLLoader;

		public function MetadataProfileAddFromFileDelegate(call:KalturaCall, config:KalturaConfig)
		{
			super(call, config);
		}

		override protected function sendRequest():void {
			//construct the loader
			createURLLoader();
			
			//create the service request for normal calls
			var variables:String = decodeURIComponent(call.args.toString());
			var req:String = _config.protocol + _config.domain + "/" + _config.srvUrl + "?service=" + call.service + "&action=" + call.action + "&" + variables;
			(call as MetadataProfileAddFromFile).xsdFile.addEventListener(DataEvent.UPLOAD_COMPLETE_DATA,onDataComplete);
			(call as MetadataProfileAddFromFile).viewsFile.addEventListener(DataEvent.UPLOAD_COMPLETE_DATA,onDataComplete);
			var urlRequest:URLRequest = new URLRequest(req);
			(call as MetadataProfileAddFromFile).xsdFile.upload(urlRequest,"xsdFile");
			(call as MetadataProfileAddFromFile).viewsFile.upload(urlRequest,"viewsFile");
		}

		// Event Handlers
		override protected function onDataComplete(event:Event):void {
			try{
				handleResult( XML(event["data"]) );
			}
			catch( e:Error ){
				var kErr : KalturaError = new KalturaError();
				kErr.errorCode = String(e.errorID);
				kErr.errorMsg = e.message;
				_call.handleError( kErr );
			}
		}

		override protected function createURLLoader():void {
			mrloader = new MultipartURLLoader();
			mrloader.addEventListener(Event.COMPLETE, onDataComplete);
		}

	}
}
