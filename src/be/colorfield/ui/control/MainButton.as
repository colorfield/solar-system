﻿package be.colorfield.ui.control{		import be.colorfield.events.ButtonEvent;		import fl.transitions.Tween;	import fl.transitions.easing.Bounce;		import flash.display.Shape;	import flash.display.Sprite;	import flash.events.MouseEvent;	import flash.geom.ColorTransform;	import flash.geom.Transform;	import flash.text.TextField;	import flash.text.TextFieldAutoSize;	import flash.text.TextFormat;		public class MainButton extends Sprite	{				// valeurs par défaut		private static const NBR_BUTTON:int = 0;		private static const DEFLT_LABEL:String = "Nouveau bouton";		private static const DEFLT_COLOR:int = 0x000000;		private static const DEFLT_SPEED:int = 1;				private static const BTN_HEIGHT:int = 30;		private static const BTN_WIDTH:int = 230;		private static const ALPHA_BTN:Number = 0.7;						// stocke le fond du bouton		private var btnBackground:Shape;		// stocke l'objet Tween pour les différents états du bouton		// private var interpolation:Tween;		// stocke les références aux boutons		private var btnArray:Array = new Array();		// stocke la couleur en cours du bouton		private var btnColor:uint;		// stocke la vitesse d'ouverture de chaque bouton		private var btnSpeed:Number;		// légende du bouton		private var label:String;		private var btnLabel:TextField;		// formatage des légendes		private var btnTextFormat:TextFormat;		// lien associé (identifiant => constante peuplée via le Model)		private var lnk:int;				/**		 * Constructeur par défaut afin de pouvoir instancier depuis Flash.		 * TODO : getter et setter pour les valeurs passées par le second constructeur		 * TODO : créer un MainButton sous Flash		 */		public function MainButton(lnk:int = 0, btnColor:int = DEFLT_COLOR, 								   btnSpeed:Number = 5, label:String = DEFLT_LABEL)		{			//======> this("", DEFLT_COLOR, DEFLT_SPEED, DEFLT_LABEL + (++MainButton.NBR_BUTTON));						// activation du mode bouton			buttonMode=true;			// désactivation des objets enfants (sinon seraient également cliquables)			mouseChildren=false;						// ajoute chaque instance au tableau			btnArray.push(this);						this.lnk = lnk;			this.btnColor = btnColor;			this.label = label;			// affectation de la btnSpeed contrôlée			setBtnSpeed(btnSpeed);						// dessine			drawButton();						// création de l'objet Tween			// interpolation = new Tween(btnBackground, "scaleX", Bounce.easeOut, 1, 1, btnSpeed, true);			// écoute de l'événement MouseEvent.ROLL_OVER			addEventListener( MouseEvent.ROLL_OVER, survolSouris );			// écoute de l'événement MouseEvent.CLICK			addEventListener( MouseEvent.CLICK, clicSouris );				}				private function drawButton():void		{			// création du fond du bouton			btnBackground = new Shape();			// ajout à la liste d'affichage			addChild(btnBackground);			// créé le champ texte			btnLabel = new TextField();			btnLabel.x = 30;			btnLabel.y = 2;			// redimensionnement automatique du champ texte			btnLabel.autoSize = TextFieldAutoSize.LEFT;			// ajout à la liste d'affichage			addChild(btnLabel);			// affecte la légende			btnLabel.text = label;			// active l'utilisation de police embarquée			btnLabel.embedFonts = true;			// créé un objet de btnTextFormat			btnTextFormat = new TextFormat();			// taille de la police			btnTextFormat.color = 0xffffff;			btnTextFormat.size=16;			// instanciation de la police embarquée			// => classe créée dans Flash			var police:HelveticaNeue = new HelveticaNeue();			// affectation de la police au btnTextFormat			btnTextFormat.font=police.fontName;			// affectation du btnTextFormat au champ texte			btnLabel.setTextFormat(btnTextFormat);			// rend le champ texte non selectionnable			btnLabel.selectable=false;			// stocke la btnColor passée en paramètre			// btnColor=pbtnColor;						// dessine le bouton			btnBackground.graphics.beginFill(btnColor, 1);			btnBackground.graphics.drawRect(0, 0, BTN_WIDTH, BTN_HEIGHT);						btnBackground.alpha = ALPHA_BTN;		}				// pour la mise en surbrillance du bouton courant		public function changeColor(col:int):void{			var ct:ColorTransform = new ColorTransform();  			ct.color = col;  			var transformation:Transform = new Transform(this.btnBackground);  			transformation.colorTransform = ct;  			  			if(col != 0x000000){  				this.btnBackground.alpha = ALPHA_BTN;	  			}else{  				this.btnBackground.alpha = ALPHA_BTN;	  			}  		}						// déclenché lors du clic du bouton		private function clicSouris(e:MouseEvent):void		{			dispatchEvent(new ButtonEvent(ButtonEvent.CLICK, true, false, lnk));			// interpolation.continueTo( 1.1, btnSpeed );		}						// déclenché lors du survol du bouton		private function survolSouris( pEvt:MouseEvent ):void		{			// stocke la longueur du tableau			var lng:int=btnArray.length;			for (var i:int = 0; i<lng; i++) {				// btnArray[i].closeBtn();			}// démarrage de l'animation			// interpolation.continueTo( 1.1, btnSpeed );		}				// méthode permettant de fermer le bouton		public function closeBtn():void		{			// referme le bouton			// interpolation.continueTo( 1, btnSpeed );		}				// gère l'affectation de la vitesse		public function setBtnSpeed(btnSpeed:Number):void		{			// affecte la btnSpeed			if (btnSpeed>=1 && btnSpeed<=10) {				this.btnSpeed = btnSpeed;			} else {				trace("Erreur : vitesse non correcte, la valeur doit être comprise entre 1 et 10");				btnSpeed=1;			}		}	}}