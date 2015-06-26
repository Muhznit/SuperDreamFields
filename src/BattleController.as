package 
{
	/**
	 * ...
	 * @author Carvell Scott
	 */
	public class BattleController
	{
		private var parent:BattleMVC;
		public function BattleController() 
		{
			
		}
		public static function create(parent:BattleMVC):BattleController {
			var bc:BattleController = new BattleController;
			bc.parent = parent;
			return bc;
		}
		public function getBattleModel():BattleModel {
			return parent.getBattleModel();
		}
	}

}