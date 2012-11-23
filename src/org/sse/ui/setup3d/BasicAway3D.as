package org.sse.ui.setup3d
{
	
	import be.colorfield.ui.Application;
	
	import away3d.cameras.HoverCamera3D;
	import away3d.containers.View3D;
	
	import flash.display.Sprite;
	import flash.events.Event;

	/**
	 * Classe permettant une implémentation minimale d'Away3D, ce concept 
	 * existe en natif en Papervision3D (BasicView3D), 
	 * on reprend donc l'idée mais avec l'API d'Away3D
	 */
	public class BasicAway3D extends Sprite
	{
		protected var _camera:HoverCamera3D;
		protected var _view:View3D;
		
		public function BasicAway3D()
		{
			_createView();
			_createScene();
		}
		
		
		protected function _createView():void
		{
			_camera = new HoverCamera3D();
			_camera.distance = 1000;
			_camera.tiltAngle = 10;
			_camera.panAngle = 180;
			
			_view = new View3D();
			_view.x = 400;
			_view.y = 300;
			
			_view.camera = this._camera;
			
			
			addChild(_view);
			addEventListener(Event.ENTER_FRAME, _onEnterFrame);
		
		}
		
		// override
		protected function _createScene():void{

		}
		
		protected function _onEnterFrame(ev:Event):void
		{
			_camera.panAngle += (Application.MAIN_STAGE.mouseX - Application.MAIN_STAGE.stageWidth/2)/100;
			_camera.hover();
			
			_view.render();
		}
	}
}