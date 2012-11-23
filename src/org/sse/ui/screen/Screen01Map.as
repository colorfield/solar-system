package org.sse.ui.screen
{
	
	import be.colorfield.ui.screen.IScreen;
	import be.colorfield.ui.screen.ScreenAbstract;
	
	/**
	 * ECRAN Plan du site (TODO)
	 */
	public class Screen01Map extends ScreenAbstract implements IScreen
	{
		
		
		public function Screen01Map()
		{
			trace("map");
		}
		
		/**
		 * Création des éléments et de leurs options d'affichage
		 */
		override public function buildElements():void
		{
			
		}
		
		override public function postDisplayOperations():void
		{
		
		}
		
	}
}