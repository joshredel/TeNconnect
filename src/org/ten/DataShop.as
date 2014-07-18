package org.ten {
	import mx.binding.utils.ChangeWatcher;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.remoting.RemoteObject;
	
	import org.ten.vo.*;
	
	[Bindable]
	/**
	 * DataShop provides singleton access to all data
	 * and services used throughout the system.
	 */
	public final class DataShop {
		/**************************
		 * Singleton enforcement
		 **************************/
		/**
		 * The reference to the single instance of this class.
		 */
		private static const _instance:DataShop = new DataShop(SingletonEnforcer);
		
		/**
		 * The single instance of this class.
		 * 
		 * @internal
		 * Returns the instance if it has been created, otherwise 
		 * it creates the instance.
		 */
		public static function get instance():DataShop {
			// return the single instance
			return _instance;
		}
		
		/**
		 * Constructor.
		 * Loads all of the classes so they are typeable via AMF.
		 * Prepares all of the services.
		 */
		public function DataShop(access:Class) {
			// require the passing of a SingletonEnforcer
			// because no outside class can use it, so only here 
			// can an instance be created and we can manage it
			if(access != SingletonEnforcer) {
				throw new Error("Singleton enforcement failed.  Use DataShop.instance");
			}
			
			// fake create one of each of the VO classes
			// if we don't do this, the service will not translate the AMF
			// result into a type object (it will be a generic object)
			// TODO: fix this... we shoulnd't have to declare the type...
			var loader:* = new McConnelEngineeringBuilding();
			loader = new Course();
			loader = new Exam();
			loader = new Room();
			loader = new Slide();
			loader = new Student();
			
			// set up all the services
			buildingService = setUpService("BuildingService");
			courseService = setUpService("CourseService");
			examService = setUpService("ExamService");
			roomService = setUpService("RoomService");
			slideService = setUpService("SlideService");
			studentService = setUpService("StudentService");
			emailService = setUpService("EmailService");
			eventService = setUpService("EventService");
			directoryService = setUpService("DirectoryService");
			logService = setUpService("LogService");
		}
		
		/**
		 * Logs the current user out.
		 */
		public function logout():void {
			// log the action
			if(loggedInStudent) {
				logService.log("logged out", loggedInStudent.studentId);
			}
			// empty the current user
			loggedInStudent = null;
		}
		
		/*********************
		 * Services offered
		 *********************/
		public var buildingService:RemoteObject;
		public var courseService:RemoteObject;
		public var examService:RemoteObject;
		public var roomService:RemoteObject;
		public var slideService:RemoteObject;
		public var studentService:RemoteObject;
		public var emailService:RemoteObject;
		public var eventService:RemoteObject;
		public var directoryService:RemoteObject;
		public var logService:RemoteObject;
		
		/***************
		 * Properties
		 ***************/
		/**
		 * The user currently logged in.
		 */
		public var loggedInStudent:Student;
		
		/*********************
		 * Helper functions
		 *********************/
		/**
		 * Instantiates a service and sets the parameters as necessary.
		 */
		private function setUpService(source:String):RemoteObject {
			// instantiate the service and point it to the proper source
			var service:RemoteObject = new RemoteObject("amfphp");
			service.source = source;
			service.showBusyCursor = true;
			service.addEventListener(FaultEvent.FAULT, handleServiceFault);
			
			return service;
		}
		
		/**
		 * Prints a fault error to the debug terminal.
		 */
		private function handleServiceFault(event:FaultEvent):void {
			trace("-----\n" + event.toString() + "\n-----");
		}
		
		/**
		 * Prints a log message with time information.
		 */
		public function log(message:String):void {
			var now:Date = new Date();
			trace(now.getHours() + ":" + now.getMinutes() + "." + now.getSeconds() + "." + now.getMilliseconds() + ": " + message);
		}
	}
}

// by using a class here, no outide class can create
// a new DataShop because it is required in the constructor
class SingletonEnforcer {}