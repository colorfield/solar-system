package org.sse.ui.control
{
	import org.sse.ui.screen.*;
	
	import be.colorfield.ui.screen.IScreen;
	import be.colorfield.ui.screen.ScreenManager;
	import be.colorfield.ui.layout.MainGUI;
	
	import flash.events.MouseEvent;
	
	public class SubMenuSolarSystem extends MainSubMenu
	{
		
		public function SubMenuSolarSystem()
		{
		}
		
		override internal function clickActions(e:MouseEvent):void{
			
			var curScreen:IScreen;
			
			switch(e.target){
				case mainSubMenuBtn1_mc:
					//trace("Planets details");
					curScreen = new Screen02PlanetsDetails();
					break;
				case mainSubMenuBtn2_mc:
					//trace("Planets perspective");
					curScreen = new Screen02PlanetsPerspective();
					break;
			}
			
			
			MainGUI.getInstance().removeFullBackgroundSlide();
			ScreenManager.getInstance().displayScreen(curScreen);
			
			curScreen.postDisplayOperations();
		}
	}
}