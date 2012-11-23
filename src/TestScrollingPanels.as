package
{
	
	import be.colorfield.ui.box.ScrollablePanelModel;
	import be.colorfield.ui.box.ScrollingPanels;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	
	import org.sse.ui.container.PlanetDescription;

	/**
	 * Exemple d'application cliente pour ScrollingPanels
	 */
	public class TestScrollingPanels extends MovieClip
	{
		
		public function TestScrollingPanels()
		{
			
			var sp:ScrollingPanels = new ScrollingPanels();
			
			var panels:Vector.<ScrollablePanelModel> = new Vector.<ScrollablePanelModel>;
			
			// le tout devrait être instancié dans une boucle, depuis un fichier XML
			// par concision, on donne un exemple de base
			var panel1:ScrollablePanelModel = new ScrollablePanelModel();
			panel1.setTitle("Test 1");
			panel1.setContent(new PlanetDescription());
			panels.push(panel1);
			
			var panel2:ScrollablePanelModel = new ScrollablePanelModel();
			panel2.setTitle("Test 2");
			panel2.setContent(new PlanetDescription());
			panels.push(panel2);
			
			var panel3:ScrollablePanelModel = new ScrollablePanelModel();
			panel3.setTitle("Test 3");
			panel3.setContent(new PlanetDescription());
			panels.push(panel3);
			
			
			sp.createPanels(panels);
			
			addChild(sp);
			
		}
	}
}