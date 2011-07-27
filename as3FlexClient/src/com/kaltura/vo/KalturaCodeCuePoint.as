package com.kaltura.vo
{
	import com.kaltura.vo.KalturaCuePoint;

	[Bindable]
	public dynamic class KalturaCodeCuePoint extends KalturaCuePoint
	{
		/** 
		* 		* */ 
		public var code : String;

		/** 
		* 		* */ 
		public var description : String;

		override public function getUpdateableParamKeys():Array
		{
			var arr : Array;
			arr = super.getUpdateableParamKeys();
			arr.push('code');
			arr.push('description');
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
