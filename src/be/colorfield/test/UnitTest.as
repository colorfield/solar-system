package
{
	import org.sse.solarsystem.PlanetsPerspective;
	
	import be.colorfield.ui.Application;
	import be.colorfield.ui.layout.MainGUI;
	
	import flash.display.*;
	import flash.events.Event;
	import flash.events.FullScreenEvent;
	import flash.events.MouseEvent;
	
	public class UnitTest extends Application
	{
		
		private var mainGUI:MainGUI;
		
		public function UnitTest()
		{
			this.loaderInfo.addEventListener(Event.INIT,loaderInit);
		}
		
		private function loaderInit(event:Event):void
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			stage.frameRate = 31;
			
			// écoute de l'événement d'affichage en plein écran
			stage.addEventListener(Event.FULLSCREEN, fullScreenHandler);
			
			// création de la view principale (= invariants des différents écrans)
			mainGUI = MainGUI.getInstance();
			addChild(mainGUI);
		}
		
	}
}