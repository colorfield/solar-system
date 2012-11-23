/*SIMPLE XML PARSING CLASS THAT RETURNS AN ARRAY OF IMAGES

SAMPLE USEAGE

In .fla
var myloadXml:LoadXmlToArray = new LoadXmlToArray("images.xml");
myloadXml.addEventListener("xmlParsed", callbackHandler);

Dale Sattler
www.blog.noponies.com
*/

package noponies.net {
	import flash.events.*;
	import flash.net.URLRequest;
	import flash.net.URLLoader;

	public class LoadXmlToArray extends EventDispatcher {
		private var myXML:XML;
		private var myXLoader:URLLoader;
		private var myXMLURL:URLRequest;
		private var XML_URL:String;
		public var imagesArray:Array;
		public function LoadXmlToArray(url:String) {
			myXML = new XML();
			XML_URL = url;
			imagesArray = new Array;
			myXMLURL = new URLRequest(XML_URL);
			myXLoader = new URLLoader(myXMLURL);
			myXLoader.addEventListener(Event.COMPLETE, completeHandler);
			myXLoader.addEventListener(IOErrorEvent.IO_ERROR, handleError);
		}
		private function completeHandler(e:Event):void {
			myXML = XML(e.target.data);
			for (var i:int = 0; i < myXML.slide.length(); i++) {
				imagesArray.push(myXML.slide.image[i]);
			}
			dispatchEvent(new Event("xmlParsed"));

		}
		private function handleError(event:IOErrorEvent):void {
			trace("Error loading XML");
		}
	}
}