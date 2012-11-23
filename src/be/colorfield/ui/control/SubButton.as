package be.colorfield.ui.control
{
	public class SubButton extends MainButton
	{
		
		// valeurs par défaut
		private static const NBR_BUTTON:int = 0;
		private static const DEFLT_LABEL:String = "Nouveau bouton";
		private static const DEFLT_COLOR:int = 0x000000;
		private static const DEFLT_SPEED:int = 1;
		
		/**
		 * Constructeur par défaut afin de pouvoir instancier depuis Flash (~ POJO)
		 * Cette classe permet d'ajouter une logique différente pour les SubButton
		 */
		public function SubButton()
		{
			this("", DEFLT_COLOR, DEFLT_SPEED, DEFLT_LABEL + (++MainButton.NBR_BUTTON));
		}
		
		public function SubButton(lnk:int, btnColor:uint, btnSpeed:Number, btnLabel:String)
		{
			super(lnk, btnColor, btnSpeed, btnLabel);
		}
		
	}
}