package be.colorfield.net {
	
	import flash.events.Event;
	import flash.events.ProgressEvent;
	import flash.events.IOErrorEvent;
	import flash.events.SecurityErrorEvent;
	import flash.events.EventDispatcher;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.display.Loader;
	import flash.display.DisplayObjectContainer;
	import flash.display.DisplayObject;
	import flash.events.EventDispatcher;
	
	/**
	 *  <strong>LoadExternalAsset</strong>
	 */
	
	public class LoadExternalAsset extends EventDispatcher {
		//--------------------------------------
		// STATIC VARS
		//--------------------------------------
		private static var instance:LoadExternalAsset;
		//--------------------------------------
		// PRIVATE VARS
		//--------------------------------------
		private var _itemURL:String;
		private var _itemContainer:DisplayObjectContainer;
		private var _removeExistingChildren:Boolean;
		//--------------------------------------
		// CONSTRUCTOR
		//--------------------------------------
		public function LoadExternalAsset(enforcer:SingletonEnforcer) {
		}
		
		//--------------------------------------
		// CONSTRUCTOR
		//--------------------------------------
		
		/**
		 *	Gateway into class. Query this method to check for any other existing instances of this class.
		 *	@return Class
		 */
		public static function getInstance():LoadExternalAsset {
			if (LoadExternalAsset.instance == null) {
				LoadExternalAsset.instance = new LoadExternalAsset(new SingletonEnforcer());
			}
			return LoadExternalAsset.instance;
		}
		
		/**
		 *	
		 *  This public method allows for the loading of an DisplayObject.
		 *	@param String representing the URL of the file you want to load.
		 *	@param DisplayObjectContainer to load content into.
		 *	@param Boolean (Default is true) indicating whether or not to remove all existing children of target DisplayObjectContainer.
		 * <p>Handle 'cache busting' outside of this class.</p> 
		 * @example Flash CS3 Document Class based truncated Demo of loading an file.
		 * <listing version="3.0">
		 * import LoadExternalAsset;// singelton external DisplayObject loading class
		 * 
		 *
		 *	private function loadContentItem() {		
		 *			LoadExternalAsset.getInstance().loadMovie("images/image001.jpg?nocache=" + getTimer());
		 *			LoadExternalAsset.getInstance().addEventListener(Event.COMPLETE, handleContentLoad);
		 *		}
		 *
		 *
		 *
		 *	private function handleContentLoad(event:Event):void{
		 *			LoadExternalAsset.getInstance().removeEventListener(Event.COMPLETE,handleContentLoad);
		 *			trace("Content loaded");
		 *	 }
		 *
		 *
		 * </listing>
		 */
		
		public function loadMovie(itemURL:String, itemContainer:DisplayObjectContainer, removeExistingChildren:Boolean = true):void {
			_itemURL = itemURL;
			_itemContainer = itemContainer;
			_removeExistingChildren = removeExistingChildren;
			//load the actual content
			loadContent();
		}
		
		//--------------------------------------
		//
		// PRIVATE METHODS
		//
		//--------------------------------------		
		
		//remove any content existing in target displayObjectContainer
		private function cleanOutContainer(loadedContent:DisplayObject):void {
			//remove all children of parent container
			while(_itemContainer.numChildren > 0) {
				_itemContainer.removeChildAt(0);
			}
			_itemContainer.addChild(loadedContent);
		}
		
		//load the image
		private function loadContent():void {
			var _loader:Loader = new Loader();
			_loader.contentLoaderInfo.addEventListener(Event.COMPLETE, loaded);
			_loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, iOErrorHandler);
			_loader.contentLoaderInfo.addEventListener(SecurityErrorEvent.SECURITY_ERROR, securityErrorHandler);
			_loader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, progressHandler);
			var request:URLRequest = new URLRequest(String(_itemURL));
			
			try {
				_loader.load(request);
			} catch (error:ArgumentError) {
				trace("An ArgumentError has occurred." + error);
			} catch (error:SecurityError) {
				trace("A SecurityError has occurred." + error);
			} catch (error:Error) {
				trace("Sorry, a Error has occurred when attempting to load content " + error);
			}
		}
		
		//--------------------------------------
		//
		// EVENT HANDLERS
		//
		//--------------------------------------
		
		//--------------------------------------
		// HANDLE SUCCESSFUL CONTENT LOAD
		//--------------------------------------
		private function loaded(event:Event):void {
			
			if (_itemContainer.numChildren > 0) {
				if(_removeExistingChildren) {
					cleanOutContainer(event.target.content);
				}else{
					_itemContainer.addChild(event.target.content);
				}
			}
			else {
				_itemContainer.addChild(event.target.content);
			}
			
			//dispatch the loaded event
			dispatchEvent(event);
		}
		
		//--------------------------------------
		// HANDLE IO ERRORS
		//--------------------------------------
		private function iOErrorHandler(event:IOErrorEvent):void {
			trace("There has been an ioErrorHandler: " + event);
		}
		
		//--------------------------------------
		// HANDLE SECURITY ERRORS
		//--------------------------------------
		private function securityErrorHandler(event:SecurityErrorEvent):void {
			trace("There has been an security error: " + event);
		}		
		
		//--------------------------------------
		// HANDLE PROGRESS EVENT
		//--------------------------------------
		private function progressHandler(event:ProgressEvent):void {
			dispatchEvent(new ProgressEvent(ProgressEvent.PROGRESS,false,true,event.bytesLoaded, event.bytesTotal));
		}
		
	}
	
}

class SingletonEnforcer {
}