package com.kaltura.commands.annotation
{
	import com.kaltura.vo.KalturaCuePoint;
	import com.kaltura.delegates.annotation.AnnotationAddDelegate;
	import com.kaltura.net.KalturaCall;

	public class AnnotationAdd extends KalturaCall
	{
		public var filterFields : String;
		/**
		 * @param cuePoint KalturaCuePoint
		 **/
		public function AnnotationAdd( cuePoint : KalturaCuePoint )
		{
			service= 'annotation_annotation';
			action= 'add';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
 			keyValArr = kalturaObject2Arrays(cuePoint, 'cuePoint');
			keyArr = keyArr.concat(keyValArr[0]);
			valueArr = valueArr.concat(keyValArr[1]);
			applySchema(keyArr, valueArr);
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields', filterFields);
			delegate = new AnnotationAddDelegate( this , config );
		}
	}
}
