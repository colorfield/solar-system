package org.sse.ui.screen
{
	import org.sse.ui.control.HomeMenu;
	
	import be.colorfield.ui.layout.MainGUI;
	import be.colorfield.rss.RSSBox;
	import noponies.ui.NpFlexLayout;
	
	import flash.display.Sprite;
	import be.colorfield.ui.screen.IScreen;
	import be.colorfield.ui.screen.ScreenAbstract;
	
	/**
	 * ECRAN de départ :
	 * contient un lecteurRSS, une boîte de texte et un sous-menu sur mesure
	 */
	// TODO : instancier depuis une String lue d'un XML
	public class Screen01News extends ScreenAbstract implements IScreen
	{
		private static const MAIN_MARGIN:int = 20;
		
		private var rssBox:RSSBox;
		private var textBox:TextBox;
		private var homeMenu:HomeMenu;
		
		public function Screen01News()
		{
			// trace("instancie Screen01News");
			// super(); // délègue une partie au constructeur de la classe abstraite
			// buildElements(); // seule méthode redéfinie => appel dans abstract
			// ajout à la liste d'affichage et au layout principal
			// (appel de la méthode de la classe abstraite)
			// addElements(); => appel dans abstract
		}
		
		/**
		 * Création des éléments et de leurs options d'affichage
		 * le constructeur de la classe abstraite appelle d'abord buildElements 
		 * puis displayElements
		 */
		override public function buildElements():void
		{
			textBox = new TextBox(); // titre + bloc texte courant
			rssBox = new RSSBox(); // lecteur rss
			homeMenu = new HomeMenu(); // menu de la section home
			
			// Screen01News.MAIN_MARGIN - 20 => pour tenir compte d'une éventuelle scrollbar
			var rssOptions:Object = {x:1,y:.5,offSetX:-rssBox.width - Screen01News.MAIN_MARGIN - 20, offSetY:-rssBox.height/2};
			var textOptions:Object = {x:0,y:.6,offSetX:Screen01News.MAIN_MARGIN,offSetY:-textBox.height/2};
			var homeMenuOptions:Object = {x:0,y:0,offSetX:Screen01News.MAIN_MARGIN};
			
			// ajout de l'élément + ses options à l'écran
			addElement(rssBox,rssOptions);
			addElement(textBox,textOptions);
			addElement(homeMenu,homeMenuOptions);
		}
		
		
		override public function postDisplayOperations():void{
		
		}
	}
}