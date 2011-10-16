package com.kaltura.commands.cuePoint
{
	import com.kaltura.vo.KalturaCuePointFilter;
	import com.kaltura.vo.KalturaFilterPager;
	import com.kaltura.delegates.cuePoint.CuePointListDelegate;
	import com.kaltura.net.KalturaCall;

	public class CuePointList extends KalturaCall
	{
		public var filterFields : String;
		/**
		 * @param filter KalturaCuePointFilter
		 * @param pager KalturaFilterPager
		 **/
		public function CuePointList( filter : KalturaCuePointFilter=null,pager : KalturaFilterPager=null )
		{
			service= 'cuepoint_cuepoint';
			action= 'list';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
 			if (filter) { 
 			keyValArr = kalturaObject2Arrays(filter, 'filter');
			keyArr = keyArr.concat(keyValArr[0]);
			valueArr = valueArr.concat(keyValArr[1]);
 			} 
 			if (pager) { 
 			keyValArr = kalturaObject2Arrays(pager, 'pager');
			keyArr = keyArr.concat(keyValArr[0]);
			valueArr = valueArr.concat(keyValArr[1]);
 			} 
			applySchema(keyArr, valueArr);
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields', filterFields);
			delegate = new CuePointListDelegate( this , config );
		}
	}
}
