package be.colorfield.ui.screen
{
	import flash.display.DisplayObject;

	public interface IScreen
	{
		 function buildElements():void;
		 function removeElements():void;
		 function hasElements():Boolean;
		 function addElement(dObj:DisplayObject,options:Object):void;
		 function displayElements():void;
		 function postDisplayOperations():void;
	}
}