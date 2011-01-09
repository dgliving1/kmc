package com.kaltura.kmc.modules.content.commands
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.kaltura.commands.metadataProfile.MetadataProfileList;
	import com.kaltura.events.KalturaEvent;
	import com.kaltura.kmc.modules.content.utils.FormBuilder;
	import com.kaltura.types.KalturaMetadataOrderBy;
	import com.kaltura.utils.parsers.MetadataProfileParser;
	import com.kaltura.vo.KMCMetadataProfileVO;
	import com.kaltura.vo.KalturaFilterPager;
	import com.kaltura.vo.KalturaMetadataProfile;
	import com.kaltura.vo.KalturaMetadataProfileFilter;
	import com.kaltura.vo.KalturaMetadataProfileListResponse;
	import com.kaltura.vo.MetadataFieldVO;
	
	import flash.external.ExternalInterface;
	
	import mx.controls.Alert;
	import mx.resources.ResourceManager;
	import mx.rpc.IResponder;
	
	/**
	 * This command is being executed when the event MetadataProfileEvent.LIST is dispatched. 
	 * @author Michal
	 * 
	 */		
	public class ListMetadataProfileCommand extends KalturaCommand {
		
		/**
		 * only if a metadata profile view contains layout with this name it will be used 
		 */		
		public static const KMC_LAYOUT_NAME:String = "KMC";
		
		/**
		 * This command requests the server for the last created metadata profile 
		 * @param event the event that triggered this command
		 * 
		 */		
		override public function execute(event:CairngormEvent):void
		{
			_model.increaseLoadCounter();
			var filter:KalturaMetadataProfileFilter = new KalturaMetadataProfileFilter();
			//this configuration will promise that we will work with the latest metadataProfile version
			filter.orderBy = KalturaMetadataOrderBy.CREATED_AT_DESC;
			var pager:KalturaFilterPager = new KalturaFilterPager();
			pager.pageSize = 1;
			pager.pageIndex = 1;
			var listMetadataProfile:MetadataProfileList = new MetadataProfileList(filter, pager);
			listMetadataProfile.addEventListener(KalturaEvent.COMPLETE, result);
			listMetadataProfile.addEventListener(KalturaEvent.FAILED, fault);
			
			_model.context.kc.post(listMetadataProfile);
		}
		
		/**
		 * This function handles the response from the server. if a profile returned from the server then it will be
		 * saved into the model.
		 * @param data the data returned from the server
		 * 
		 */		
		override public function result(data:Object):void
		{
			super.result(data);
			_model.decreaseLoadCounter();
			var response:KalturaMetadataProfileListResponse =  KalturaMetadataProfileListResponse(data.data);
			var recievedProfile:KalturaMetadataProfile = response.objects[0];
			if (recievedProfile) {
				var metadataProfile:KMCMetadataProfileVO = new KMCMetadataProfileVO();
				metadataProfile.profile = recievedProfile;
				metadataProfile.xsd = new XML(recievedProfile.xsd);
				metadataProfile.metadataFieldVOArray = MetadataProfileParser.fromXSDtoArray(metadataProfile.xsd);
				//set the displayed label of each label
				for each (var field:MetadataFieldVO in metadataProfile.metadataFieldVOArray) {
					var label:String = ResourceManager.getInstance().getString('customFields',field.defaultLabel);
					if (label) 
					{
						field.displayedLabel = label;
					}
					else 
					{
						field.displayedLabel = field.defaultLabel;
					}
				}
				
				_model.filterModel.metadataProfile = metadataProfile;
				
				if (recievedProfile.views) {
					try {
						var recievedView:XML = new XML(recievedProfile.views);
					}
					catch (e:Error) {
						//invalid view xmls
						return;
					}
					for each (var layout:XML in recievedView.children()) {
						if (layout.@id == KMC_LAYOUT_NAME) {
							_model.filterModel.metadataProfile.viewXML = layout;
							return;
							
						}
					}
				}
				
				//if no view was retruned, or no view with "KMC" name, we will set the default uiconf XML
				FormBuilder.setViewXML(_model.entryDetailsModel.metadataDefaultUiconf);
			} 
			
		}
		
		//		/**
		//		 * This function will be called if the request failed
		//		 * @param info the info returned from the server
		//		 * 
		//		 */		
		//		public function fault(info:Object):void
		//		{
		//			if(info && info.error && info.error.errorMsg && info.error.errorMsg.toString().indexOf("Invalid KS") > -1 )
		//			{
		//				ExternalInterface.call("kmc.functions.expired");
		//				return;
		//			}
		//			_model.decreaseLoadCounter();
		//			Alert.show(info.error.errorMsg, ResourceManager.getInstance().getString('cms', 'error'));
		//
		//		}
		
	}
}
