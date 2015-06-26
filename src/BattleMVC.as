package 
{
	
	/**
	 * ...
	 * @author Carvell Scott
	 */
	public interface BattleMVC 
	{
		function getBattleController():BattleController;
		function getBattleView():BattleView;
		function getBattleModel():BattleModel;
	}
	
}