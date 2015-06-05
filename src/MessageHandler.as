package 
{
	/**
	 * ...
	 * @author Carvell Scott
	 */
	public class MessageHandler 
	{
		private var messageQueue:Vector.<BattleMessage>;
		public function MessageHandler() 
		{
			
		}
		public function recieveMessage(msg:BattleMessage):void {
			trace("rcv:" + msg);
			messageQueue.push(msg);
		}
		public function checkMessages(callback:Function):void {
			while (messageQueue.length > 0) {
				var msg:BattleMessage = messageQueue.shift();
			}
		}
	}

}