// ===================================================================================================
//                           _  __     _ _
//                          | |/ /__ _| | |_ _  _ _ _ __ _
//                          | ' </ _` | |  _| || | '_/ _` |
//                          |_|\_\__,_|_|\__|\_,_|_| \__,_|
//
// This file is part of the Kaltura Collaborative Media Suite which allows users
// to do with audio, video, and animation what Wiki platfroms allow them to do with
// text.
//
// Copyright (C) 2006-2011  Kaltura Inc.
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Affero General Public License as
// published by the Free Software Foundation, either version 3 of the
// License, or (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Affero General Public License for more details.
//
// You should have received a copy of the GNU Affero General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.
//
// @ignore
// ===================================================================================================
package com.kaltura.commands.metadata
{
	import com.kaltura.delegates.metadata.MetadataAddFromUrlDelegate;
	import com.kaltura.net.KalturaCall;

	/**
	 * Allows you to add a metadata xml data from remote URL
	 * 
	 **/
	public class MetadataAddFromUrl extends KalturaCall
	{
		public var filterFields : String;
		
		/**
		 * @param metadataProfileId int
		 * @param objectType String
		 * @param objectId String
		 * @param url String
		 **/
		public function MetadataAddFromUrl( metadataProfileId : int,objectType : String,objectId : String,url : String )
		{
			service= 'metadata_metadata';
			action= 'addFromUrl';

			var keyArr : Array = new Array();
			var valueArr : Array = new Array();
			var keyValArr : Array = new Array();
			keyArr.push('metadataProfileId');
			valueArr.push(metadataProfileId);
			keyArr.push('objectType');
			valueArr.push(objectType);
			keyArr.push('objectId');
			valueArr.push(objectId);
			keyArr.push('url');
			valueArr.push(url);
			applySchema(keyArr, valueArr);
		}

		override public function execute() : void
		{
			setRequestArgument('filterFields', filterFields);
			delegate = new MetadataAddFromUrlDelegate( this , config );
		}
	}
}
