package com.kaltura.vo
{
	import com.kaltura.vo.KalturaAssetParamsFilter;

	[Bindable]
	public dynamic class KalturaAssetParamsOutputBaseFilter extends KalturaAssetParamsFilter
	{
		/** 
		* 		* */ 
		public var assetParamsIdEqual : int = int.MIN_VALUE;

		/** 
		* 		* */ 
		public var assetParamsVersionEqual : String = null;

		/** 
		* 		* */ 
		public var assetIdEqual : String = null;

		/** 
		* 		* */ 
		public var assetVersionEqual : String = null;

		/** 
		* 		* */ 
		public var formatEqual : String = null;

		override public function getUpdateableParamKeys():Array
		{
			var arr : Array;
			arr = super.getUpdateableParamKeys();
			arr.push('assetParamsIdEqual');
			arr.push('assetParamsVersionEqual');
			arr.push('assetIdEqual');
			arr.push('assetVersionEqual');
			arr.push('formatEqual');
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
