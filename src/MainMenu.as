package 
{
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.Draw;
	import net.flashpunk.World;
	
	/**
	 * ...
	 * @author Carvell Scott
	 */
	public class MainMenu extends World 
	{
		private var summary:Text = new Text("");
		private var selection:int = 0;
		public function MainMenu() 
		{
			super();
			
		}
		public static function create():MainMenu {
			var retWorld:MainMenu = new MainMenu;
			return retWorld;
		}
		override public function update():void {
			updateSummary(selection);
		}
		private function updateSummary(selection:int):void {
			summary.lock();
			summary.text = "Main Menu: (work in progress)\nF1 for Overworld\nF2 for BattleWorld\nF3 to go back to previous.";
			summary.unlock();
		}
		override public function render():void {
			Draw.graphic(summary, FP.camera.x, FP.camera.y + 32);
			super.render();
		}	
	}

}