package org.ten.vo {
	import org.ten.AMFService;
	
	[RemoteClass(alias="org.tenconnect.Event")]
	[Bindable]
	/**
	 * The Event class represents an event being hosted by a group.
	 */
	public class TEvent {
		/**************************************
		 * Instance Variables (Table Fields)
		 **************************************/
		public var id:int;
		public var host:String;
		public var title:String;
		public var description:String;
		public var imageUrl:String;
		public var thumbnailUrl:String;
		
		private var _startTime:Date;
		
		/**
		 * Simply returns the date.
		 */
		public function get startTime():Date {
			return _startTime;
		}
		
		/**
		 * Converts the date from a string if it is coming from 
		 * the database via AMF remoting.
		 */
		public function set startTime(newDate:*):void {
			_startTime = AMFService.convertDateTimeToDate(newDate);
		}
		
		private var _endTime:Date;
		
		/**
		 * Simply returns the date.
		 */
		public function get endTime():Date {
			return _endTime;
		}
		
		/**
		 * Converts the date from a string if it is coming from 
		 * the database via AMF remoting.
		 */
		public function set endTime(newDate:*):void {
			_endTime = AMFService.convertDateTimeToDate(newDate);
		}
		
		/**********************************************
		 * Instance Variables (Joined Fields/Tables)
		 **********************************************/
	}
}

