package worlds 
{
	import net.flashpunk.World;
	
	/**
	 * ...
	 * @author Carvell Scott
	 */
	public class BattleWorld extends World implements BattleController
	{
		private var battleData:Battle;
		private var messageHandler:MessageHandler = new MessageHandler;
		public function BattleWorld() 
		{
			super();
			
		}
		override public function update():void {
			messageHandler.checkMessages();
		}
		public function getMessageHandler():MessageHandler {
			return messageHandler;
		}
		
	}

}