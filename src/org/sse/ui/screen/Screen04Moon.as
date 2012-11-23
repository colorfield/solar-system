package org.sse.ui.screen
{
	
	import org.sse.constant.PrivateParams;
	import org.sse.solarsystem.GoogleMap;
	
	import be.colorfield.ui.box.ScrollingBox;
	import be.colorfield.ui.screen.IScreen;
	import be.colorfield.ui.screen.ScreenAbstract;
	import be.colorfield.ui.Application;
	
	/**
	 * ECRAN représentant la carte Google Map de la Lune
	 * avec un menu personnalisé
	 * + un texte
	 */
	public class Screen04Moon extends ScreenAbstract implements IScreen
	{
		public function Screen04Moon()
		{
			
		}
		
		
		/**
		 * Création des éléments et de leurs options d'affichage
		 */
		override public function buildElements():void
		{	
			var map = new GoogleMap(GoogleMap.MAP_MOON);
			var mapOptions:Object = {x:0,y:0, offSetY:60};
			addElement(map,mapOptions);	

			var sb:ScrollingBox = new ScrollingBox(PrivateParams.COLOR_TITLE);
			var sbOptions:Object = {x:0,y:0.5};
			
			sb.setTitle("La Lune");
			sb.setContent(new ScreenGoogleMapMoon());
			
			addElement(sb, sbOptions);
		}
		
		
	}
}




