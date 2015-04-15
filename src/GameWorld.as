package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Draw;
	import net.flashpunk.World;
	/**
	 * ...
	 * @author Carvell Scott
	 */
	public class GameWorld extends World
	{
		public function GameWorld() 
		{
			
		}
		public static function restart():void {
			FP.world.removeAll();
			var nextWorld:GameWorld = new GameWorld();
			FP.world = nextWorld;
			nextWorld.init();
			
			
		}
		public function init():void {
			add(Global.getGlobal());
			new Terrain();
		}
		
	}

}