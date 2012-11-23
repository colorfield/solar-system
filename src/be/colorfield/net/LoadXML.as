package be.colorfield.net {
	
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.EventDispatcher;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	/**
	 * Gestion du chargement d'un flux XML
	 * Version 2 - Singleton
	 */
	public class LoadXML extends EventDispatcher {
	
		private static var instance:LoadXML;
	
		private var eventDispatcher:EventDispatcher;
		private var data:XML;
		private var urlLoader:URLLoader;
		
		/**
		 *	Données XML
		 *	@return XML ou null si XML non chargé.
		 */
		public function get xmlData():XML {
			return data != null ? data : null;
		}
		
		
		public function LoadXML(enforcer:SingletonPrivateClass) {
			eventDispatcher = new EventDispatcher();
		}
		
		public static function getInstance():LoadXML {
			if(LoadXML.instance == null) {
				LoadXML.instance = new LoadXML(new SingletonPrivateClass());
			}
			return LoadXML.instance;	
		}
		
		public function loadXML(url:String):void {
			var urlRequest:URLRequest = new URLRequest(url);
			urlLoader = new URLLoader();
			urlLoader.addEventListener(Event.COMPLETE, onXMLDataLoaded);
			urlLoader.addEventListener(IOErrorEvent.IO_ERROR, handleError);
			urlLoader.load(urlRequest);
			try {
				urlLoader.load(urlRequest);
			} catch (error:Error) {
				trace("Erreur durant le chargement du XML : "+Error);
			}
		}
		
		private function onXMLDataLoaded(event:Event):void {
			data = XML(urlLoader.data);
			dispatchEvent(new Event(Event.COMPLETE, true, true));
		}
		private function handleError(event:IOErrorEvent):void {
			trace("Erreur chargement XML");
		}
		
	}
	
}

class SingletonPrivateClass {}