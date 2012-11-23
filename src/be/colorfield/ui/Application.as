package be.colorfield.ui
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.display.Stage;
	
	/**
	 * Définition d'un point d'accès global à la scène (Stage) afin<br />
	 * <ul><li>d'obtenir la certitude qu'elle est accessible à tous les objets</li>
	 * <li>de rendre celle-ci accessible même aux objets non graphiques (= étendant Shape, Sprite, MovieClip).</li>
	 * </ul>
	 */
	public class Application extends MovieClip
	{
		
		public static var MAIN_STAGE:Stage;
		
		/**
		 *  <b>Constructeur</b><br />
		 *  Ecoute de l'événement d'ajout de Main à la Stage
		 */
		public function Application()
		{
			this.loaderInfo.addEventListener(Event.INIT,activateStage);
		}
		
		/**
		 *  Affecte une référence à Stage
		 */
		private function activateStage(e:Event):void
		{
			Application.MAIN_STAGE = stage;
		}
		
	}
}