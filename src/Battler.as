package 
{
	/**
	 * Battlers are an ephemeral class meant to wrap BattlerData and provide "effective" stats that take all buffs into account.
	 * @author Carvell Scott
	 */
	public class Battler 
	{
		private var battlerData:BattlerData;
		private var remainingHP:int = 0;
		
		public function Battler() 
		{
			
		}
		public static function create():Battler {
			var b:Battler = new Battler;
			return b;
		}
		
		
	}

}