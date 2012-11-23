package org.sse.ui.screen
{
	
	import org.sse.constant.PrivateParams;
	import org.sse.solarsystem.GoogleMap;
	
	
	import be.colorfield.ui.box.ScrollingBox;
	import be.colorfield.ui.screen.IScreen;
	import be.colorfield.ui.screen.ScreenAbstract;
	import be.colorfield.ui.Application;
	
	
	/**
	 * ECRAN représentant la carte Google Map de Mars
	 * avec un menu personnalisé
	 * + un texte
	 */
	public class Screen04Mars extends ScreenAbstract implements IScreen
	{
		public function Screen04Mars()
		{
			
		}
		
		
		/**
		 * Création des éléments et de leurs options d'affichage
		 */
		override public function buildElements():void
		{	
			var map = new GoogleMap(GoogleMap.MAP_MARS);
			var mapOptions:Object = {x:0,y:0, offSetY:60};
			addElement(map,mapOptions);	
			
			var sb:ScrollingBox = new ScrollingBox(PrivateParams.COLOR_TITLE);
			var sbOptions:Object = {x:0,y:0.5};
			
			sb.setTitle("Mars");
			sb.setContent(new ScreenGoogleMapMars());
			
			addElement(sb, sbOptions);
		}
		
		
	}
}




