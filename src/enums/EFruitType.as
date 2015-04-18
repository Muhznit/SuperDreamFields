package enums 
{
	/**
	 * ...
	 * @author Carvell Scott
	 */
	public class EFruitType 
	{
		public static const APPLE:EFruitType = new EFruitType;
		public static const BANANA:EFruitType = new EFruitType;
		public static const PAINIPPLE:EFruitType = new EFruitType;
		public function EFruitType() 
		{
			
		}
		public function toString():String {
			switch (this) {
				case APPLE: return "apple";
				case BANANA: return "banana";
				case PAINIPPLE: return "painipple";
				default: return "mysteryfruit";
			}
		}
	}

}