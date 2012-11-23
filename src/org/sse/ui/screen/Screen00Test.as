package org.sse.ui.screen
{
	
	import be.colorfield.ui.screen.IScreen;
	import be.colorfield.ui.screen.ScreenAbstract;
	
	import org.sse.ui.setup3d.C1_CommonPrimitives;
	
	import org.sse.solarsystem.PlanetsPerspective;
	
	/**
	 * TEST UNITAIRE
	 * Affichage d'un écran, deux méthodes s'y retrouvent :
	 * 1) Instanciation d'une classe 
	 * 2) Chargement d'un fichier swf précompilé 
	 *    => on pourrait charger n'importe quelle application
	 */
	public class Screen00Test extends ScreenAbstract implements IScreen
	{
		
		
		// private var swfContainer:Sprite;
		
		public function Screen00Test()
		{
			super();
		}
		
		/**
		 * Création des éléments et de leurs options d'affichage
		 */
		override public function buildElements():void
		{
			//var test = new EarthDemo();
			//var testOptions:Object = {x:0,y:0,offSetY:test.height/2};
			
			// ajout des éléments + options à l'écran
			//addElement(test,testOptions);
			
			var test = new C1_CommonPrimitives();
			//var testOptions:Object = {x:0.5,y:0.5,offSetY:test.height/2,offSetX:test.width/2};
			var testOptions:Object = {x:0,y:0};
			
			addElement(test,testOptions);
			
			/*
			swfContainer = new Sprite();
			var scOptions:Object = {x:0,y:0};
			addElement(swfContainer,scOptions);
			*/
		}
		
		override public function postDisplayOperations():void{
			// LoadExternalAsset.getInstance().loadMovie("swf/Planets.swf",swfContainer);
		}
		
		
		
		
	}
}