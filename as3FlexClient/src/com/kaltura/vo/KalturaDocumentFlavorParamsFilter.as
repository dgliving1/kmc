package com.kaltura.vo
{
	import com.kaltura.vo.KalturaDocumentFlavorParamsBaseFilter;

	[Bindable]
	public dynamic class KalturaDocumentFlavorParamsFilter extends KalturaDocumentFlavorParamsBaseFilter
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
