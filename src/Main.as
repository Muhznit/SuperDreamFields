package
{
	import flash.display.Loader;
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	import utils.ResourceKeeper;
	
	/**
	 * ...
	 * @author Carvell Scott
	 */
	public class Main extends Engine
	{
		private var simpleConsole:SimpleIOConsole = new SimpleIOConsole;
		private var bs:BattleSession = new BattleSession;
		public function Main()
		{
			super(640, 480, 60, false);
			FP.console.enable();
			FP.world = new Overworld().init();
			simpleConsole.provideMessageHandler(bs.getMessageHandler());
			
		}
		override public function init():void
		{
			trace("FlashPunk has started successfully!");
		}
		override public function update():void {
			simpleConsole.exec();
			super.update();
		}
	}
}