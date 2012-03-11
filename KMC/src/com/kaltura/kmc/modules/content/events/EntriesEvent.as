package com.kaltura.kmc.modules.content.events {
	import com.adobe.cairngorm.control.CairngormEvent;

	import mx.collections.ArrayCollection;

	/**
	 * this class represents an event concerning a group of entries
	 */
	public class EntriesEvent extends CairngormEvent {
		public static const SET_SELECTED_ENTRIES:String = "content_setSelectedEntries";
		public static const SET_SELECTED_ENTRIES_FOR_PLAYLIST:String = "content_setSelectedEntriesForPlaylist";
		public static const UPDATE_ENTRIES:String = "content_updateEntries";
		public static const UPDATE_PLAYLISTS:String = "content_updatePlaylists";
		public static const DELETE_ENTRIES:String = "content_deleteEntries";

		/**
		 * entries relevant for this event.
		 * each entry is <code>KalturaBaseEntry</code>
		 */
		private var _entries:ArrayCollection;

		/**
		 * whether to close drilldown window after action is complete
		 */
		private var _closeWindow:Boolean;

		/**
		 * whether to display updated entry or next entry
		 */
		private var _displayNextEntry:Boolean;


		/**
		 * Constructor.
		 * @param type		event type
		 * @param entries	entries this event effects
		 * @param closeWindow whether to close drilldown
		 * @param bubbles	should the event bubble
		 * @param cancelable	should the event be cancelable
		 *
		 */
		public function EntriesEvent(type:String, entries:ArrayCollection = null, closeWindow:Boolean = true, 
							displayNextEntry:Boolean = false, bubbles:Boolean = false, cancelable:Boolean = false) {
			super(type, bubbles, cancelable);
			this._entries = entries;
			this._closeWindow = closeWindow;
			this._displayNextEntry = displayNextEntry;
		}


		public function get entries():ArrayCollection {
			return _entries;
		}


		public function get closeWindow():Boolean {
			return _closeWindow;
		}


		public function get displayNextEntry():Boolean {
			return _displayNextEntry;
		}
	}
}