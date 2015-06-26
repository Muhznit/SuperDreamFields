package 
{
	/**
	 * ...
	 * @author Carvell Scott
	 */
	public class BattleMessageHandler extends MessageHandler 
	{
		private var parent:BattleSession;
		public function BattleMessageHandler() 
		{
			super();
			
		}
		public static function create(parent:BattleSession):BattleMessageHandler {
			var bmh:BattleMessageHandler = new BattleMessageHandler;
			bmh.parent = parent;
			return bmh;
		}
		override protected function processMessage(msg:Message):void {
			if (msg.getCommand() == "status") {
				changeBattleStatus(msg);
			}
		}
		// Example function.
		protected function changeBattleStatus(message:Message):void {
			if (message.getText().indexOf("status") > -1) {
				parent.getBattleModel().status = message.getText();
			}
		}
	}

}