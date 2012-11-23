package be.colorfield.utils
{
	public class FileUtils
	{
		public function FileUtils()
		{
		}
		
		/**
		 * Retourne l'extension du nom d'un fichier
		 */
		public static function getExtension(file:String):String {
			
			var extensionIndex:Number = file.lastIndexOf(".");
			if (extensionIndex == -1) {
				// pas d'extension
				return "";
				
			} else {
				return file.substr(extensionIndex + 1,file.length);
			}
			
		}

	}
}