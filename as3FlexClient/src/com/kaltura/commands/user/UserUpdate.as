package com.kaltura.commands.user
{
	import com.kaltura.vo.KalturaUser;
	import com.kaltura.delegates.user.UserUpdateDelegate;
	import com.kaltura.net.KalturaCall;

	public class UserUpdate extends KalturaCall
	{
		public var filterFields : String;
		/**
		 * @param userId String
		 * @param user KalturaUser
		 * @param allUserPartners Boolean
		 **/
		public function UserUpdate( userId : String,user : KalturaUser,allUserPartners : Boolean=false )
		{
			service= 'user';
			action= 'update';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push('userId');
			valueArr.push(userId);
 			keyValArr = kalturaObject2Arrays(user, 'user');
			keyArr = keyArr.concat(keyValArr[0]);
			valueArr = valueArr.concat(keyValArr[1]);
			keyArr.push('allUserPartners');
			valueArr.push(allUserPartners);
			applySchema(keyArr, valueArr);
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields', filterFields);
			delegate = new UserUpdateDelegate( this , config );
		}
	}
}
