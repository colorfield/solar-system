package be.colorfield.events{
	
	import flash.events.Event;
	
	/**
	 * Evénement personnalisé dispatché par un Button
	 * Permet de stocker une propriété lien (l'identifiant d'un lien)
	 */
	public class ButtonEvent extends Event
	
	{
		public static const CLICK:String = "buttonClick";
		public var lnk:int;
		
		public function ButtonEvent (type:String, bubbles:Boolean=false, cancelable:Boolean=false, lnk:int=0)
		{
			// initialisation du constructeur de la classe Event
			super(type, bubbles, cancelable);
			// stocke le lien associé au bouton cliqué
			this.lnk = lnk;
		}
		
		// la méthode clone doit être surchargée
		public override function clone():Event
		{
			return new ButtonEvent (type, bubbles, cancelable, lnk);
		}
		
		// la méthode toString doit (devrait en tout cas) être surchargée
		public override function toString():String
		{
			return '[ButtonEvent type="'+ type +'" bubbles=' + bubbles + ' eventPhase='+ eventPhase + ' cancelable=' + cancelable + ']';
		}
		
	}
	
}