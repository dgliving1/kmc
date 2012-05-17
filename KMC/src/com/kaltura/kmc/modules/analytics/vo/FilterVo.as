package com.kaltura.kmc.modules.analytics.vo
{
	import mx.resources.ResourceManager;
	
	[Bindable]
	public class FilterVo
	{
		public static const millisecondsPerDay:int = 1000 * 60 * 60 * 24;
		
		public var selectedDate : String = ResourceManager.getInstance().getString('analytics', 'last30Days');
		public var fromDate : Date;
		public var toDate : Date;
		public var categories : String;
		public var keywords : String;
		public var searchInAdminTags : Boolean = false;
		public var searchInTags : Boolean = true;
		public var application : String;
		public var userIds : String;
		
		public function FilterVo()
		{
			var today : Date = new Date();
			var todaysHourInMiliSeconds : Number = (((today.hoursUTC)*60 + today.minutesUTC)*60 + today.secondsUTC)*1000 + today.millisecondsUTC;
			fromDate = new Date( today.time - todaysHourInMiliSeconds - millisecondsPerDay*31);
			toDate = new Date( today.time - todaysHourInMiliSeconds - millisecondsPerDay );
		}
	}
}