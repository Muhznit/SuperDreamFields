package 
{
	import mx.utils.StringUtil;
	/**
	 * ...
	 * @author Carvell Scott
	 */
	public class Message 
	{
		// I'll probably have a bunch of subclasses that extend from this thing. This should be a subclass sandbox if possible.
		private var text:String = "";
		private var format:String = "";
		private var sender:String = "";
		private var reciever:String = ""; //Should be able to specify one or more sessions, a criteria of battlers in those sessions.
		private var command:String = ""; //One word used to control the finite state machine that executes whatever command.
		private var params:String = ""; //Parameters for the command in JSON format.
		public function Message() 
		{
			
		}
		public static function createFrom(input:String):Message {
			var bm:Message = new Message;
			bm.text = input;
			bm.parse(input);
			return bm;
		}
		private function parse(input:String):Message {
			var firstSplit:int = input.indexOf(" ");
			command = input.slice(0, firstSplit);
			params = input.slice(firstSplit);
			return this;
		}
		public function getSender():String {
			return sender;
		}
		private function getReciever():String {
			return reciever;
		}
		public function getFormat():String {
			return format;
		}
		public function getCommand():String {
			return command;
		}
		public function getText():String {
			return text;
		}
		public function toString():String {
			return getText();
		}
	}

}