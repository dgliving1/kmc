package com.kaltura.kmc.modules.content.commands {
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.kaltura.commands.baseEntry.BaseEntryGet;
	import com.kaltura.events.KalturaEvent;
	import com.kaltura.kmc.modules.content.events.EntryEvent;
	import com.kaltura.vo.KalturaBaseEntry;
	
	import modules.Content;
	
	import mx.rpc.IResponder;

	public class GetSingleEntryCommand extends KalturaCommand implements ICommand, IResponder {

		override public function execute(event:CairngormEvent):void {
			_model.increaseLoadCounter();
			var e:EntryEvent = event as EntryEvent;
			var getEntry:BaseEntryGet = new BaseEntryGet(e.entryId);

			getEntry.addEventListener(KalturaEvent.COMPLETE, result);
			getEntry.addEventListener(KalturaEvent.FAILED, fault);

			_model.context.kc.post(getEntry);
		}


		override public function result(data:Object):void {
			super.result(data);
			if (data.data && data.data is KalturaBaseEntry) {
				(_model.app as Content).requestEntryDrilldown(data.data);
			}
			else {
				trace("Error getting entry");
			}
			_model.decreaseLoadCounter();
		}
	}
}