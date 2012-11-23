﻿/* AS3*Copyright 2008 noponies.*/package noponies.ui{		import be.colorfield.ui.Application;	import flash.display.DisplayObject;	import flash.display.Stage;	import flash.events.Event;	import flash.events.EventDispatcher;	/**	* The NpFlexLayoutItem class is an internal Class used by the NpFlexLayout Class as a holder for properties for 	* each DisplayObject passed into the NpFlexLayout Class.	* 	* @langversion ActionScript 3.0	* @Flash Player 9.0.28.0	* @author noponies - 2009	* @version 1.0	*/	internal class NpFlexLayoutItem extends EventDispatcher {		//--------------------------------------		// PRIVATE PROPERTIES		//--------------------------------------				private var _sw:int;//reference to stage width  		private var _sh:int;//reference to stage height		private  var _stageInstance:Stage;//stage ref		private var _x:Number;		private var _y:Number;		private var _width:Number;		private var _height:Number;		private var _minHeight:Number;		private var _minWidth:Number;		private var _maxHeight:Number;		private var _maxWidth:Number;				private var _useClipRegPoint:Boolean;		private var _resizeTarget:DisplayObject;		private var _offSetX:Number;		private var _offSetY:Number;		private var _offSetW:Number;		private var _offSetH:Number;		private var _minX:Number;		private var _minY:Number;		private var _maxX:Number;		private var _maxY:Number;		private var _fastPath:Boolean = true;		private var _resizeMode:Boolean = true;		private var _constrainResize:Boolean = false;						//--------------------------------------		// GETTERS // SETTERS		//--------------------------------------			/**		*	@private		*/		internal function get resizeTarget():DisplayObject {			return this._resizeTarget;		}		/**		*	@private		*/		internal function get x():Number {			return this._x;		}		/**		*	@private		*/		internal function set x(newx:Number):void {			this._x = newx;		}		/**		*	@private		*/		internal function get y():Number {			return this._y;		}		/**		*	@private		*/		internal function set y(newy:Number):void {			this._y = newy;		}		/**		*	@private		*/		internal function get offSetX():Number {			return this._offSetX;		}		/**		*	@private		*/		internal function set offSetX(newOffSetX:Number):void {			this._offSetX = newOffSetX;		}		/**		*	@private		*/		internal function get offSetY():Number {			return this._offSetY;		}		/**		*	@private		*/		internal function set offSetY(newOffSetY:Number):void {			this._offSetY = newOffSetY;		}		/**		*	@private		*/		internal function get offSetW():Number {			return this._offSetW;		}		/**		*	@private		*/		internal function set offSetW(newOffSetW:Number):void {			this._offSetW = newOffSetW;		}		/**		*	@private		*/		internal function get offSetH():Number {			return this._offSetH;		}		/**		*	@private		*/		internal function set offSetH(newOffSetH:Number):void {			this._offSetH = newOffSetH;		}		/**		*	@private		*/		internal function get width():Number {			return this._width;		}		/**		*	@private		*/		internal function set width(newWidth:Number):void {			this._width = newWidth;		}		/**		*	@private		*/		internal function get height():Number {			return this._height;		}		/**		*	@private		*/		internal function set height(newHeight:Number):void {			this._height = newHeight;		}		/**		*	@private		*/		internal function get minWidth():Number {			return this._minWidth;		}		/**		*	@private		*/		internal function set minWidth(newMinWidth:Number):void {			this._minWidth = newMinWidth;		}		/**		*	@private		*/		internal function get minHeight():Number {			return this._minHeight;		}		/**		*	@private		*/		internal function set minHeight(newMinHeight:Number):void {			this._minHeight = newMinHeight;		}				internal function get maxWidth():Number {			return this._maxWidth;		}		/**		*	@private		*/		internal function set maxWidth(newMaxWidth:Number):void {			this._maxWidth = newMaxWidth;		}		/**		*	@private		*/		internal function get maxHeight():Number {			return this._minHeight;		}		/**		*	@private		*/		internal function set maxHeight(newMaxHeight:Number):void {			this._maxHeight = newMaxHeight;		}		/**		*	@private		*/		internal function get minX():Number {			return this._minX;		}		/**		*	@private		*/		internal function set minX(newMinX:Number):void {			this._minX = newMinX;		}		/**		*	@private		*/		internal function get minY():Number {			return this._minY;		}		/**		*	@private		*/		internal function set minY(newMinY:Number):void {			this._minY = newMinY;		}		/**		*	@private		*/		internal function get maxX():Number {			return this._maxX;		}		/**		*	@private		*/		internal function set maxX(newMaxX:Number):void {			this._maxX = newMaxX		}		/**		*	@private		*/		internal function get maxY():Number {			return this._maxY;		}		/**		*	@private		*/		internal function set maxY(newMaxY:Number):void {			this._maxY = newMaxY;		}		/**		*	@private		*/		internal function get useClipRegPoint():Boolean {			return this._useClipRegPoint;		}		/**		*	@private		*/		internal function set useClipRegPoint(newClipReg:Boolean):void {			this._useClipRegPoint = newClipReg;		}		/**		*	@private		*/		internal function get fastPath():Boolean {			return this._fastPath;		}		/**		*	@private		*/		internal function set fastPath(newFastPath:Boolean):void {			this._fastPath = newFastPath;		}		/**		*	@private		*/		internal function get reflowing():Boolean {			return this._resizeMode ;		}		/**		*	@private		*/		internal function get constrainResize():Boolean {			return this.constrainResize;		}				/**		*	@private		*/		internal function set constrainResize(newConstrain:Boolean):void {			this._constrainResize = newConstrain ;		}				//--------------------------------------		// CONSTRUCTOR		//--------------------------------------			/**		* @param target A DisplayObject to Position on the the stage.		* @param vars Object containing the positional properties for the passed in DisplayObject.		* @return void		* 		*/		public function NpFlexLayoutItem(target:DisplayObject, vars:Object) {			this._resizeTarget = target;			for (var value:String in vars) {				this["_" + value] = vars[value];			}			//test for fast path			checkFastPath();			//get reference to stage			// CORRECTIF : _stageInstance = _resizeTarget.stage;			_stageInstance = Application.MAIN_STAGE;			_stageInstance.addEventListener(Event.RESIZE, resizeListener);			addEventListener(Event.REMOVED_FROM_STAGE, killClass);			reflowObjects();		}				//--------------------------------------		// CHECK FAST PATH METHOD		//--------------------------------------					//check the fast path var		/**		*	@private		*/		internal function checkFastPath():void{		if (_useClipRegPoint || _offSetX!=0 || _offSetY!=0 || _offSetW!=0 || _offSetH!=0 || _width!=0 || _height!=0 || _minX!=0 || _minY!=0 || _maxX!=999999 || _maxY!=999999 || _constrainResize) {				this._fastPath = false;			}else{				this._fastPath = true;			}		}				//--------------------------------------		// DISABLE REFLOW METHOD		//--------------------------------------					//remove listening to stage resize events		/**		*	@private		*/		internal function disableStageResize():void{			try {				_stageInstance.removeEventListener(Event.RESIZE, resizeListener);				_resizeMode = false;				} catch (error:Error) {				trace("Problem disabling stage resize "+error);			}		}				//--------------------------------------		// RE ENABLE REFLOW METHOD		//--------------------------------------					//remove listening to stage resize events		/**		*	@private		*/		internal function renableStageResize():void{			try {			_stageInstance.addEventListener(Event.RESIZE, resizeListener);			_resizeMode = true;			} catch (error:Error) {				trace("Problem adding Stage Resize Listener "+error);			}		}				//--------------------------------------		// KILL CLASS METHOD		//--------------------------------------				/**		*	@private		*/		internal function killClass(event:Event = null):void {			try {				_stageInstance.removeEventListener(Event.RESIZE, resizeListener);				removeEventListener(Event.REMOVED_FROM_STAGE, killClass);				} catch (error:Error) {				trace("Error removing item from NpFlexLayoutItem class " + error);			}		}				//set initial positions of clips		//Here we calc stage dimensions as a %, if we are using an offset, it will be included here		//includes a "fast path" check, where if we have no extra params, we take the fastest route for each clip		/**		*	@private		*/		internal function reflowObjects():void {			_sw = _stageInstance.stageWidth;			_sh = _stageInstance.stageHeight;					if (_fastPath) {						_resizeTarget.x = (_sw * _x) + _offSetX;						_resizeTarget.y = (_sh * _y) + _offSetY;				} else {					if (_width != 0 || _offSetW != 0) {						//first set width						_resizeTarget.width = (_sw * _width) + _offSetW;						if(_minWidth > 0 && _resizeTarget.width < _minWidth) _resizeTarget.width = _minWidth;						if(_maxWidth > 0 && _resizeTarget.width > _maxWidth) _resizeTarget.width = _maxWidth;						if(_constrainResize) _resizeTarget.scaleY = _resizeTarget.scaleX;					}					if (_height != 0 || _offSetH != 0) {						//first set height						_resizeTarget.height = (_sh * _height) + _offSetH;						if(_minHeight > 0 && _resizeTarget.height < _minHeight) _resizeTarget.height = _minHeight;						if(_maxHeight > 0 && _resizeTarget.height > _maxHeight) _resizeTarget.height = _maxHeight;						if(_constrainResize) _resizeTarget.scaleX = _resizeTarget.scaleY;					}					//finally position our clip					//check xmin and ymin values					if ((_sw * _x) + _offSetX < _minX || (_sh * _y) + _offSetY < _minY ) {							if ( _minX != 0 ) 	_resizeTarget.x = _minX; 							if ( _minY != 0 )  _resizeTarget.y = _minY; 					} else if ((_sw * _x) - _offSetX > _maxX || (_sh * _y) - _offSetY > _maxY) {							if ( _maxX != 999999 )  _resizeTarget.x = _maxX; 							if ( _maxY != 999999 )  _resizeTarget.y = _maxY; 					} else {						//test if we are using its reg point						if (_useClipRegPoint) {								_resizeTarget.x = ((_sw * _x) -(_resizeTarget.width>> 1)) + _offSetX;								_resizeTarget.y = ((_sh * _y) -(_resizeTarget.height>> 1)) + _offSetY;						} else {								_resizeTarget.x = (_sw * _x) + _offSetX;								_resizeTarget.y = (_sh * _y) + _offSetY;							}						}					}						}				//--------------------------------------		// PRIVATE INSTANCE METHODS		//--------------------------------------		//stage resize listener event listener		private function resizeListener(event:Event):void {			reflowObjects();		}	}}