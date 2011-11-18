package com.kaltura.vo
{
	import com.kaltura.vo.KalturaCuePoint;

	[Bindable]
	public dynamic class KalturaAdCuePoint extends KalturaCuePoint
	{
		/** 
		* 		* */ 
		public var protocolType : String = null;

		/** 
		* 		* */ 
		public var sourceUrl : String = null;

		/** 
		* 		* */ 
		public var adType : String = null;

		/** 
		* 		* */ 
		public var title : String = null;

		/** 
		* 		* */ 
		public var endTime : int = int.MIN_VALUE;

		/** 
		* Duration in milliseconds		* */ 
		public var duration : int = int.MIN_VALUE;

		override public function getUpdateableParamKeys():Array
		{
			var arr : Array;
			arr = super.getUpdateableParamKeys();
			arr.push('sourceUrl');
			arr.push('adType');
			arr.push('title');
			arr.push('endTime');
			return arr;
		}

		override public function getInsertableParamKeys():Array
		{
			var arr : Array;
			arr = super.getInsertableParamKeys();
			arr.push('protocolType');
			return arr;
		}

	}
}
