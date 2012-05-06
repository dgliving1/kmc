package com.kaltura.kmc.modules.content.model
{
	import com.kaltura.KalturaClient;
	import com.kaltura.vo.KalturaCategory;
	import com.kaltura.vo.KalturaCategoryFilter;
	import com.kaltura.vo.KalturaFilterPager;
	
	import mx.collections.ArrayCollection;

	[Bindable]
	public class CategoriesModel {
		
		/**
		 * numbers of subcategories that may be reordered 
		 */
		public static const SUB_CATEGORIES_LIMIT:int = 50;
		
		/**
		 * reference to the API client 
		 */
		public var client:KalturaClient;
		
		/**
		 * categories selected in the table (categories screen)
		 */		
		public var selectedCategories:Array;
		
		/**
		 * categories returned from latest list action (for categories screen)
		 */		
		public var categoriesList:ArrayCollection;
		
		/**
		 * the totalCount of the latest list action (categories screen)
		 */		
		public var totalCategories:int;
		
		/**
		 * the filter used for the latest list action (categories screen)
		 */		
		public var filter:KalturaCategoryFilter;
		
		/**
		 * the pager used for the latest list action (categories screen)
		 */
		public var pager:KalturaFilterPager;
		
		/**
		 * sub categories of selected category (category drilldown) 
		 */
		public var subCategories:ArrayCollection;
		
		/**
		 * Metadata info array of the selected category (category metadata --> category drilldown)
		 */		
		public var metadataInfo:ArrayCollection;
		
		/**
		 * The parent category of the selected category (category drilldown).
		 */
		public var parentCategory:KalturaCategory;
		
		/**
		 * The category from which the selected category inherits values (category drilldown).
		 */
		public var inheritedParentCategory:KalturaCategory;
		
		/**
		 * users associated with selected category (KalturaCategoryUser objects, end users popup)
		 */
		public var categoryUsers:ArrayCollection;
		
		/**
		 * the totalCount of the latest users list action (end users popup)
		 */
		public var totalCategoryUsers:int;

		/**
		 * selected users in table (KalturaCategoryUser objects, end users popup)
		 */
		public var selectedCategoryUsers:Array;
		
		/**
		 * indicates the first action in the end users permissions popup had occured
		 * (used to show confirmation message) 
		 */		
		public var categoryUserFirstAction:Boolean;
		
		/**
		 * indicates the category currently being edited in 
		 * the category drilldown has not been saved yet.
		 */		
		public var processingNewCategory:Boolean = false;
		
	}
}