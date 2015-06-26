package 
{
	import flash.utils.Dictionary;
	/**
	 * BattlerData is kind of the prototype for whatever instance of a battler. Even party members. Typically only party members will have setStat called to readjust their stats, but there's typically only one of those anyway...
	 * ...
	 * @author Carvell Scott
	 */
	public class BattlerData 
	{
		private var stats:Dictionary = new Dictionary;
		public function BattlerData() 
		{
			
		}
		public static function create():BattlerData {
			var bd:BattlerData = new BattlerData;
			return bd;
		}
		private function getStat(id:String):int {
			return stats[id];
		}
		private function setStat(id:String, value:int):BattlerData {
			stats[id] = value;
		}
		
	}

}