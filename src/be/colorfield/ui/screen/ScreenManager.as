package be.colorfield.ui.screen
{
	import be.colorfield.ui.layout.MainGUI;
	import be.colorfield.utils.DisplayListUtils;
	import be.colorfield.ui.Application;
	
	import org.sse.ui.screen.Screen01News;
	
	public class ScreenManager
	{
		
		public static var main:MainGUI;
		// singleton
		private static var INSTANCE:ScreenManager;
		// ecran courant
		public static var curScreen:IScreen = null;
		
		/**
		 * Constructeur : 
		 * lorsque l'instance est appellée pour la première fois,
		 * on appelle l'écran d'accueil (ScreenSplash)
		 */
		public function ScreenManager(pvt:SingletonPrivateClass){
			// TODO : si on veut réutiliser dans d'autres projets, 
			// il faut disposer d'une classe ScreenSplash
			// qui instanciera celle qu'on souhaite comme écran par défaut
			var initScreen:IScreen = new Screen01News();
			displayScreen(initScreen);
		}
		
		/**
		 * Affichage d'un écran : 
		 * si l'écran demandé n'est pas l'écran courant 
		 * supprime tous les élements de l'écran courant 
		 * puis crée l'écran suivant et l'ajoute à la liste
		 */
		public function displayScreen(screen:IScreen):void{
			
			if(screen != curScreen){
				
				if(screen != null){
					main.removeAllElements();
					main.displayTemplateBackground();
					screen.displayElements();
					main.displayTemplateForeground();
				}
				
				curScreen = screen;
			}
		}
		
		
		/**
		 * Singleton
		 */
		public static function getInstance():ScreenManager{

			if(ScreenManager.INSTANCE == null){
				ScreenManager.INSTANCE = new ScreenManager(new SingletonPrivateClass());
			}else{
				// déjà instancié
			}
			
			return ScreenManager.INSTANCE;
		}
		
	}
}

//----------- Singleton

internal class SingletonPrivateClass{

}