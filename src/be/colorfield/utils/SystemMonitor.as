package be.colorfield.utils
{
	/**
	 * Moniteur système
	 */
	public class SystemMonitor
	{
		public static function getMemoryUsage():String
		{
			return System.totalMemory / 1024 + " Kb";
		}
	}
}