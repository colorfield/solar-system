package be.colorfield.ui.box
{
	import com.warmforestflash.ui.ScrollBar;
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.geom.ColorTransform;
	import flash.geom.Transform;
	
	/**
	 * Paneau à onglets munis d'une scrollbar s'activant automatiquement si nécessaire.
	 * Le nombre de panneaux n'est pas encore géré dynamiquement vu qu'il s'agit pour
	 * l'instant d'unc clip dessiné dans l'environnement auteur de Flash
	 */
	public class TabbedScrollingBox extends MovieClip
	{
		
		private static const CURRENT_COL:int = 0x000000;
		
		private var contents:Array;
		private var activeColor:int;
		private var nbrPanels:int = 3; // TODO : passer en paramètre
		private var scrollBarColor:int;
		
		public function TabbedScrollingBox()
		{
		}
		
		
		private function setTabColor(col:int, tab:MovieClip)
		{
			var ct:ColorTransform = new ColorTransform();
			ct.color = col;
			var transformation:Transform = new Transform(tab.bg_mc);
			transformation.colorTransform = ct;
			
			if(col == CURRENT_COL){
				tab.bg_mc.alpha = 0.5;
			}else{
				scrollBarColor = col;
				tab.bg_mc.alpha = 1;
			}
			
		}
		
		public function setContent(contentId:int){
			
			//--- initialise la couleur des onglets
			setTabColor(activeColor,tab0_mc);
			setTabColor(activeColor,tab1_mc);
			setTabColor(activeColor,tab2_mc);
			
			// le courant est en noir et en alpha 80%
			setTabColor(CURRENT_COL,this["tab"+contentId+"_mc"]);
			
			
			//--- gestion du contenu
			// supprimer tous les enfants d'abord
			var i:int = container_mc.numChildren;
			while(i --)
			{
				container_mc.removeChildAt( i );
			}
			
			// puis on place le contenu
			this.container_mc.addChild(contents[contentId]);
			
			// roulette de la souris
			// SWFWheel.initialize(contents[contentId]);
			
			// scrollbar
			var scrollBar:ScrollBar;
			// les couleurs sont éligibles pour être passées en paramètre
			scrollBar = new ScrollBar(contents[contentId], 0x000000, 0x333333, 
									  scrollBarColor, 0xffffff, 15, 15, 4, true);
			this.container_mc.addChild(scrollBar);
			
		}
		
		
		internal function displayContent(e:MouseEvent):void
		{
			var curTab:String = e.target.name;
			// id du contenu en fonction de l'id du tab
			var contentId:int = Number(curTab.substr(3,1));
			
			// trace("CONTENT ID = " + contentId + " ("+e.target.name+")");
			
			setContent(contentId);
			
		}
		
		//--------------------------------------------------------------------
		
		public final function init():void
		{
			// quand on souhaite rendre le nombre d'onglets dynamiques
			// le faire ici, en fonction du tableau de clips passés, ...
			
			for(var i=0; i<nbrPanels; i++){
				this["tab"+i+"_mc"].addEventListener(MouseEvent.CLICK,displayContent);
				this["tab"+i+"_mc"].mouseChildren = false;
				this["tab"+i+"_mc"].buttonMode = true;
				this["tab"+i+"_mc"].useHandCursor = true;
			}
			
			// affiche le premier contenu
			setContent(0);
			
		}
		
		
		public function setTitles(titles:Array):void
		{
			tab0_mc.title_txt.text = titles[0];
			tab1_mc.title_txt.text = titles[1];
			tab2_mc.title_txt.text = titles[2];
		}
		
		public function setActiveColor(col:int):void
		{
			activeColor = col;
		}
		
		public function setClips(contents:Array):void
		{
			this.contents = contents;
		}
		
		
		
		
		
	}
}