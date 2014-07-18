package org.ten.vo {
	
	[RemoteClass(alias="org.tenconnect.Student")]
	[Bindable]
	/**
	 * The Student class represents a McGill student.
	 */
	public class Student {
		/**************************************
		 * Instance Variables (Table Fields)
		 **************************************/
		public var studentId:String;
		public var studentFirstName:String;
		public var studentLastName:String;
		public var studentEmail:String;
		public var studentCourses:String;
		
		/**********************************************
		 * Instance Variables (Joined Fields/Tables)
		 **********************************************/
	}
}

