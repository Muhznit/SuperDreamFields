package 
{
	/**
	 * ...
	 * @author Carvell Scott
	 */
	public class BattleModel 
	{
		private var parent:BattleMVC;
		public var status:String = "blue!";
		// need a list of battlers
		public function BattleModel() 
		{
			
		}
		public static function create(parent:BattleMVC):BattleModel {
			var bm:BattleModel = new BattleModel;
			bm.parent = parent;
			return bm;
		}
		public function toString():String {
			return status;
		}
	}
}