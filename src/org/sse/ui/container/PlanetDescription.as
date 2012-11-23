package org.sse.ui.container
{
	import away3d.containers.View3D;
	import away3d.core.utils.Cast;
	import away3d.events.MouseEvent3D;
	import away3d.lights.PointLight3D;
	import away3d.materials.BitmapMaterial;
	import away3d.materials.WhiteShadingBitmapMaterial;
	import away3d.primitives.Cube;
	import away3d.primitives.Sphere;
	
	import flash.display.Sprite;
	import flash.events.Event;

	/**
	 * TEST UNITAIRE
	 * Création d'une planète (texture et animation)
	 */
	public class PlanetDescription extends Sprite
	{
		
		// TODO : passer la texture en paramètre
		/*
		[Embed(source="../../../../assets/images/textures/sphere/mars_1k_color.jpg")]
		private var TextureMars:Class;
		private var mMars:BitmapMaterial = new BitmapMaterial(Cast.bitmap(TextureMars));
		*/
		
		private static const ROTATION_SPEED:Number = 0.5;
		
		private var view:View3D;
		private var sphere:Sphere;
		
		
		public function PlanetDescription()
		{
			
		}
		
		private function createPlanets():void{
			
			sphere = new Sphere();
			sphere.segmentsW = 32;
			sphere.segmentsH = 32;
			//sphere.x = -200;
			//sphere.y = 200; // !! espace de coordonnées inversé d'Away3D
			//var marsBmp:Bitmap = new TextureMars() as Bitmap;
			//var marsMat:BitmapMaterial = new BitmapMaterial(marsBmp.bitmapData);
			//sphere.material = mMars.bitmapData;
			//sphere.material = mMars;
			
			view = new View3D();
			
			// positionnement du point de fuite au centre
			//view.x = Application.MAIN_STAGE.stageWidth/2;
			//view.y = Application.MAIN_STAGE.stageHeight/2;
			view.x = stage.stageWidth/2;
			view.y = stage.stageHeight/2;
			
			addChild(view);
			view.scene.addChild(sphere);
			
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		
		private function onEnterFrame(e:Event):void
		{
			sphere.rotationY += ROTATION_SPEED;
			view.render();
		}	
		
	}
}