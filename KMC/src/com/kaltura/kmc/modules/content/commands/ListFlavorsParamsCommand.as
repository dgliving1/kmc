package com.kaltura.kmc.modules.content.commands {
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.kaltura.commands.flavorParams.FlavorParamsList;
	import com.kaltura.errors.KalturaError;
	import com.kaltura.events.KalturaEvent;
	import com.kaltura.kmc.model.types.APIErrorCode;
	import com.kaltura.vo.KalturaFilterPager;
	import com.kaltura.vo.KalturaFlavorParams;
	import com.kaltura.vo.KalturaFlavorParamsListResponse;
	
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;
	import mx.resources.ResourceManager;
	import mx.rpc.IResponder;

	public class ListFlavorsParamsCommand extends KalturaCommand implements ICommand, IResponder {
		public static const DEFAULT_PAGE_SIZE:int = 500;
		
		override public function execute(event:CairngormEvent):void {
			_model.increaseLoadCounter();
			var flavorsPager:KalturaFilterPager = new KalturaFilterPager();
			flavorsPager.pageSize = DEFAULT_PAGE_SIZE;
			var getListFlavorParams:FlavorParamsList = new FlavorParamsList(null, flavorsPager);
			getListFlavorParams.addEventListener(KalturaEvent.COMPLETE, result);
			getListFlavorParams.addEventListener(KalturaEvent.FAILED, fault);
			_model.context.kc.post(getListFlavorParams);
		}


		override public function result(event:Object):void {
//			super.result(event);
			if (event.error) {
				var er:KalturaError = event.error as KalturaError;
				if (er) {
					Alert.show(er.errorMsg, "Error");
				}
			}
			else {
				clearOldData();
				var tempFlavorParamsArr:ArrayCollection = new ArrayCollection();
				var response:KalturaFlavorParamsListResponse = event.data as KalturaFlavorParamsListResponse;
				// loop on Object and cast to KalturaFlavorParams so we don't crash on unknown types:
				for each (var kFlavor:Object in response.objects) {
					if (kFlavor is KalturaFlavorParams) {
						tempFlavorParamsArr.addItem(kFlavor);
					}
				}
				_model.filterModel.flavorParams = tempFlavorParamsArr;
			}
			_model.decreaseLoadCounter();
		}


		private function clearOldData():void {
			_model.filterModel.flavorParams.removeAll();
		}
	}
}