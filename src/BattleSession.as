package 
{
	/**
	 * ...
	 * @author Carvell Scott
	 */
	public class BattleSession implements BattleController
	{
		private var battleData:Battle;
		private var messageHandler:MessageHandler = new MessageHandler;
		public function BattleSession() 
		{
			
		}
		public function update():void {
			messageHandler.checkMessages(dontLetThisBecomeExcrypt);
		}
		private function broadcastChanges():void {
			
		}
		public function getMessageHandler():MessageHandler {
			return messageHandler;
		}
		private function dontLetThisBecomeExcrypt(message:BattleMessage):void {
			
		}
	}

}