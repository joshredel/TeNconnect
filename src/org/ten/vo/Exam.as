package org.ten.vo {
	import org.ten.AMFService;
	
	[RemoteClass(alias="org.tenconnect.Exam")]
	[Bindable]
	/**
	 * The Exam class represents an exam as submitted by the head invigilator.
	 */
	public class Exam {
		/**************************************
		 * Instance Variables (Table Fields)
		 **************************************/
		public var department:String;
		public var courseNumber:int;
		public var courseName:String;
		public var examTime:String;
		public var studentNames:String;
		public var examRoom:String;
		
		private var _examDate:Date;
		
		/**
		 * Simply returns the date.
		 */
		public function get examDate():Date {
			return _examDate;
		}
		
		/**
		 * Converts the date from a string if it is coming from 
		 * the database via AMF remoting.
		 */
		public function set examDate(newDate:*):void {
			_examDate = AMFService.convertDateTimeToDate(newDate);
		}
		
		/**********************************************
		 * Instance Variables (Joined Fields/Tables)
		 **********************************************/
	}
}

