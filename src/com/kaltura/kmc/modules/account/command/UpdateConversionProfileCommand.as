package com.kaltura.kmc.modules.account.command
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.kaltura.commands.conversionProfile.ConversionProfileUpdate;
	import com.kaltura.events.KalturaEvent;
	import com.kaltura.kmc.business.JSGate;
	import com.kaltura.kmc.modules.account.events.ConversionSettingsAccountEvent;
	import com.kaltura.kmc.modules.account.model.AccountModelLocator;
	import com.kaltura.kmc.modules.account.vo.ConversionProfileVO;
	import com.kaltura.vo.KalturaConversionProfile;
	
	import mx.controls.Alert;
	import mx.resources.ResourceManager;
	import mx.rpc.IResponder;
	
	public class UpdateConversionProfileCommand implements ICommand, IResponder
	{
		private var _model : AccountModelLocator = AccountModelLocator.getInstance();
		
		public function execute(event:CairngormEvent):void
		{
			var profileVo:ConversionProfileVO = event.data as ConversionProfileVO;
			
			var id:int = profileVo.profile.id;
			var updateProfile:KalturaConversionProfile = prepareForUpdate(profileVo.profile);
			
			var updateConversionProfile:ConversionProfileUpdate = new ConversionProfileUpdate(profileVo.profile.id, updateProfile);
			updateConversionProfile.addEventListener(KalturaEvent.COMPLETE, result);
			updateConversionProfile.addEventListener(KalturaEvent.FAILED, fault);
			_model.context.kc.post(updateConversionProfile);
		}
		
		private function prepareForUpdate(profile:KalturaConversionProfile):KalturaConversionProfile
		{
			var updatePofile:KalturaConversionProfile = new KalturaConversionProfile();
			updatePofile.name = profile.name;
			updatePofile.description = profile.description;
			updatePofile.flavorParamsIds = profile.flavorParamsIds;
		
			return updatePofile;
		}
		
		public function result(event:Object):void
		{
			_model.loadingFlag = false;
			if(event.error == null)
			{
				Alert.show(ResourceManager.getInstance().getString('account', 'changesSaved'));
			}
			
			var getAllProfilesEvent:ConversionSettingsAccountEvent = new ConversionSettingsAccountEvent(ConversionSettingsAccountEvent.LIST_CONVERSION_PROFILES);
			getAllProfilesEvent.dispatch();
		}
		
		public function fault(info:Object):void
		{
			_model.loadingFlag = false;
			if(info && info.error && info.error.errorMsg) {
				
				if(info.error.errorMsg.toString().indexOf("Invalid KS") > -1 ) {
			
					JSGate.expired();
				} else {
					Alert.show(info && info.error && info.error.errorMsg);
					
					var getAllProfilesEvent:ConversionSettingsAccountEvent = new ConversionSettingsAccountEvent(ConversionSettingsAccountEvent.LIST_CONVERSION_PROFILES);
					getAllProfilesEvent.dispatch();
				}
			}
		}
		

	}
}