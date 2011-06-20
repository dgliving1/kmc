package com.kaltura.vo
{
	import com.kaltura.vo.KalturaLiveStreamEntry;

	[Bindable]
	public dynamic class KalturaLiveStreamAdminEntry extends KalturaLiveStreamEntry
	{
		/** 
		* The broadcast primary ip
		* */ 
		public var encodingIP1 : String;

		/** 
		* The broadcast secondary ip
		* */ 
		public var encodingIP2 : String;

		/** 
		* The broadcast password
		* */ 
		public var streamPassword : String;

		/** 
		* The broadcast username
		* */ 
		public var streamUsername : String;

		override public function getUpdateableParamKeys():Array
		{
			var arr : Array;
			arr = super.getUpdateableParamKeys();
			arr.push('encodingIP1');
			arr.push('encodingIP2');
			arr.push('streamPassword');
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
