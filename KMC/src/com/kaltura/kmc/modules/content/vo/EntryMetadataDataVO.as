package com.kaltura.kmc.modules.content.vo
{
	import com.kaltura.kmc.modules.content.model.MetadataDataObject;
	import com.kaltura.vo.KalturaMetadata;

	[Bindable]
	/**
	 * This value object holds any information relevant to metadata data 
	 * @author Michal
	 * 
	 */	
	public class EntryMetadataDataVO
	{
		/**
		 * dynamic object, represents metadata values
		 * */
		public var metadataDataObject:MetadataDataObject = new MetadataDataObject();
		
		public var finalViewMxml:XML;
		
		public var metadata:KalturaMetadata;
		
		public function EntryMetadataDataVO()
		{
		}
	}
}