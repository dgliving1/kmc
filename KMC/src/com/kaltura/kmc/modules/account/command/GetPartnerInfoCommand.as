package com.kaltura.kmc.modules.account.command
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.kaltura.commands.partner.PartnerGetInfo;
	import com.kaltura.events.KalturaEvent;
	import com.kaltura.kmc.business.JSGate;
	import com.kaltura.kmc.modules.account.model.AccountModelLocator;
	import com.kaltura.kmc.modules.account.vo.NotificationVO;
	import com.kaltura.kmc.modules.account.vo.PartnerVO;
	import com.kaltura.vo.KalturaPartner;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.resources.ResourceManager;
	import mx.rpc.IResponder;
	
	public class GetPartnerInfoCommand implements ICommand, IResponder
	{
		private var _model : AccountModelLocator = AccountModelLocator.getInstance();
		
		public function execute(event:CairngormEvent):void
		{
			//we only load the partner info 1 time in this app
			if(_model.partnerInfoLoaded)
				return;
			
			_model.loadingFlag = true;
			/*	var params : Object = _model.context.defaultUrlVars;
			var delegate : GetPartnerInfoDelegate = new GetPartnerInfoDelegate( this );
			delegate.getPartnerInfo( params );  */
			
			var getPartnerInfo:PartnerGetInfo = new PartnerGetInfo();
			getPartnerInfo.addEventListener(KalturaEvent.COMPLETE, result);
			getPartnerInfo.addEventListener(KalturaEvent.FAILED, fault);
			_model.context.kc.post(getPartnerInfo);	
			
			
		}
		
		public function result(data:Object):void
		{
			_model.loadingFlag = false;
			if(data.data is KalturaPartner)
			{
				var resultKp:KalturaPartner = data.data as KalturaPartner;
				var pvo : PartnerVO = new PartnerVO;
				pvo.subPId = _model.context.subpId;
				pvo.adminSecret = resultKp.adminSecret;
				pvo.adminEmail = resultKp.adminEmail;
				pvo.adminName = resultKp.adminName;
				pvo.adultContent = resultKp.adultContent;
				//		pvo.allowEmptyField = resultKp.;
				//		pvo.allowMultiNotification = resultKp.;
				pvo.allowQuickEdit = resultKp.allowQuickEdit == 1;
				pvo.appearInSearch = resultKp.appearInSearch;
				pvo.commercialUse = int(resultKp.commercialUse);
				pvo.contentCategories = (resultKp.contentCategories == null) ? '' : resultKp.contentCategories;
				pvo.createdAt = resultKp.createdAt;
				
				//var dateArr : Array = (pvo.createdAt).split('-');
				var date:Date = new Date((pvo.createdAt) * 1000);
				
				pvo.createdYear = date.fullYear;
				pvo.createdMonth = date.month;
				pvo.createdDay = date.date;
				
				pvo.defConversionProfileType = resultKp.defConversionProfileType;
				pvo.describeYourself = resultKp.describeYourself;
				pvo.description = resultKp.description;
				pvo.landingPage = resultKp.landingPage;
				pvo.maxUploadSize = resultKp.maxUploadSize;
				pvo.mergeEntryLists = resultKp.mergeEntryLists == 1;
				pvo.name = resultKp.name;
				pvo.notificationsConfig = resultKp.notificationsConfig;
				//pvo.notifications  
				createNotificationArray(resultKp.notificationsConfig, pvo.notifications);
				pvo.notify = resultKp.notify == 1;
				pvo.partnerPackage = resultKp.partnerPackage;
				pvo.phone = resultKp.phone;
				pvo.pId = _model.context.kc.partnerId;
				pvo.secret = resultKp.secret;
				pvo.status = resultKp.status;
				pvo.type = resultKp.type;
				pvo.url1 = resultKp.website;
				pvo.url2 = resultKp.notificationUrl;
				pvo.userLandingPage = resultKp.userLandingPage;
				pvo.accountOwnerId = resultKp.adminUserId;
				
				
				_model.partnerData = pvo;
			}
			_model.partnerInfoLoaded = true;
		}
		
		public function fault(info:Object):void
		{
			if(info && info.error && info.error.errorMsg && info.error.errorMsg.toString().indexOf("Invalid KS") > -1 )
			{
				JSGate.expired();
				return;
			}
			Alert.show(ResourceManager.getInstance().getString('account', 'notLoadPartnerData'), ResourceManager.getInstance().getString('account', 'error'));
			_model.loadingFlag = false;
		}
		
		
		private function createNotificationArray( str : String , arrCol : ArrayCollection ) : void
		{
			if(str == null)
			{
				return;
			} 
			
			str = (str == null) ? '' : str;
			
			var tempNotiArray : Array = str.split(";");
			var i:int=0;
			//set the notification to *=0 and make the changes needed
			switch(tempNotiArray[0]) 
			{
				case "*=0": //all off
					for( i=0 ; i < arrCol.length ; i++)
					{
						(arrCol[i] as NotificationVO).availableInClient = false;
						(arrCol[i] as NotificationVO).availableInServer = false;
					}
					break; 
				case "*=1": //all server on
					for( i=0 ; i < arrCol.length ; i++)
					{
						(arrCol[i] as NotificationVO).availableInClient = false;
						(arrCol[i] as NotificationVO).availableInServer = true;
					}
					break; 
				case "*=2":  //all client on
					for( i=0 ; i < arrCol.length ; i++)
					{
						(arrCol[i] as NotificationVO).availableInClient = true;
						(arrCol[i] as NotificationVO).availableInServer = false;
					}
					break;
				case "*=3": //all on
					for( i=0 ; i < arrCol.length ; i++)
					{
						(arrCol[i] as NotificationVO).availableInClient = true;
						(arrCol[i] as NotificationVO).availableInServer = true;
					}
					break; 
			}
			
			for(i=1; i<tempNotiArray.length; i++)
			{
				var keyValArr : Array = tempNotiArray[i].split("=");
				for(var j:int=0; j<arrCol.length ; j++)
				{
					if((arrCol[j] as NotificationVO).nId == keyValArr[0])
					{
						switch(keyValArr[1])
						{
							case "0": 
								(arrCol[j] as NotificationVO).availableInClient = false;
								(arrCol[j] as NotificationVO).availableInServer = false;
								break;
							case "1": 
								(arrCol[j] as NotificationVO).availableInClient = false;
								(arrCol[j] as NotificationVO).availableInServer = true;
								break;
							case "2": 
								(arrCol[j] as NotificationVO).availableInClient = true;
								(arrCol[j] as NotificationVO).availableInServer = false;
								break;
							case "3": 
								(arrCol[j] as NotificationVO).availableInClient = true;
								(arrCol[j] as NotificationVO).availableInServer = true;
								break;
						}
					}
				}
			}
		}
		
		
	}
}