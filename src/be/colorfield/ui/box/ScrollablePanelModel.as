package be.colorfield.ui.box
{
	import flash.display.Sprite;

	/**
	 * ValueObject représentant le model d'un panel
	 */
	public class ScrollablePanelModel
	{
		
		// ValueObject
		private var title:String;
		private var content:Sprite;
		
		public function ScrollablePanelModel()
		{
		}
		
		public function setTitle(title:String):void{
			this.title = title;
		}
		
		public function setContent(content:Sprite):void{
			this.content = content;
		}
		
		public function getTitle():String{
			return title;
		}
		
		public function getContent():Sprite{
			return content;
		}
	}
}