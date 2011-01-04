package com.kaltura.commands.virusScanBatch
{
	import com.kaltura.vo.KalturaExclusiveLockKey;
	import com.kaltura.delegates.virusScanBatch.VirusScanBatchFreeExclusiveStorageDeleteJobDelegate;
	import com.kaltura.net.KalturaCall;

	public class VirusScanBatchFreeExclusiveStorageDeleteJob extends KalturaCall
	{
		public var filterFields : String;
		public function VirusScanBatchFreeExclusiveStorageDeleteJob( id : int,lockKey : KalturaExclusiveLockKey,resetExecutionAttempts : Boolean=false )
		{
			service= 'virusscan_virusscanbatch';
			action= 'freeExclusiveStorageDeleteJob';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push( 'id' );
			valueArr.push( id );
 			keyValArr = kalturaObject2Arrays(lockKey,'lockKey');
			keyArr = keyArr.concat( keyValArr[0] );
			valueArr = valueArr.concat( keyValArr[1] );
			keyArr.push( 'resetExecutionAttempts' );
			valueArr.push( resetExecutionAttempts );
			applySchema( keyArr , valueArr );
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields',filterFields);
			delegate = new VirusScanBatchFreeExclusiveStorageDeleteJobDelegate( this , config );
		}
	}
}
