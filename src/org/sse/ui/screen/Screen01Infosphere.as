package org.sse.ui.screen
{
	
	import be.colorfield.ui.screen.IScreen;
	import be.colorfield.ui.screen.ScreenAbstract;
	
	/**
	 * ECRAN faisant appel à l'API Delicious (TODO)
	 */
	public class Screen01Infosphere extends ScreenAbstract implements IScreen
	{
		
		public function Screen01Infosphere()
		{
			trace("infosphere");
		}
		
		/**
		 * Création des éléments et de leurs options d'affichage
		 */
		override public function buildElements():void
		{
			
		}
		
		override public function postDisplayOperations():void{
			
		}
		
	}
}