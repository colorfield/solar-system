package org.sse.ui.screen
{
	import be.colorfield.ui.screen.IScreen;
	import be.colorfield.ui.screen.ScreenAbstract;
	import be.colorfield.net.LoadExternalAsset;
	
	import flash.display.Sprite;

	/**
	 * ECRAN Galerie photo
	 */
	public class Screen01Gallery extends ScreenAbstract implements IScreen
	{
		
		private var swfContainer:Sprite;
		
		public function Screen01Gallery()
		{
			trace("gallery");
		}
		
		/**
		 * Création des éléments et de leurs options d'affichage
		 */
		override public function buildElements():void
		{	
			swfContainer = new Sprite();
			var mapOptions:Object = {x:0,y:0};
			addElement(swfContainer,mapOptions);	
		}
		
		override public function postDisplayOperations():void{
			LoadExternalAsset.getInstance().loadMovie("swf/TiltViewer.swf",swfContainer);
		}
	}
}