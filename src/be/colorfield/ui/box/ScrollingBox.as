package be.colorfield.ui.box
{
	
	// TODO : sortir ces paramètres
	import org.sse.constant.PrivateParams;
	
	import com.warmforestflash.ui.ScrollBar;
	import caurina.transitions.Tweener;
	import org.libspark.ui.SWFWheel;
	
	import flash.display.*;
	import flash.events.*;
	import flash.text.*;
	
	
	public class ScrollingBox extends MovieClip
	{
		private var scrollBarHighlight:int;
		private var SCROLLBOX_WIDTH:int = 600;
		private var SCROLLBOX_HEIGHT:int = 230;
		
		private var xIni:int = 0;
		private var yIni:int = 0;
		private var opened:Boolean = true;
		
		
		public function ScrollingBox(scrollBarHighlight:int = 0xcccccc)
		{
			// couleur personnalisée de highlight pour la scrollbar
			this.scrollBarHighlight = scrollBarHighlight;
			
			this.xIni = this.x;
			this.yIni = this.y;
			this.closeBtn_mc.buttonMode = true;
			this.closeBtn_mc.useHandCursor = true;
			this.closeBtn_mc.addEventListener(MouseEvent.CLICK, toggleBox);
		}
		
		private function openBox():void{
			Tweener.addTween(this, {x:xIni - SCROLLBOX_WIDTH + 30, time:1, transition:"linear"});
			// normalement l'inverse, mais Flash inverse en ne prenant 
			// pas immédiatement l'événement en compte => hack
			this.closeBtn_mc.gotoAndStop("closedState");
		}
		
		private function closeBox():void{
			Tweener.addTween(this, {x:xIni, time:1, transition:"linear"});
			this.closeBtn_mc.gotoAndStop("openedState");
		}
		
		
		private function toggleBox(e:MouseEvent):void{
			
			if(opened){
				closeBox();
				opened = false;
			}else{
				openBox();
				opened = true;
			}
		}
		
		public function setTitle(title:String){
			this.title_txt.text = title;
		}
		
		public function setContent(content:MovieClip):void{
			
			// on place le contenu dans le conteneur
			this.container_mc.addChild(content);
			
			// roulette de la souris
			// SWFWheel.initialize(contents[contentId]);
			
			// on instancie la scrollbar
			var scrollBar:ScrollBar = new ScrollBar(content, 
				PrivateParams.COLOR_DARK_BLUE, 
				PrivateParams.COLOR_MEDIUM_BLUE,
				PrivateParams.COLOR_TITLE, 
				0xffffff, 15, 15, 4, true,
				SCROLLBOX_WIDTH, // les dimensions du conteneur
				SCROLLBOX_HEIGHT);// ne sont pas connues autrement ...
			
			// on lie la scrollbar au conteneur
			this.container_mc.addChild(scrollBar);
			
			scrollBar.x += 20;
			
		}
	}
}