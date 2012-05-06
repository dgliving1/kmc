package com.kaltura.kmc.modules.content.commands.cat {
	import com.adobe.cairngorm.control.CairngormEvent;
	import com.kaltura.commands.category.CategoryAdd;
	import com.kaltura.events.KalturaEvent;
	import com.kaltura.kmc.modules.content.commands.KalturaCommand;
	import com.kaltura.kmc.modules.content.events.CategoryEvent;
	import com.kaltura.utils.ObjectUtil;
	import com.kaltura.vo.KalturaCategory;

	public class AddCategoryCommand extends KalturaCommand {
		override public function execute(event:CairngormEvent):void {
			_model.increaseLoadCounter();
			var newCategory:KalturaCategory = event.data as KalturaCategory;
			var addCategory:CategoryAdd = new CategoryAdd(newCategory);
			addCategory.addEventListener(KalturaEvent.COMPLETE, result);
			addCategory.addEventListener(KalturaEvent.FAILED, fault);
			_model.context.kc.post(addCategory);
		}


		override public function result(data:Object):void {
			super.result(data);
			if (data.data is KalturaCategory) {
				// addition worked out fine
				_model.categoriesModel.processingNewCategory = false;
				// copy any attributes from the server object to the client object 
				ObjectUtil.copyObject(data.data, _model.categoriesModel.selectedCategories[0]);
				
				if (_model.filterModel.catTreeDataManager) {
					_model.filterModel.catTreeDataManager.resetData();
				}
				
				var getCategoriesList:CategoryEvent = new CategoryEvent(CategoryEvent.LIST_CATEGORIES);
				getCategoriesList.dispatch();
			}
			_model.decreaseLoadCounter();
		}

	}
}
