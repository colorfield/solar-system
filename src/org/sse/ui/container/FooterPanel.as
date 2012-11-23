package org.sse.ui.container
{
	import flash.display.MovieClip;

	/** 
	 * Le FooterPanel permettra à terme de proposer des contrôles contextuels
	 * à l'application (p.ex. si voyage dans le système solaire, montre la position courante
	 * et permet de se rendre d'une planète à une autre, ...)
	 * 
	 * A cet effet, il n'agit que comme un conteneur et donc 
	 * pratiquement comme une Factory, pour peu qu'il fasse les vérifications 
	 * de l'interface de l'objet passé lorsqu'on fait un setContent
	 */
	public class FooterPanel extends MovieClip
	{
		public function FooterPanel()
		{
		}
	}
}