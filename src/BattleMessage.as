package 
{
	/**
	 * ...
	 * @author Carvell Scott
	 */
	public class BattleMessage 
	{
		private var text:String = "";
		private var target:String = ""; //Should be able to specify one or more sessions, a criteria of battlers in those sessions.
		private var command:String = ""; //One word used to control the finite state machine that executes whatever command.
		public function BattleMessage() 
		{
			
		}
		public static function createFrom(input:String):BattleMessage {
			var bm:BattleMessage = new BattleMessage;
			bm.text = input;
			return bm;
		}
		private function parseCommand(input:String):BattleMessage {
			return this;
		}
	}

}