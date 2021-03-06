package worlds 
{
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.Draw;
	import net.flashpunk.World;
	
	/**
	 * ...
	 * @author Carvell Scott
	 */
	public class BattleWorld extends World
	{
		private var session:BattleSession;
		private var summary:Text = new Text("");
		public function BattleWorld() 
		{
			super();
		}
		public static function create(bs:BattleSession):BattleWorld {
			var retWorld:BattleWorld = new BattleWorld;
			retWorld.session = bs;
			return retWorld;
		}
		override public function update():void {
			updateSummary(session.getBattleView().describe());
		}
		private function updateSummary(s:String):void {
			summary.lock();
			summary.text = s;
			summary.unlock();
		}
		override public function render():void {
			Draw.graphic(summary, FP.camera.x, FP.camera.y + 32);
			super.render();
		}
	}

}