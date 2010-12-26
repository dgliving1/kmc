package com.kaltura.kmc.modules.content.view.itemrenderers {
	import com.kaltura.kmc.modules.content.view.CategoriesTree;
	import com.kaltura.kmc.modules.content.view.window.AddNewCategoryWin;
	import com.kaltura.kmc.modules.content.view.window.DeleteCategoryWin;
	import com.kaltura.kmc.modules.content.vo.CategoryVO;

	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.events.MouseEvent;

	import mx.containers.HBox;
	import mx.controls.LinkButton;
	import mx.controls.treeClasses.TreeItemRenderer;
	import mx.events.ResizeEvent;
	import mx.managers.PopUpManager;

	public class CategoriesTreeItemRenderer extends TreeItemRenderer {
		protected var _tree:CategoriesTree;
		protected var hBox:HBox;
		protected var addBtn:LinkButton;
		protected var deleteBtn:LinkButton;



		public function CategoriesTreeItemRenderer() {
			super();
		}


		override protected function createChildren():void {
			super.createChildren();

			//Setting this keeps the label field from jumping around on resizes
			setStyle("verticalAlign", "top");
			setStyle("percentWidth", "100");

			hBox = new HBox();
			hBox.styleName = 'treeItemButtonsHBox';
			addBtn = new LinkButton();
			addBtn.styleName = 'addLinkButton';
			addBtn.addEventListener(MouseEvent.CLICK, onAddCategoryEvent);

			deleteBtn = new LinkButton();
			deleteBtn.addEventListener(MouseEvent.CLICK, onDeleteCategoryEvent);
			hBox.addChild(addBtn);
			deleteBtn.styleName = 'deleteLinkButton';
			hBox.addChild(deleteBtn);
			hBox.visible = false;

			addChild(hBox);
		}


		private function onDeleteCategoryEvent(event:Event):void {
			var dataVo:CategoryVO = data as CategoryVO;
			var deleteCategoryPopUp:DeleteCategoryWin = new DeleteCategoryWin();
			deleteCategoryPopUp.selectedCategory = dataVo;
			PopUpManager.addPopUp(deleteCategoryPopUp, this as DisplayObject, true);
			PopUpManager.centerPopUp(deleteCategoryPopUp);
		}


		private function onAddCategoryEvent(event:Event):void {
			var dataVo:CategoryVO = data as CategoryVO;
			var addCategoryPopUp:AddNewCategoryWin = new AddNewCategoryWin();
			addCategoryPopUp.parentCategory = dataVo;
			PopUpManager.addPopUp(addCategoryPopUp, this as DisplayObject, true);
			PopUpManager.centerPopUp(addCategoryPopUp);
		}


		/**
		 * Override the set method for the data property
		 * to set the font color and style of each node.
		 * */
		override public function set data(value:Object):void {
			var vo:CategoryVO = value as CategoryVO;
			if (value == null)
				return;

			super.data = value;

			if (this.parent == null)
				return;

			if (_tree == null) {
				this.addEventListener(MouseEvent.ROLL_OVER, function(evt:MouseEvent):void {
						if (_tree.isInEditMode) {
							hBox.visible = true;
							deleteBtn.visible = (data as CategoryVO).id != 0;
						}
					});

				this.addEventListener(MouseEvent.ROLL_OUT, function(evt:MouseEvent):void {
						hBox.visible = false;
					});


				_tree = CategoriesTree(this.parent.parent);
				_tree.addEventListener(ResizeEvent.RESIZE, function(evt:ResizeEvent):void {
					//We must unset the height and width of the text field or it won't re-measure
					//and won't resize properly
						hBox.explicitWidth = NaN;
						hBox.explicitHeight = NaN;
					});
			}

			invalidateDisplayList();
		}
		

		/**
		 * @inheritDoc 
		 */
		override protected function measure():void {
			super.measure();

			//Setting the width of the description field
			//causes the height calculation to happen
			hBox.width = explicitWidth - super.label.x;

			//We add the measuredHeight to the renderers measured height
			measuredHeight = hBox.measuredHeight;
		}


		/**
		 * Override the updateDisplayList() method
		 * to set the text for each tree node.
		 * */
		override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void {
			super.updateDisplayList(unscaledWidth, unscaledHeight);

			if (super.data && (super.data is CategoryVO)) {
				var vo:CategoryVO = super.data as CategoryVO;
				super.label.htmlText = vo.name + " <font color='#666666' size='11'> (" +
					vo.category.entriesCount + ")</font>";
				super.label.height = 25;
				super.label.toolTip = super.label.text;

				var gWid:int = /* (super.label.textWidth > 170) ? 170 : */ super.label.textWidth;
				hBox.x = super.label.x + gWid + 2;
				hBox.height = 26;
			}
		}
	}
}