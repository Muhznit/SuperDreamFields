package 
{
	/**
	 * ...
	 * @author Carvell Scott
	 */
	public class BattleSession implements MessageHandlerComponent, BattleMVC
	{
		private var battleData:BattleModel;
		private var battleController:BattleController;
		private var battleView:BattleView;
		private var messageHandler:BattleMessageHandler; // Meant to recieve messages from console.
		
		public function BattleSession() 
		{
			
		}
		public static function create():BattleSession {
			var bs:BattleSession = new BattleSession;
			bs.battleData = BattleModel.create(bs);
			bs.battleView = BattleView.create(bs);
			bs.battleController = BattleController.create(bs);
			bs.messageHandler = BattleMessageHandler.create(bs);
			return bs;
		}
		public function update():void {
			messageHandler.update();
		}
		public function getMessageHandler():MessageHandler {
			return messageHandler;
		}
		public function getBattleController():BattleController {
			return battleController;
		}
		public function getBattleView():BattleView {
			return battleView;
		}
		public function getBattleModel():BattleModel {
			return battleData;
		}
	}
}