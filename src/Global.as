package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	/**
	 * ...
	 * @author Carvell Scott
	 */
	public class Global extends Entity
	{
		public static const
			GRIDSIZE:uint = 32,
			sfwMode:Boolean = false;
			
		private static var deity:Global;
		private var playerCharacter:GameCharacter;
		private static var time:uint = 0;
		
		
		public static const dayLength:uint = 3600;
		
		public function Global() 
		{
			deity = this;
			FP.width = 1024;
			FP.height = 1024;
			GameWorld.restart();
		}
		public static function getGlobal():Global {
			if (!deity)
				deity = new Global;
			return deity;
		}
		override public function update():void {
			updateTime();
			updateCamera(playerCharacter);
			if (Input.pressed(Key.DELETE)) {
				GameWorld.restart();
			}
			super.update();
		}
		override public function added():void {
			playerCharacter = new CharacterReve();
			playerCharacter.x = FP.halfWidth;
			playerCharacter.y = FP.halfHeight;
		}
		private static function updateCamera(cameraFocus:GameCharacter):void {
			if (cameraFocus == null)
				return;
			FP.camera.x = FP.clamp(cameraFocus.x - FP.screen.width/2, 0, FP.width - 640);
			FP.camera.y = FP.clamp(cameraFocus.y - FP.screen.height/2, 0, FP.height - 480);
		}
		// Time
		private function updateTime():void {
			time = (time + 1) % dayLength;
			if (time % (dayLength / 6) == 0)
				trace(timeOfDay);
		}
		public static function get timeOfDay():String {
			var times:Array = ["Midnight", "Dawn", "Day", "Noon", "Dusk", "Night"];
			return times[int((time / dayLength) * times.length)];
		}
		public static function get sunshineAvailable():Number {
			return Math.abs(Math.sin((time / dayLength) * Math.PI));
		}
		
		
	}

}