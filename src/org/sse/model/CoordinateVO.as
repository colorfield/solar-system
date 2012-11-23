package org.sse.model
{
	/**
	 * Coordonnées exprimées en latitude et longitude
	 * TODO : accesseurs / mutateurs avec validation
	 */
	public class CoordinateVO implements ValueObject
	{
		public var label:String;
		public var latitude:Number;
		public var longitude:Number;
		
		public function CoordinateVO(lbl:String, lat:Number, lng:Number)
		{
			this.latitude = lat;
			this.longitude = lng;
			this.label = lbl;
		}
	}
}