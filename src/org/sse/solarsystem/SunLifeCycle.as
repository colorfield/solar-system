package org.sse.solarsystem
{
	
	import away3d.materials.WireColorMaterial;
	import away3d.primitives.Cube;
	import away3d.primitives.Plane;
	import away3d.primitives.Sphere;
	import org.sse.ui.setup3d.BasicAway3D;
	
	/**
	 * Premier essai d'intégration avec une définition propre
	 * d'une classe Away3D, sur base de l'exemple fournit
	 * par l'API de Papervision3D (qui propose une classe BasicView3D).
	 * Ce concept étant inexistant en Away3D, il a été recréé ici
	 * pour l'exemple, vu son aspect pratique.
	 */
	public class SunLifeCycle extends BasicAway3D
	{
		public function SunLifeCycle()
		{
			
		}
		
		protected override function _createScene():void
		{
			// création du material par défaut
			var mat:WireColorMaterial = new WireColorMaterial(0xcccccc);
			
			//------------- SPHERE
			var sphere:Sphere = new Sphere();
			sphere.radius = 50;
			sphere.material = mat;
			_view.scene.addChild(sphere);
			
			sphere.segmentsW = 24;
			sphere.segmentsH = 12;
		}
	}
}