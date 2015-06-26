package 
{
	import net.flashpunk.World;
	/**
	 * ...
	 * @author Carvell Scott
	 */
	public class WorldStack 
	{
		private var worlds:Vector.<World> = new Vector.<World>;
		public function WorldStack() 
		{
			
		}
		public function push(w:World):void {
			worlds.push(w);
			
		}
		public function pop():World {
			if (worlds.length == 1) {
				trace("Bottom floor, bro. No worlds to pop.");
				return peek();
			}
			return worlds.pop();
		}
		public function peek():World {
			return worlds[worlds.length - 1];
		}
	}

}