package be.colorfield.ui.screen
{
	import be.colorfield.ui.Application;
	import be.colorfield.ui.layout.MainGUI;
	import be.colorfield.utils.DisplayListUtils;
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.display.Stage;
	
	/**
	 * Classe ABSTRAITE
	 */
	public class ScreenAbstract extends Sprite implements IScreen
	{
		/**
		 * Liste des éléments et options de l'écran
		 */
		//public car utilisé par les classes d'implémentation
		public static var main:MainGUI;
		
		//private var elementsList:SLinkedList;
		//private var optionsList:SLinkedList;
		private var elementsList:Vector.<DisplayObject>;
		
		// Idéalement Vector.<LayoutVO> qui serait instancié par une Factory
		// selon le LayoutManager utilisé !
		// Ici on utilise une application tierce pour le layout, 
		// celle-ci prend par défaut des Object
		// => à réécrire
		private var optionsList:Vector.<Object>; 
		
		// flags
		private var isBuilt:Boolean = false;
		private var isAdded:Boolean = false;
				
		public function ScreenAbstract()
		{
			//this.elementsList = new SLinkedList();
			//this.optionsList = new SLinkedList();
			elementsList = new Vector.<DisplayObject>();
			optionsList = new Vector.<Object>; 
			
			buildElements();
		}
		
		/**
		 * Méthode ABSTRAITE, doit être redéfinie
		 */
		public function buildElements():void
		{
			throw new Error("builElements doit être implémentée");
		}
		
		/**
		 * Vérifie si la liste des éléments est vide
		 */
		public function hasElements():Boolean{
			//return !this.elementsList.isEmpty();
			return this.elementsList.length > 0;
		}
		
		/**
		 * Ajout d'un élément aux listes => permet de changer d'implémentation
		 */
		public function addElement(dObj:DisplayObject,options:Object):void{
			//this.elementsList.append(dObj);
			//this.optionsList.append(options);
			this.elementsList.push(dObj);
			this.optionsList.push(options);
		}
		
		
		/**
		 * Ajout des éléments à la liste d'affichage et au layout principal
		 */
		public function displayElements():void
		{
			// if(!isAdded){
				for(var i:int = 0; i<elementsList.length;++i){
					var elt:DisplayObject = elementsList[i]; 
					var opt:Object = optionsList[i]; // TODO : utiliser un valueObject
					
					main.addChild(elt); // ajout du DisplayObject à la DisplayList
					main.layout.addTarget(elt,opt); // ajout au gestionnaire de layout, avec options d'affichage
					//main.layout.addTarget(itrElts.next(),options);
					// TODO : si options null, placer les options par défaut
				}
				/*
				var itrElts:Iterator = elementsList.getIterator();
				var itrOpts:Iterator = optionsList.getIterator();
				while(itrElts.hasNext()){
					var elt:DisplayObject = itrElts.next(); 
					var opt:Object = itrOpts.next(); // TODO : utiliser un valueObject
					trace("ADD ELEMENT " + elt);
					main.addChild(elt); // ajout du DisplayObject à la DisplayList
					main.layout.addTarget(elt,opt); // ajout au gestionnaire de layout, avec options d'affichage
				}
				*/
			//}
		}
		
		
		/**
		 * Suppression des éléments de la liste d'affichage
		 */
		public function removeElements():void
		{
			throw new Error("removeElements doit être implémentée");
		}
		
		/**
		 * Opérations effectuées après l'affichage
		 */
		public function postDisplayOperations():void{
			// throw new Error("postDisplayOperations doit être implémentée");
		}
		
		/**
		 * Opérations à réaliser après la suppression des éléments de l'écran précédent
		 */
		public function postRemoveOperations():void{
			throw new Error("postRemoveOperations doit être implémentée");
		}
		
	}
}