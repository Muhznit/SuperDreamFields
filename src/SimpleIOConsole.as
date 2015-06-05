package 
{
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	/**
	 * ...
	 * @author Carvell Scott
	 */
	public class SimpleIOConsole 
	{
		private var enteredText:String;
		private var state:Function = null;
		public var messageHandler:MessageHandler;
		public function SimpleIOConsole() 
		{
			
		}
		public function exec():void {
			if (state == null)
				state = state_ready;
			state = state();
		}
		private function state_ready():Function {
			if (Input.pressed(Key.ENTER)) {
				enteredText = "";
				Input.keyString = "";
				return state_input;
			}
			return state_ready;
		}
		private function state_input():Function {
			enteredText = Input.keyString;
			FP.console.log(enteredText);
			if (Input.pressed(Key.ENTER)) {
				return state_output;
			}
			return state_input;
		}
		private function state_output():Function {
			forward(enteredText);
			enteredText = "";
			return state_ready;
		}
		public function provideMessageHandler(messageHandler:MessageHandler):SimpleIOConsole {
			this.messageHandler = messageHandler;
			return this;
		}
		private function forward(message:String):String {
			var answer:String = message;
			if (messageHandler)
				messageHandler.recieveMessage(BattleMessage.createFrom(message));
			trace(message);
			return answer;
		}
	}

}