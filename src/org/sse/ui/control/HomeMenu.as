package org.sse.ui.control
{
	
	import org.sse.constant.PrivateParams;
	
	import be.colorfield.ui.screen.IScreen;
	import be.colorfield.ui.screen.ScreenManager;
	
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	
	import org.sse.constant.PrivateParams;
	import org.sse.ui.screen.*;
	
	/**
	 * Menu sur mesure pour le premier écran, 
	 * définit dans l'environnement graphique de Flash
	 * TODO : Actuellement, aucun écran n'est associé aux boutons
	 * vu que les écrans n'ont pas encore été conçus
	 */
	public class HomeMenu extends MovieClip
	{
		public function HomeMenu()
		{
			this.addEventListener(MouseEvent.CLICK,loadScreen);
		}
		
		private function loadScreen(e:MouseEvent):void{
			
			var curBtn:SimpleButton = e.target as SimpleButton;
			var curScreen:IScreen;
			
			trace (curBtn.name);
			
			/*
			switch(curBtn.name){
				case "btnHome01_btn":
					curScreen = new Screen01News();
					break;
				case "btnHome02_btn":
					curScreen = new Screen01Map();
					break;
				case "btnHome03_btn":
					curScreen = new Screen01Gallery();
					break;
				case "btnHome04_btn":
					curScreen = new Screen01Infosphere();
					break;
				
			}
			
			ScreenManager.getInstance().displayScreen(curScreen);
			
			
			/// -------------------- définir ici les opérations post affichage
			
			curScreen.postDisplayOperations();
			*/
		}
		
		
		
		
	}
}