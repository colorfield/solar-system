package org.sse.solarsystem{
	import away3d.containers.View3D;
	import away3d.events.MouseEvent3D;
	import away3d.lights.PointLight3D;
	import away3d.materials.BitmapMaterial;
	import away3d.materials.WhiteShadingBitmapMaterial;
	import away3d.primitives.Cube;
	import away3d.primitives.Sphere;
	
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.filters.BitmapFilter;
	import flash.filters.BitmapFilterQuality;
	import flash.filters.BitmapFilterType;
	import flash.filters.GlowFilter;
	import flash.geom.Point;
	import flash.utils.Timer;
	
	/**
	 * Animation du soleil se basant sur l'algorithme de Perlin
	 */
	public class SunPerlinNoise extends Sprite
	{
		
		private static const ROTATION_SPEED:Number = 0.8;
		private static const N_OCTAVES:int = 10;
		
		private static const OFFSET0_X_DELTA:Number = .9;
		private static const OFFSET0_Y_DELTA:Number = 16;
		private static const OFFSET1_X_DELTA:Number = 16;
		private static const OFFSET1_Y_DELTA:Number = .9;
		
		private static const SPHERE_N_SEGMENTS:int = 32;
		private static const SPHERE_RADIUS:int = 250;
		
		private static const BITMAPDATA_SIZE:int = 400;
		private static const PERLINNOISE_BASE:int = 200;
		
		private var view:View3D;
		private var sphere:Sphere;
		
		private var bmp:BitmapData;
		
		private var offset0:Point = new Point();
		private var offset1:Point = new Point();
		
		private var timer:Timer;
		
		public function SunPerlinNoise()
		{
			
			addEventListener(Event.REMOVED_FROM_STAGE, onRemovedFromStage);
			
			// intégration d'un Cercle via un Sprite (2D)
			var s:Sprite = new Sprite();
			s.graphics.lineStyle();
			s.graphics.beginFill(0xff6600);
			s.graphics.drawCircle(400,300,235);
			s.graphics.endFill();
			
			view = new View3D();
			
			// positionnement du point de fuite au "centre"
			view.x = 400;
			view.y = 300;
			addChild(view);
			
			// rendu à chaque frame
			addEventListener(Event.ENTER_FRAME, onEnterFrame, false, 0, true);
			
			// material
			//bmp = new BitmapData(200,200);
			// paramètres de BitmapData : width, height, transparence, fillColor
			bmp = new BitmapData(BITMAPDATA_SIZE,BITMAPDATA_SIZE,false);
			
			// paramètres de la méthode perlinNoise : 
			// baseX:Number, baseY:Number, numOctaves:uint, randomSeed:int,
			// stitch:Boolean, fractalNoise:Boolean, channelOptions:uint = 7, 
			// grayScale:Boolean = false, offsets:Array = null)
			bmp.perlinNoise(PERLINNOISE_BASE,PERLINNOISE_BASE,N_OCTAVES,Math.random(),
				true,true,2,true);
			
			
			var mat:BitmapMaterial = new BitmapMaterial(bmp);
			mat.smooth = true;
			
			// sphere (3D)
			sphere = new Sphere();
			sphere.radius = SPHERE_RADIUS;
			sphere.segmentsW = SPHERE_N_SEGMENTS;
			sphere.segmentsH = SPHERE_N_SEGMENTS;
			
			// si on souhaite que le material soit illuminé
			//sphere.material = new WhiteShadingBitmapMaterial(bmp);
			sphere.material = new BitmapMaterial(bmp);
			
			//sphere.alpha = 0.8;
			//sphere.blendMode
			sphere.x = 0;
			sphere.y = 0;
			view.scene.addChild(sphere);
			
			/*
			// lumière, si on veut "éclairer le soleil"
			// pour moduler le rendu
			var light:PointLight3D = new PointLight3D();
			light.y = 500;
			view.scene.addLight(light);
			*/
			
			// filtres, sont utilisés pour l'atmosphère
			var sunFilters:Array = new Array()
				
			var gf1:GlowFilter = new GlowFilter(0xffffbe, 1, 12, 12, 3, 3, false, false);
			var gf2:GlowFilter = new GlowFilter(0xffffbe, 1, 12, 12, 3, 3, true, false);
			sunFilters.push(gf1,gf2);
				
			sphere.ownCanvas=true; // => pourrait alors utiliser blendMode
			sphere.filters=sunFilters;
		
			
			/* ------- Documentation sur les BlendMode
			var blendMode_dp:Array = new Array();
			blendMode_dp.push({data:"add", label:"add"});
			blendMode_dp.push({data:"alpha", label:"alpha"});
			blendMode_dp.push({data:"darken", label:"darken"});&nbsp;&nbsp; 
			blendMode_dp.push({data:"difference", label:"difference"});&nbsp;&nbsp; 
			blendMode_dp.push({data:"erase", label:"erase"});
			blendMode_dp.push({data:"hardlight", label:"hardlight"});
			blendMode_dp.push({data:"invert", label:"invert"});
			blendMode_dp.push({data:"layer", label:"layer"});
			blendMode_dp.push({data:"lighten", label:"lighten"});
			blendMode_dp.push({data:"multiply", label:"multiply"});
			blendMode_dp.push({data:"normal", label:"normal"});
			blendMode_dp.push({data:"overlay", label:"overlay"});
			blendMode_dp.push({data:"screen", label:"screen"});
			blendMode_dp.push({data:"subtract", label:"subtract"});
			*/
			
			//s.blendMode = "difference";
			s.blendMode = "add";
			addChild(s);
			
			// désynchronisation de l'animation PerlinNoise 
			// par rapport à la frameRate
			timer = new Timer(50);
			timer.addEventListener(TimerEvent.TIMER, onTimer, false, 0, true);
			timer.start();
			
		}
		
		
		private function onRemovedFromStage(e:Event):void{
			
			removeEventListener(Event.REMOVED_FROM_STAGE, onRemovedFromStage);
			removeEventListener(Event.ENTER_FRAME, onEnterFrame);
			timer.removeEventListener(TimerEvent.TIMER, onTimer);
			
		}
		
		// dissociation de onEnterFrame, sinon le rendu est trop rapide
		private function onTimer(e:TimerEvent):void{
			offset0.y +=  OFFSET0_Y_DELTA;
			offset0.x +=  OFFSET0_X_DELTA;
			offset1.y -=  OFFSET1_Y_DELTA;
			offset1.x -=  OFFSET1_X_DELTA;
			
			bmp.perlinNoise(PERLINNOISE_BASE, PERLINNOISE_BASE, 
							N_OCTAVES, Math.random(), true, false, 2, true, [offset0, offset1]);
		}
		
		private function onEnterFrame(e:Event):void
		{
			sphere.rotationY += ROTATION_SPEED;
			view.render();
		}	
		
	}
}