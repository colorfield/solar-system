package be.colorfield.ui.box
{
	import flash.display.Sprite;
	import flash.filters.DropShadowFilter;
	import flash.text.TextField;

	public class ScrollablePanelView extends Sprite
	{
		private var bg:Sprite;
		private var title_txt:TextField;
		
		
		public function ScrollablePanelView()
		{
			// création du fond du panneau
			bg = new Sprite();
			bg.graphics.lineStyle();
			bg.graphics.beginFill(0x000000,.5);
			bg.graphics.drawRoundRect(
					0,20,
					ScrollingPanels.PANEL_WIDTH,
					ScrollingPanels.PANEL_HEIGHT - 20, // un peu de place pour le texte
					20,20);
			bg.graphics.endFill();
			bg.filters = [new DropShadowFilter()];
			
			addChild(bg);	
		}
		
		/**
		 * Affichage du titre
		 */
		public function setTitle(title:String):void{
			
			// définir un formatage...
			title_txt = new TextField();
			
			this.title_txt.text = title;
			addChild(title_txt);
		}
		
		/**
		 * Affichage du contenu
		 */
		public function setContent(content:Sprite = null):void{
			
			if(content != null){
				// définition d'une marge, p.ex.
				content.x = 10;
				content.y = 10;
				addChild(content);
			}
		
		}
	}
}