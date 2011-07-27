package com.kaltura.vo
{
	import com.kaltura.vo.KalturaDropFolder;

	[Bindable]
	public dynamic class KalturaFtpDropFolder extends KalturaDropFolder
	{
		/** 
		* 		* */ 
		public var host : String;

		/** 
		* 		* */ 
		public var port : int = int.MIN_VALUE;

		/** 
		* 		* */ 
		public var username : String;

		/** 
		* 		* */ 
		public var password : String;

		override public function getUpdateableParamKeys():Array
		{
			var arr : Array;
			arr = super.getUpdateableParamKeys();
			arr.push('host');
			arr.push('port');
			arr.push('username');
			arr.push('password');
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
