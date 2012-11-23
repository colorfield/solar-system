package org.sse.ui.screen
{
	
	import org.sse.solarsystem.PlanetsPerspective;
	
	import be.colorfield.ui.Application;
	import be.colorfield.ui.screen.IScreen;
	import be.colorfield.ui.screen.ScreenAbstract;
	import be.colorfield.net.LoadExternalAsset;
	
	import flash.display.Sprite;
	
	/**
	 * ECRAN présentant les planètes alignées avec 
	 * la possibilité de modifier les paramètres de la caméra au clic de la souris.
	 */
	public class Screen02PlanetsPerspective extends ScreenAbstract implements IScreen
	{
		
		public function Screen02PlanetsPerspective()
		{
		}
	
		/**
		 * Création des éléments et de leurs options d'affichage
		 */
		override public function buildElements():void
		{	
			// Problème rencontré : impossible de charger mx.core.BitmapAsset
			// piste : RSL (Runtime Shared Librairies)
			// => solution : utilisation d'un fichier swc pour les éléments graphiques
			// créés dans Flash (import dans Flash > Préférences > Flex.swc)
			
			var planets = new PlanetsPerspective();
			// var testOptions:Object = {x:0,y:.5,offSetX:20,offSetY:test.height/2};
			var planetsOptions:Object = {x:0,y:0};
			
			// ajout des éléments + options à l'écran
			addElement(planets,planetsOptions);	
		}
		
	}
}