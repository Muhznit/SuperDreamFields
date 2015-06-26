package
{
	import flash.display.Loader;
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import utils.ResourceKeeper;
	import worlds.BattleWorld;
	
	/**
	 * ...
	 * @author Carvell Scott
	 */
	public class Main extends Engine
	{
		private var simpleConsole:SimpleIOConsole = new SimpleIOConsole;
		private var bs:BattleSession = BattleSession.create();
		private var ws:WorldStack = new WorldStack;
		public function Main()
		{
			super(640, 480, 60, false);
			FP.console.enable();
			ws.push(MainMenu.create());
			FP.world = ws.peek();
			simpleConsole.provideMessageHandler(bs.getMessageHandler());
			
		}
		override public function init():void
		{
			trace("FlashPunk has started successfully!");
		}
		override public function update():void {
			if (Input.pressed(Key.F1)) {
				ws.push(Overworld.create());
			}
			if (Input.pressed(Key.F2)) {
				ws.push(BattleWorld.create(bs));
			}
			if (Input.pressed(Key.F3)) {
				ws.pop();
			}
			if (FP.world != ws.peek()) {
				FP.world = ws.peek();
			}
			
			// Simple console is meant to serve as just a non-gui method of controlling a battle 
			simpleConsole.exec();
			bs.update();
			super.update();
		}
	}
}