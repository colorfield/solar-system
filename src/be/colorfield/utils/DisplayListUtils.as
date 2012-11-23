package be.colorfield.utils
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;

	public class DisplayListUtils
	{
		
		/**
		 * Parcours récursif de la DisplayList V2
		 */
		public static function walk(dispObj:DisplayObject, indentLevel:int):void{
			
			var objContainer:DisplayObjectContainer = dispObj as DisplayObjectContainer;
			var obj = objContainer.getChildAt(i);
			
			if(obj is DisplayObjectContainer){
				for(var i:int = 0; i<obj.numChildren; i++){
					trace(paddingIndent(indentLevel), obj.name, obj);
					walk(obj, ++indentLevel);
				}
			}else{
				trace(paddingIndent(indentLevel) + obj);
			}
		}
		
		private static function paddingIndent(indents:int):String{
			var indent:String = "";
			for(var i:int = 0; i<indents ; i++){
				indent += "\t";
			}
			return indent;
		}
		
		
		/**
		 * Parcours récursif de la DisplayList V1
		 */
		public static function walkList(obj:DisplayObjectContainer):Number
		{
			var result:Number = 0;
		
			if (obj == null || obj.numChildren == 0)
				return 0;
			
			result += obj.numChildren;
			
			for (var i:int = 0; i < obj.numChildren; i++)
			{
				trace("WALK : " + obj.getChildAt(i) + " - " + obj.getChildIndex(obj.getChildAt(i)));
				result += walkList(obj.getChildAt(i) as DisplayObjectContainer);
			}
			
			return result;
		}
		
		
		
		/**
		 * Affichage des enfants d'un DisplayObjectContainer
		 */
		/*
		public static function displayChildren(dispObj:DisplayObjectContainer):void{
			for(var i:int = 0; i<dispObj.numChildren; i++){
				
				trace(dispObj.getChildAt(i));
				
			}
		}
		*/
		
	}
}