package be.colorfield.rss {
	
	import flash.events.EventDispatcher;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.SecurityErrorEvent;
	import flash.events.ProgressEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	
	import com.adobe.utils.XMLUtil;
	import com.adobe.xml.syndication.generic.*;
	
	public class RSSModel extends EventDispatcher {
		
		private var ldr:URLLoader;
		private var rssElts:Array = [];
		private var rssChannel:IMetadata;
		private var rssXML:XML;
		
		public function RSSModel() {
			
		}
		
		//-------- Getters
		public function get feedItems():Array {
			return rssElts != null ? rssElts : null;
		}
		
		public function get rawFeedData():XML {
			return rssXML != null ? rssXML : null;
		}
		
		public function get feedMeta():IMetadata {
			return rssChannel != null ? rssChannel : null;
		}
		
		
		
		public function parseRSS(RSS_URL:String):void {
			ldr = new URLLoader();
			var request:URLRequest = new URLRequest(RSS_URL);
			request.method = URLRequestMethod.GET;
			
			// ajout des écouteurs concernant la progression du chargement
			ldr.addEventListener(Event.COMPLETE, onLoaded, false, 0, true);
			ldr.addEventListener(ProgressEvent.PROGRESS, onProgress, false, 0, true);
			// ajout des écouteurs concernant les erreurs
			ldr.addEventListener(IOErrorEvent.IO_ERROR, onIOError, false, 0, true);
			ldr.addEventListener(SecurityErrorEvent.SECURITY_ERROR, onSecurityError, false, 0, true);
			//charge les données du flux
			try {            
				ldr.load(request);
			}
			catch (e:Error) {
				trace("Le XML n'a pas pu être chargé");
			}
			
		}
		
		
		private function onProgress(event:ProgressEvent):void {
			dispatchEvent(event);
		}
		
		// RSS chargé
		private function onLoaded(event:Event):void {
			parseFeed(event.target.data);
		}
		
		// Parse le XML
		private function parseFeed(data:String):void {
			
			// validation du XML
			/*
			if (! XMLUtil.isValidXML(data)) {
				trace("Les flux contient un XML mal formé");
				return;
			}
			*/
			
			rssXML = new XML(data);
			// Place le XML dans une factory de flux contenant les instances dérivées
			// cf. package com.adobe.xml.syndication.generic.*;
			var rss:IFeed = FeedFactory.getFeedByXML(new XML(data));
			
			// récupère tous les items du feed
			rssElts = rss.items;
			rssChannel = rss.metadata;
			dispatchEvent(new Event(Event.COMPLETE, true, false));
		}
		
		private function onIOError(event:IOErrorEvent):void {
			trace("Erreur I/O : " + event.text);
		}
		
		private function onSecurityError(event:SecurityErrorEvent):void {
			trace("Erreur de sécurité : " + event.text);
		}
		
	}
	
}