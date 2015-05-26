package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.World;
	/**
	 * ...
	 * @author Carvell Scott
	 */
	public class Global extends Entity
	{
		public static const
			GRIDSIZE:uint = 32,
			HALFGRIDSIZE:uint = GRIDSIZE / 2,
			sfwMode:Boolean = false;
		
		public function Global() 
		{
		}
		// Time
		public static function get timeOfDay():String {
			return Overworld.timeOfDay(FP.world as Overworld);
		}
		public static function get sunshineAvailable():Number {
			return Overworld.sunshineAvailable(FP.world as Overworld);
		}
		
		
	}

}