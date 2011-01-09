package com.kaltura.kmc.modules.content.model
{
	import com.kaltura.kmc.modules.content.vo.CategoryVO;
	import com.kaltura.dataStructures.HashMap;
	import com.kaltura.vo.KMCMetadataProfileVO;
	
	import mx.collections.ArrayCollection;

	[Bindable]
	/**
	 * data that is needed for all filter instances 
	 * @author Atar
	 */	
	public class FilterModel {
		
		
		/**
		 * this partner is allowed to see metadata related stuff.
		 * value is set via roles and permissions
		 * */
		public var enableCustomData:Boolean = true;
		
		/**
		 * the root of a category hierarchy. 
		 * */
		public var categories:CategoryVO = null;
		
		/**
		 * categories listing
		 * */
		public var categoriesMap:HashMap = new HashMap();
		
		/**
		 * list of <code>KalturaFlavorParams</code>
		 * */
		public var flavorParams:ArrayCollection = new ArrayCollection();

		
		public var metadataProfile:KMCMetadataProfileVO;
		
		public var accessControlProfiles:ArrayCollection = new ArrayCollection();
		
		/**
		 * load access control only once 
		 */		
		public var oneTimeLoadAccessControlLoadedFlag:Boolean = false;

	}
}