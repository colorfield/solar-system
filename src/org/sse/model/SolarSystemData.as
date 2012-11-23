package org.sse.model
{
	/**
	 * Chargement de toutes les données globales à cette application depuis un fichier XML
	 */
	public class SolarSystemData
	{
		
		// singleton
		private static var INSTANCE:SolarSystemData;
		
		private static var MARS_COORDINATES:Vector.<CoordinateVO>;
		private static var EARTH_COORDINATES:Vector.<CoordinateVO>;
		private static var MOON_COORDINATES:Vector.<CoordinateVO>;
		private static var HUBBLE_COORDINATES:Vector.<CoordinateVO>;
		
		public function SolarSystemData(pvt:SglPrivateClass)
		{
			setMarsCoordinate();
			setEarthCoordinate();
			setMoonCoordinate();
			setHubbleCoordinate();
		}
		
		//------------------------------------------------------------------------
		// 		DEFINITION DES LIEUX A VISITER + latitude et longitude
		//------------------------------------------------------------------------
		
		
		public function getMarsCoordinate():Vector.<CoordinateVO>
		{
			return MARS_COORDINATES;
		}
		
		public function getEarthCoordinate():Vector.<CoordinateVO>
		{
			return EARTH_COORDINATES;
		}
		
		public function getMoonCoordinate():Vector.<CoordinateVO>
		{
			return MOON_COORDINATES;
		}
		
		public function getHubbleCoordinate():Vector.<CoordinateVO>
		{
			return HUBBLE_COORDINATES;
		}
		
		// sources : http://www.geody.com/
		
		private function setMarsCoordinate():void{
			MARS_COORDINATES = new Vector.<CoordinateVO>();
			MARS_COORDINATES.push(new CoordinateVO("Olympus Mons",18.400000,-134.000000));
			MARS_COORDINATES.push(new CoordinateVO("Valles Marineris",-13.800000,-59.200001));
			MARS_COORDINATES.push(new CoordinateVO("Eos Chasma",-12.000000,-39.700001));
		}
		
		private function setEarthCoordinate():void{
			EARTH_COORDINATES = new Vector.<CoordinateVO>();
			EARTH_COORDINATES.push(new CoordinateVO("EPFC",50.836899,4.431414));
			EARTH_COORDINATES.push(new CoordinateVO("Google Campus",39.027719,-121.992187));
		}
		
		private function setMoonCoordinate():void{
			MOON_COORDINATES = new Vector.<CoordinateVO>();
			MOON_COORDINATES.push(new CoordinateVO("Mare Tranquillitatis",8.500000,	31.400000));
			MOON_COORDINATES.push(new CoordinateVO("Oceanus Procellarum",18.400000,-57.400002));
			MOON_COORDINATES.push(new CoordinateVO("Sinus Medii",2.400000,1.700000));
		}
		
		private function setHubbleCoordinate():void{
			HUBBLE_COORDINATES = new Vector.<CoordinateVO>();
			HUBBLE_COORDINATES.push(new CoordinateVO("Betelgeuse",7.40703630,-91.20713043));
			HUBBLE_COORDINATES.push(new CoordinateVO("Vega",38.78299332,99.23410797));
			HUBBLE_COORDINATES.push(new CoordinateVO("Sirius",-16.71314240,-78.71145630));
		}
		
		
		/**
		 * Singleton
		 */
		public static function getInstance():SolarSystemData{
			
			if(SolarSystemData.INSTANCE == null){
				SolarSystemData.INSTANCE = new SolarSystemData(new SglPrivateClass());
			}else{
				// trace("SolarSystemData déjà instancié");
			}
			
			return SolarSystemData.INSTANCE;
		}
	}
}

//----------- Singleton

internal class SglPrivateClass{
	
}