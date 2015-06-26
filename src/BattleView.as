package 
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Text;
	/**
	 * ...
	 * @author Carvell Scott
	 */
	public class BattleView 
	{
		private var parent:BattleMVC;
		public function BattleView() 
		{
			
		}
		public static function create(parent:BattleMVC):BattleView {
			var bv:BattleView = new BattleView;
			bv.parent = parent;
			return bv;
		}
		protected function getBattle():BattleModel {
			return parent.getBattleModel();
		}
		public function describe():String {
			var battle:BattleModel = getBattle();
			return battle.toString();
		}
	}

}