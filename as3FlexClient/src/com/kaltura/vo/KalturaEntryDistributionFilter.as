package com.kaltura.vo
{
	import com.kaltura.vo.KalturaEntryDistributionBaseFilter;

	[Bindable]
	public dynamic class KalturaEntryDistributionFilter extends KalturaEntryDistributionBaseFilter
	{
		override public function getUpdateableParamKeys():Array
		{
			var arr : Array;
			arr = super.getUpdateableParamKeys();
			return arr;
		}

		override public function getInsertableParamKeys():Array
		{
			var arr : Array;
			arr = super.getInsertableParamKeys();
			return arr;
		}

	}
}
