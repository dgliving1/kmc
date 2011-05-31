package com.kaltura.vo
{
	import com.kaltura.vo.KalturaFilter;

	[Bindable]
	public dynamic class KalturaDwhHourlyPartnerBaseFilter extends KalturaFilter
	{
		/** 
		* 		* */ 
		public var partnerIdEqual : int = int.MIN_VALUE;

		/** 
		* 		* */ 
		public var aggregatedTimeLessThanOrEqual : int = int.MIN_VALUE;

		/** 
		* 		* */ 
		public var aggregatedTimeGreaterThanOrEqual : int = int.MIN_VALUE;

		/** 
		* 		* */ 
		public var sumTimeViewedLessThanOrEqual : Number = NaN;

		/** 
		* 		* */ 
		public var sumTimeViewedGreaterThanOrEqual : Number = NaN;

		/** 
		* 		* */ 
		public var averageTimeViewedLessThanOrEqual : Number = NaN;

		/** 
		* 		* */ 
		public var averageTimeViewedGreaterThanOrEqual : Number = NaN;

		/** 
		* 		* */ 
		public var countPlaysLessThanOrEqual : int = int.MIN_VALUE;

		/** 
		* 		* */ 
		public var countPlaysGreaterThanOrEqual : int = int.MIN_VALUE;

		/** 
		* 		* */ 
		public var countLoadsLessThanOrEqual : int = int.MIN_VALUE;

		/** 
		* 		* */ 
		public var countLoadsGreaterThanOrEqual : int = int.MIN_VALUE;

		/** 
		* 		* */ 
		public var countPlays25LessThanOrEqual : int = int.MIN_VALUE;

		/** 
		* 		* */ 
		public var countPlays25GreaterThanOrEqual : int = int.MIN_VALUE;

		/** 
		* 		* */ 
		public var countPlays50LessThanOrEqual : int = int.MIN_VALUE;

		/** 
		* 		* */ 
		public var countPlays50GreaterThanOrEqual : int = int.MIN_VALUE;

		/** 
		* 		* */ 
		public var countPlays75LessThanOrEqual : int = int.MIN_VALUE;

		/** 
		* 		* */ 
		public var countPlays75GreaterThanOrEqual : int = int.MIN_VALUE;

		/** 
		* 		* */ 
		public var countPlays100LessThanOrEqual : int = int.MIN_VALUE;

		/** 
		* 		* */ 
		public var countPlays100GreaterThanOrEqual : int = int.MIN_VALUE;

		/** 
		* 		* */ 
		public var countEditLessThanOrEqual : int = int.MIN_VALUE;

		/** 
		* 		* */ 
		public var countEditGreaterThanOrEqual : int = int.MIN_VALUE;

		/** 
		* 		* */ 
		public var countSharesLessThanOrEqual : int = int.MIN_VALUE;

		/** 
		* 		* */ 
		public var countSharesGreaterThanOrEqual : int = int.MIN_VALUE;

		/** 
		* 		* */ 
		public var countDownloadLessThanOrEqual : int = int.MIN_VALUE;

		/** 
		* 		* */ 
		public var countDownloadGreaterThanOrEqual : int = int.MIN_VALUE;

		/** 
		* 		* */ 
		public var countReportAbuseLessThanOrEqual : int = int.MIN_VALUE;

		/** 
		* 		* */ 
		public var countReportAbuseGreaterThanOrEqual : int = int.MIN_VALUE;

		/** 
		* 		* */ 
		public var countMediaEntriesLessThanOrEqual : int = int.MIN_VALUE;

		/** 
		* 		* */ 
		public var countMediaEntriesGreaterThanOrEqual : int = int.MIN_VALUE;

		/** 
		* 		* */ 
		public var countVideoEntriesLessThanOrEqual : int = int.MIN_VALUE;

		/** 
		* 		* */ 
		public var countVideoEntriesGreaterThanOrEqual : int = int.MIN_VALUE;

		/** 
		* 		* */ 
		public var countImageEntriesLessThanOrEqual : int = int.MIN_VALUE;

		/** 
		* 		* */ 
		public var countImageEntriesGreaterThanOrEqual : int = int.MIN_VALUE;

		/** 
		* 		* */ 
		public var countAudioEntriesLessThanOrEqual : int = int.MIN_VALUE;

		/** 
		* 		* */ 
		public var countAudioEntriesGreaterThanOrEqual : int = int.MIN_VALUE;

		/** 
		* 		* */ 
		public var countMixEntriesLessThanOrEqual : int = int.MIN_VALUE;

		/** 
		* 		* */ 
		public var countMixEntriesGreaterThanOrEqual : int = int.MIN_VALUE;

		/** 
		* 		* */ 
		public var countPlaylistsLessThanOrEqual : int = int.MIN_VALUE;

		/** 
		* 		* */ 
		public var countPlaylistsGreaterThanOrEqual : int = int.MIN_VALUE;

		/** 
		* 		* */ 
		public var countBandwidthLessThanOrEqual : String;

		/** 
		* 		* */ 
		public var countBandwidthGreaterThanOrEqual : String;

		/** 
		* 		* */ 
		public var countStorageLessThanOrEqual : String;

		/** 
		* 		* */ 
		public var countStorageGreaterThanOrEqual : String;

		/** 
		* 		* */ 
		public var countUsersLessThanOrEqual : int = int.MIN_VALUE;

		/** 
		* 		* */ 
		public var countUsersGreaterThanOrEqual : int = int.MIN_VALUE;

		/** 
		* 		* */ 
		public var countWidgetsLessThanOrEqual : int = int.MIN_VALUE;

		/** 
		* 		* */ 
		public var countWidgetsGreaterThanOrEqual : int = int.MIN_VALUE;

		/** 
		* 		* */ 
		public var aggregatedStorageLessThanOrEqual : String;

		/** 
		* 		* */ 
		public var aggregatedStorageGreaterThanOrEqual : String;

		/** 
		* 		* */ 
		public var aggregatedBandwidthLessThanOrEqual : String;

		/** 
		* 		* */ 
		public var aggregatedBandwidthGreaterThanOrEqual : String;

		/** 
		* 		* */ 
		public var countBufferStartLessThanOrEqual : int = int.MIN_VALUE;

		/** 
		* 		* */ 
		public var countBufferStartGreaterThanOrEqual : int = int.MIN_VALUE;

		/** 
		* 		* */ 
		public var countBufferEndLessThanOrEqual : int = int.MIN_VALUE;

		/** 
		* 		* */ 
		public var countBufferEndGreaterThanOrEqual : int = int.MIN_VALUE;

		/** 
		* 		* */ 
		public var countOpenFullScreenLessThanOrEqual : int = int.MIN_VALUE;

		/** 
		* 		* */ 
		public var countOpenFullScreenGreaterThanOrEqual : int = int.MIN_VALUE;

		/** 
		* 		* */ 
		public var countCloseFullScreenLessThanOrEqual : int = int.MIN_VALUE;

		/** 
		* 		* */ 
		public var countCloseFullScreenGreaterThanOrEqual : int = int.MIN_VALUE;

		/** 
		* 		* */ 
		public var countReplayLessThanOrEqual : int = int.MIN_VALUE;

		/** 
		* 		* */ 
		public var countReplayGreaterThanOrEqual : int = int.MIN_VALUE;

		/** 
		* 		* */ 
		public var countSeekLessThanOrEqual : int = int.MIN_VALUE;

		/** 
		* 		* */ 
		public var countSeekGreaterThanOrEqual : int = int.MIN_VALUE;

		/** 
		* 		* */ 
		public var countOpenUploadLessThanOrEqual : int = int.MIN_VALUE;

		/** 
		* 		* */ 
		public var countOpenUploadGreaterThanOrEqual : int = int.MIN_VALUE;

		/** 
		* 		* */ 
		public var countSavePublishLessThanOrEqual : int = int.MIN_VALUE;

		/** 
		* 		* */ 
		public var countSavePublishGreaterThanOrEqual : int = int.MIN_VALUE;

		/** 
		* 		* */ 
		public var countCloseEditorLessThanOrEqual : int = int.MIN_VALUE;

		/** 
		* 		* */ 
		public var countCloseEditorGreaterThanOrEqual : int = int.MIN_VALUE;

		/** 
		* 		* */ 
		public var countPreBumperPlayedLessThanOrEqual : int = int.MIN_VALUE;

		/** 
		* 		* */ 
		public var countPreBumperPlayedGreaterThanOrEqual : int = int.MIN_VALUE;

		/** 
		* 		* */ 
		public var countPostBumperPlayedLessThanOrEqual : int = int.MIN_VALUE;

		/** 
		* 		* */ 
		public var countPostBumperPlayedGreaterThanOrEqual : int = int.MIN_VALUE;

		/** 
		* 		* */ 
		public var countBumperClickedLessThanOrEqual : int = int.MIN_VALUE;

		/** 
		* 		* */ 
		public var countBumperClickedGreaterThanOrEqual : int = int.MIN_VALUE;

		/** 
		* 		* */ 
		public var countPrerollStartedLessThanOrEqual : int = int.MIN_VALUE;

		/** 
		* 		* */ 
		public var countPrerollStartedGreaterThanOrEqual : int = int.MIN_VALUE;

		/** 
		* 		* */ 
		public var countMidrollStartedLessThanOrEqual : int = int.MIN_VALUE;

		/** 
		* 		* */ 
		public var countMidrollStartedGreaterThanOrEqual : int = int.MIN_VALUE;

		/** 
		* 		* */ 
		public var countPostrollStartedLessThanOrEqual : int = int.MIN_VALUE;

		/** 
		* 		* */ 
		public var countPostrollStartedGreaterThanOrEqual : int = int.MIN_VALUE;

		/** 
		* 		* */ 
		public var countOverlayStartedLessThanOrEqual : int = int.MIN_VALUE;

		/** 
		* 		* */ 
		public var countOverlayStartedGreaterThanOrEqual : int = int.MIN_VALUE;

		/** 
		* 		* */ 
		public var countPrerollClickedLessThanOrEqual : int = int.MIN_VALUE;

		/** 
		* 		* */ 
		public var countPrerollClickedGreaterThanOrEqual : int = int.MIN_VALUE;

		/** 
		* 		* */ 
		public var countMidrollClickedLessThanOrEqual : int = int.MIN_VALUE;

		/** 
		* 		* */ 
		public var countMidrollClickedGreaterThanOrEqual : int = int.MIN_VALUE;

		/** 
		* 		* */ 
		public var countPostrollClickedLessThanOrEqual : int = int.MIN_VALUE;

		/** 
		* 		* */ 
		public var countPostrollClickedGreaterThanOrEqual : int = int.MIN_VALUE;

		/** 
		* 		* */ 
		public var countOverlayClickedLessThanOrEqual : int = int.MIN_VALUE;

		/** 
		* 		* */ 
		public var countOverlayClickedGreaterThanOrEqual : int = int.MIN_VALUE;

		/** 
		* 		* */ 
		public var countPreroll25LessThanOrEqual : int = int.MIN_VALUE;

		/** 
		* 		* */ 
		public var countPreroll25GreaterThanOrEqual : int = int.MIN_VALUE;

		/** 
		* 		* */ 
		public var countPreroll50LessThanOrEqual : int = int.MIN_VALUE;

		/** 
		* 		* */ 
		public var countPreroll50GreaterThanOrEqual : int = int.MIN_VALUE;

		/** 
		* 		* */ 
		public var countPreroll75LessThanOrEqual : int = int.MIN_VALUE;

		/** 
		* 		* */ 
		public var countPreroll75GreaterThanOrEqual : int = int.MIN_VALUE;

		/** 
		* 		* */ 
		public var countMidroll25LessThanOrEqual : int = int.MIN_VALUE;

		/** 
		* 		* */ 
		public var countMidroll25GreaterThanOrEqual : int = int.MIN_VALUE;

		/** 
		* 		* */ 
		public var countMidroll50LessThanOrEqual : int = int.MIN_VALUE;

		/** 
		* 		* */ 
		public var countMidroll50GreaterThanOrEqual : int = int.MIN_VALUE;

		/** 
		* 		* */ 
		public var countMidroll75LessThanOrEqual : int = int.MIN_VALUE;

		/** 
		* 		* */ 
		public var countMidroll75GreaterThanOrEqual : int = int.MIN_VALUE;

		/** 
		* 		* */ 
		public var countPostroll25LessThanOrEqual : int = int.MIN_VALUE;

		/** 
		* 		* */ 
		public var countPostroll25GreaterThanOrEqual : int = int.MIN_VALUE;

		/** 
		* 		* */ 
		public var countPostroll50LessThanOrEqual : int = int.MIN_VALUE;

		/** 
		* 		* */ 
		public var countPostroll50GreaterThanOrEqual : int = int.MIN_VALUE;

		/** 
		* 		* */ 
		public var countPostroll75LessThanOrEqual : int = int.MIN_VALUE;

		/** 
		* 		* */ 
		public var countPostroll75GreaterThanOrEqual : int = int.MIN_VALUE;

		/** 
		* 		* */ 
		public var countLiveStreamingBandwidthLessThanOrEqual : String;

		/** 
		* 		* */ 
		public var countLiveStreamingBandwidthGreaterThanOrEqual : String;

		/** 
		* 		* */ 
		public var aggregatedLiveStreamingBandwidthLessThanOrEqual : String;

		/** 
		* 		* */ 
		public var aggregatedLiveStreamingBandwidthGreaterThanOrEqual : String;

		override public function getUpdateableParamKeys():Array
		{
			var arr : Array;
			arr = super.getUpdateableParamKeys();
			arr.push('partnerIdEqual');
			arr.push('aggregatedTimeLessThanOrEqual');
			arr.push('aggregatedTimeGreaterThanOrEqual');
			arr.push('sumTimeViewedLessThanOrEqual');
			arr.push('sumTimeViewedGreaterThanOrEqual');
			arr.push('averageTimeViewedLessThanOrEqual');
			arr.push('averageTimeViewedGreaterThanOrEqual');
			arr.push('countPlaysLessThanOrEqual');
			arr.push('countPlaysGreaterThanOrEqual');
			arr.push('countLoadsLessThanOrEqual');
			arr.push('countLoadsGreaterThanOrEqual');
			arr.push('countPlays25LessThanOrEqual');
			arr.push('countPlays25GreaterThanOrEqual');
			arr.push('countPlays50LessThanOrEqual');
			arr.push('countPlays50GreaterThanOrEqual');
			arr.push('countPlays75LessThanOrEqual');
			arr.push('countPlays75GreaterThanOrEqual');
			arr.push('countPlays100LessThanOrEqual');
			arr.push('countPlays100GreaterThanOrEqual');
			arr.push('countEditLessThanOrEqual');
			arr.push('countEditGreaterThanOrEqual');
			arr.push('countSharesLessThanOrEqual');
			arr.push('countSharesGreaterThanOrEqual');
			arr.push('countDownloadLessThanOrEqual');
			arr.push('countDownloadGreaterThanOrEqual');
			arr.push('countReportAbuseLessThanOrEqual');
			arr.push('countReportAbuseGreaterThanOrEqual');
			arr.push('countMediaEntriesLessThanOrEqual');
			arr.push('countMediaEntriesGreaterThanOrEqual');
			arr.push('countVideoEntriesLessThanOrEqual');
			arr.push('countVideoEntriesGreaterThanOrEqual');
			arr.push('countImageEntriesLessThanOrEqual');
			arr.push('countImageEntriesGreaterThanOrEqual');
			arr.push('countAudioEntriesLessThanOrEqual');
			arr.push('countAudioEntriesGreaterThanOrEqual');
			arr.push('countMixEntriesLessThanOrEqual');
			arr.push('countMixEntriesGreaterThanOrEqual');
			arr.push('countPlaylistsLessThanOrEqual');
			arr.push('countPlaylistsGreaterThanOrEqual');
			arr.push('countBandwidthLessThanOrEqual');
			arr.push('countBandwidthGreaterThanOrEqual');
			arr.push('countStorageLessThanOrEqual');
			arr.push('countStorageGreaterThanOrEqual');
			arr.push('countUsersLessThanOrEqual');
			arr.push('countUsersGreaterThanOrEqual');
			arr.push('countWidgetsLessThanOrEqual');
			arr.push('countWidgetsGreaterThanOrEqual');
			arr.push('aggregatedStorageLessThanOrEqual');
			arr.push('aggregatedStorageGreaterThanOrEqual');
			arr.push('aggregatedBandwidthLessThanOrEqual');
			arr.push('aggregatedBandwidthGreaterThanOrEqual');
			arr.push('countBufferStartLessThanOrEqual');
			arr.push('countBufferStartGreaterThanOrEqual');
			arr.push('countBufferEndLessThanOrEqual');
			arr.push('countBufferEndGreaterThanOrEqual');
			arr.push('countOpenFullScreenLessThanOrEqual');
			arr.push('countOpenFullScreenGreaterThanOrEqual');
			arr.push('countCloseFullScreenLessThanOrEqual');
			arr.push('countCloseFullScreenGreaterThanOrEqual');
			arr.push('countReplayLessThanOrEqual');
			arr.push('countReplayGreaterThanOrEqual');
			arr.push('countSeekLessThanOrEqual');
			arr.push('countSeekGreaterThanOrEqual');
			arr.push('countOpenUploadLessThanOrEqual');
			arr.push('countOpenUploadGreaterThanOrEqual');
			arr.push('countSavePublishLessThanOrEqual');
			arr.push('countSavePublishGreaterThanOrEqual');
			arr.push('countCloseEditorLessThanOrEqual');
			arr.push('countCloseEditorGreaterThanOrEqual');
			arr.push('countPreBumperPlayedLessThanOrEqual');
			arr.push('countPreBumperPlayedGreaterThanOrEqual');
			arr.push('countPostBumperPlayedLessThanOrEqual');
			arr.push('countPostBumperPlayedGreaterThanOrEqual');
			arr.push('countBumperClickedLessThanOrEqual');
			arr.push('countBumperClickedGreaterThanOrEqual');
			arr.push('countPrerollStartedLessThanOrEqual');
			arr.push('countPrerollStartedGreaterThanOrEqual');
			arr.push('countMidrollStartedLessThanOrEqual');
			arr.push('countMidrollStartedGreaterThanOrEqual');
			arr.push('countPostrollStartedLessThanOrEqual');
			arr.push('countPostrollStartedGreaterThanOrEqual');
			arr.push('countOverlayStartedLessThanOrEqual');
			arr.push('countOverlayStartedGreaterThanOrEqual');
			arr.push('countPrerollClickedLessThanOrEqual');
			arr.push('countPrerollClickedGreaterThanOrEqual');
			arr.push('countMidrollClickedLessThanOrEqual');
			arr.push('countMidrollClickedGreaterThanOrEqual');
			arr.push('countPostrollClickedLessThanOrEqual');
			arr.push('countPostrollClickedGreaterThanOrEqual');
			arr.push('countOverlayClickedLessThanOrEqual');
			arr.push('countOverlayClickedGreaterThanOrEqual');
			arr.push('countPreroll25LessThanOrEqual');
			arr.push('countPreroll25GreaterThanOrEqual');
			arr.push('countPreroll50LessThanOrEqual');
			arr.push('countPreroll50GreaterThanOrEqual');
			arr.push('countPreroll75LessThanOrEqual');
			arr.push('countPreroll75GreaterThanOrEqual');
			arr.push('countMidroll25LessThanOrEqual');
			arr.push('countMidroll25GreaterThanOrEqual');
			arr.push('countMidroll50LessThanOrEqual');
			arr.push('countMidroll50GreaterThanOrEqual');
			arr.push('countMidroll75LessThanOrEqual');
			arr.push('countMidroll75GreaterThanOrEqual');
			arr.push('countPostroll25LessThanOrEqual');
			arr.push('countPostroll25GreaterThanOrEqual');
			arr.push('countPostroll50LessThanOrEqual');
			arr.push('countPostroll50GreaterThanOrEqual');
			arr.push('countPostroll75LessThanOrEqual');
			arr.push('countPostroll75GreaterThanOrEqual');
			arr.push('countLiveStreamingBandwidthLessThanOrEqual');
			arr.push('countLiveStreamingBandwidthGreaterThanOrEqual');
			arr.push('aggregatedLiveStreamingBandwidthLessThanOrEqual');
			arr.push('aggregatedLiveStreamingBandwidthGreaterThanOrEqual');
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
