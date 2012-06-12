package com.kaltura.kmc.modules.analytics.commands
{
	import com.adobe.cairngorm.commands.ICommand;
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.kaltura.kmc.modules.analytics.control.ReportDataEvent;
	import com.kaltura.kmc.modules.analytics.model.AnalyticsModelLocator;
	import com.kaltura.kmc.modules.analytics.model.reportdata.ReportData;
	
	import mx.resources.ResourceManager;
	import mx.rpc.IResponder;
	
	public class SetReportDataCommand implements ICommand, IResponder
	{
		private var _model : AnalyticsModelLocator = AnalyticsModelLocator.getInstance();
		
		
		public function execute(event:CairngormEvent):void
		{
			var rdEvt:ReportDataEvent = event as ReportDataEvent;
			
			if (_model.reportDataMap[rdEvt.screenType] == null){
				_model.reportDataMap[rdEvt.screenType] = new ReportData();
			}
			
			var reportData:ReportData = _model.reportDataMap[rdEvt.screenType] as ReportData;
			// set all the reportData parameters form the current report view:
			reportData.title = rdEvt.label;
			reportData.type = rdEvt.reportType;
			reportData.totalHeaders = rdEvt.totalHeaders;
			reportData.tableHeaders = rdEvt.tableHeaders;
			
			if (_model.filter && _model.filter.keywords) {
				if (_model.filter.searchInTags && _model.filter.searchInAdminTags)
					reportData.filterMessage = ResourceManager.getInstance().getString('analytics', 'filterAllMessage', [_model.filter.keywords]);
				else if (_model.filter.searchInTags)
					reportData.filterMessage = ResourceManager.getInstance().getString('analytics', 'filterTagsOnlyMessage', [_model.filter.keywords]);
				else if (_model.filter.searchInAdminTags)
					reportData.filterMessage = ResourceManager.getInstance().getString('analytics', 'filterAdminOnlyMessage', [_model.filter.keywords]);
			}
			else {
				reportData.filterMessage = '';
			}
		}
		
		public function result(data:Object):void
		{
		}
		
		public function fault(info:Object):void
		{
		}
	}
}