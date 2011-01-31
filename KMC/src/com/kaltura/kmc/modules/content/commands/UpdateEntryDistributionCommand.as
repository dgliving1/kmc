package com.kaltura.kmc.modules.content.commands
{
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.kaltura.commands.entryDistribution.EntryDistributionUpdate;
	import com.kaltura.events.KalturaEvent;
	import com.kaltura.kmc.modules.content.events.EntryDistributionEvent;
	import com.kaltura.vo.KalturaEntryDistribution;

	public class UpdateEntryDistributionCommand extends KalturaCommand
	{
		private var _entryDis:KalturaEntryDistribution;
		
		override public function execute(event:CairngormEvent):void {
			_model.increaseLoadCounter();
			_entryDis = (event as EntryDistributionEvent).entryDistribution;
			_entryDis.setUpdatedFieldsOnly(true);
			var update:EntryDistributionUpdate = new EntryDistributionUpdate(_entryDis.id, _entryDis);
			update.addEventListener(KalturaEvent.COMPLETE, result);
			update.addEventListener(KalturaEvent.FAILED, fault);
			
			_model.context.kc.post(update);
		}
		
		override public function result(data:Object):void {
			_model.decreaseLoadCounter();
			super.result(data);
			var resultEntry:KalturaEntryDistribution = data.data as KalturaEntryDistribution;
			_entryDis =  resultEntry;
			//for data binding
			_model.entryDetailsModel.distributionProfileInfo.entryDistributionArray = _model.entryDetailsModel.distributionProfileInfo.entryDistributionArray.concat();
		}
	}
}