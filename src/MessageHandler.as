package 
{
	import flash.utils.Dictionary;
	import flash.utils.getQualifiedClassName;
	/**
	 * ...
	 * @author Carvell Scott
	 */
	public class MessageHandler implements MessageHandlerComponent
	{
		// messageHandlerPool is meant to be an abstraction for the internet. Probably needs to be its own class...
			
		private static var messageHandlerPool:Dictionary = new Dictionary();
		private static var nextID:uint = 0;
		private var id:String = "";

		private var messageQueue:Vector.<Message> = new Vector.<Message>;
		public function MessageHandler() 
		{
			setID();
		}
		public final function getMessageHandler():MessageHandler {
			// Just keeping the interface implementation happy....
			return this;
		}
		public static function sendMessage(handler:MessageHandlerComponent, msg:Message):void {
			// ...SO I CAN DO THIS
			if (handler && handler.getMessageHandler())
				handler.getMessageHandler().receiveMessage(msg);
		}
		public static function create():MessageHandler {
			var mh:MessageHandler = new MessageHandler;
			return mh;
		}
		private final function setID():MessageHandler {
			id = nextID.toString();
			messageHandlerPool[id] = this;
			nextID++;
			return this;
		}
		public final function getID():String {
			return id;
		}
		public static function getMessageHandlerByID(id:String):MessageHandler {
			if (id.length) {
				return messageHandlerPool[id];
			}
			return null;
		}
		// Message transfer
		public static function sendMesssageToID(id:String, msg:Message):void {
			var messageHandler:MessageHandler = getMessageHandlerByID(id);
			messageHandler.receiveMessage(msg);
		}
		private function receiveMessage(msg:Message):void {
			trace(this, "rcv:" + msg);
			messageQueue.push(msg);
		}
		// Message processing
		private function checkMessages():void {
			while (messageQueue.length > 0) {
				var msg:Message = messageQueue.shift();
				processMessage(msg);
			}
		}
		public final function update():void {
			checkMessages();
		}
		protected function processMessage(msg:Message):void {
			// forwarding to secondary message handlers can occur here.
		}
		public function toString():String {
			return getQualifiedClassName(this) + " " + id;
		}
	}

}