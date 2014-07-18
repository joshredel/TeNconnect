package org.ten.vo {
	
	[RemoteClass(alias="org.tenconnect.Course")]
	[Bindable]
	/**
	 * The Course class represents a course from Minerva.
	 */
	public class Course {
		/**************************************
		 * Instance Variables (Table Fields)
		 **************************************/
		public var crn:String;
		public var time:String;
		public var department:String;
		public var courseNumber:int;
		public var courseType:String;
		public var credits:Number;
		public var courseName:String;
		public var hours:int;
		public var days:String;
		public var instructorName:String;
		public var room:String;
		
		/**********************************************
		 * Instance Variables (Joined Fields/Tables)
		 **********************************************/
	}
}

