package  
{
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	/**
	 * ...
	 * @author Carvell Scott
	 */
	public class InputTranslator 
	{
		public static const
			MOVEMENT_RT:int = Key.RIGHT,
			MOVEMENT_LF:int = Key.LEFT,
			MOVEMENT_UP:int = Key.UP,
			MOVEMENT_DN:int = Key.DOWN;
		public function InputTranslator() 
		{
			
		}
		
		public static function get horizontal():int {
			return int(Input.check(MOVEMENT_RT)) - int(Input.check(MOVEMENT_LF));
		}
		public static function get vertical():int {
			return int(Input.check(MOVEMENT_DN)) - int(Input.check(MOVEMENT_UP));
		}
	}

}