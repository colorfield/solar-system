package org.sse.ui.screen
{
	
	import org.sse.constant.PrivateParams;
	import org.sse.solarsystem.GoogleMap;
	
	import be.colorfield.ui.box.ScrollingBox;
	import be.colorfield.ui.screen.IScreen;
	import be.colorfield.ui.screen.ScreenAbstract;
	import be.colorfield.ui.Application;
	
	/**
	 * ECRAN représentant la carte Google Map de la Terre
	 * avec un menu personnalisé
	 * + un texte
 	 */
	public class Screen04Earth extends ScreenAbstract implements IScreen
	{
		public function Screen04Earth()
		{
			
		}
		
		
		/**
		 * Création des éléments et de leurs options d'affichage
		 */
		override public function buildElements():void
		{	
			// ajout de la carte
			var map = new GoogleMap(GoogleMap.MAP_EARTH);
			var mapOptions:Object = {x:0,y:0, offSetY:60};
			addElement(map,mapOptions);	
			
			// ajout de la scrolling box
			var sb:ScrollingBox = new ScrollingBox(PrivateParams.COLOR_TITLE);
			var sbOptions:Object = {x:0,y:0.5};
			
			sb.setTitle("La Terre");
			sb.setContent(new ScreenGoogleMapEarth());
			addElement(sb, sbOptions);
		}
		
		
	}
}




