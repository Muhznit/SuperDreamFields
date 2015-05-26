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
		private var sm:ConsoleControllerStateMachine = new ConsoleControllerStateMachine;
		public function Main()
		{
			super(640, 480, 60, false);
			FP.console.enable();
			FP.world = new Overworld().init();
			sm.changeState(sm.CONSOLEREADY);
			
		}
		override public function init():void
		{
			trace("FlashPunk has started successfully!");
		}
		override public function update():void {
			//ConsoleController.getInstance().update();
			sm.exec();

			super.update();
		}
	}
}