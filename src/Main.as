package
{
	import flash.display.Loader;
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	import utils.ResourceKeeper;
	
	/**
	 * ...
	 * @author Carvell Scott
	 */
	public class Main extends Engine
	{
		public function Main()
		{
			var bwah:int = 0;
			super(640, 480, 60, false);
			Global.getGlobal();
		}
		override public function init():void
		{
			trace("FlashPunk has started successfully!");
			
		}
	}
}