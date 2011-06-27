package com.kaltura.vo
{
	import com.kaltura.vo.BaseFlexVo;
	[Bindable]
	public dynamic class KalturaAnnotation extends BaseFlexVo
	{
		/** 
		* 		* */ 
		public var id : String;

		/** 
		* 		* */ 
		public var entryId : String;

		/** 
		* 		* */ 
		public var partnerId : int = int.MIN_VALUE;

		/** 
		* 		* */ 
		public var parentId : String;

		/** 
		* 		* */ 
		public var createdAt : int = int.MIN_VALUE;

		/** 
		* 		* */ 
		public var updatedAt : int = int.MIN_VALUE;

		/** 
		* 		* */ 
		public var text : String;

		/** 
		* 		* */ 
		public var tags : String;

		/** 
		* 		* */ 
		public var startTime : int = int.MIN_VALUE;

		/** 
		* 		* */ 
		public var endTime : int = int.MIN_VALUE;

		/** 
		* 		* */ 
		public var userId : String;

		/** 
		* 		* */ 
		public var partnerData : String;

		/** 
		* a list of attributes which may be updated on this object 
		* */ 
		public function getUpdateableParamKeys():Array
		{
			var arr : Array;
			arr = new Array();
			arr.push('entryId');
			arr.push('parentId');
			arr.push('text');
			arr.push('tags');
			arr.push('startTime');
			arr.push('endTime');
			arr.push('partnerData');
			return arr;
		}

		/** 
		* a list of attributes which may only be inserted when initializing this object 
		* */ 
		public function getInsertableParamKeys():Array
		{
			var arr : Array;
			arr = new Array();
			return arr;
		}

	}
}
