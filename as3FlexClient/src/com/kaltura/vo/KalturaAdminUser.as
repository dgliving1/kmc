package com.kaltura.vo
{
	import com.kaltura.vo.KalturaUser;

	[Bindable]
	public dynamic class KalturaAdminUser extends KalturaUser
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
