package com.kaltura.delegates.entryDistribution
{
	import flash.utils.getDefinitionByName;

	import com.kaltura.config.KalturaConfig;
	import com.kaltura.net.KalturaCall;
	import com.kaltura.delegates.WebDelegateBase;

	public class EntryDistributionSubmitAddDelegate extends WebDelegateBase
	{
		public function EntryDistributionSubmitAddDelegate(call:KalturaCall, config:KalturaConfig)
		{
			super(call, config);
		}

	}
}
