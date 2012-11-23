package org.sse.ui.control
{
	import org.sse.ui.screen.*;
	
	import be.colorfield.ui.screen.IScreen;
	import be.colorfield.ui.screen.ScreenManager;
	import be.colorfield.ui.layout.MainGUI;
	
	import flash.events.MouseEvent;

	public class SubMenuGoogleMaps extends MainSubMenu
	{
		public function SubMenuGoogleMaps()
		{
		}
		
		override internal function clickActions(e:MouseEvent):void{
			
			var curScreen:IScreen;
			
			switch(e.target){
				case mainSubMenuBtn1_mc:
					//trace("=================> Hubble");
					curScreen = new Screen04Hubble();
					break;
				case mainSubMenuBtn2_mc:
					//trace("=================> Mars");
					curScreen = new Screen04Mars();
					break;
				case mainSubMenuBtn3_mc:
					//trace("=================> Moon");
					curScreen = new Screen04Moon();
					break;
				case mainSubMenuBtn4_mc:
					//trace("=================> Earth");
					curScreen = new Screen04Earth();
					break;
			}
			
			
			MainGUI.getInstance().removeFullBackgroundSlide();
			ScreenManager.getInstance().displayScreen(curScreen);
			
			curScreen.postDisplayOperations();
		
		}
	}
}