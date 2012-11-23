package be.colorfield.utils {
	import flash.display.Stage;
	import flash.events.MouseEvent;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;

	public class UserInputHandler 
	{	
		public static var keyRight:Boolean;
		public static var keyLeft:Boolean;
		public static var keyForward:Boolean;
		public static var keyBackward:Boolean;
		public static var mouseDown:Boolean;
		public static var camMode:String;
		public static var randomCamActive:Boolean;
		
		public function UserInputHandler(stage:Stage)
		{
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDownHandler);
			stage.addEventListener(KeyboardEvent.KEY_UP, keyUpHandler);
			stage.addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
			stage.addEventListener(MouseEvent.MOUSE_UP, mouseUpHandler);
		}
		
		private function keyDownHandler(e:KeyboardEvent):void
		{	
			switch(e.keyCode)
			{
				// si deux joueurs veulent partager le même clavier
				// (pour les touches fléchées)
				case "Z".charCodeAt():
				case Keyboard.UP:
					UserInputHandler.keyForward = true;
					UserInputHandler.keyBackward = false;
					break;
 
				case "X".charCodeAt():
				case Keyboard.DOWN:
					UserInputHandler.keyBackward = true;
					UserInputHandler.keyForward = false;
					break;
 
				case "Q".charCodeAt():
				case Keyboard.LEFT:
					UserInputHandler.keyLeft = true;
					UserInputHandler.keyRight = false;
					break;
 
				case "D".charCodeAt():
				case Keyboard.RIGHT:
					UserInputHandler.keyRight = true;
					UserInputHandler.keyLeft = false;
					break;
				
				// caméras
				case "1".charCodeAt():
					UserInputHandler.camMode = "thirdPerson";
					break;
				case "2".charCodeAt():
					UserInputHandler.camMode = "firstPerson";
					break;
				case "3".charCodeAt():
					UserInputHandler.camMode = "randomCam";
					break;
				case "4".charCodeAt():
					UserInputHandler.camMode = "defaultCam";
					break;
			}
		}
 
		private function keyUpHandler(e:KeyboardEvent):void
		{
			switch(e.keyCode)
			{
				case "Z".charCodeAt():
				case Keyboard.UP:
					keyForward = false;
					break;
 
				case "X".charCodeAt():
				case Keyboard.DOWN:
					keyBackward = false;
					break;
 
				case "Q".charCodeAt():
				case Keyboard.LEFT:
					keyLeft = false;
					break;
 
				case "D".charCodeAt():
				case Keyboard.RIGHT:
 					keyRight = false;
					break;
					
				case "3".charCodeAt():
					randomCamActive = true;
					break; 
			}
		}
		
		private function mouseDownHandler (e:MouseEvent):void
		{
			mouseDown = true;
		}
		
		private function mouseUpHandler (e:MouseEvent):void
		{
			mouseDown = false;
		}
		
	}
}