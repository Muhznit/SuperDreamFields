package  
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Draw;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.World;
	/**
	 * ...
	 * @author Carvell Scott
	 */
	public class Overworld extends World
	{
		public static const WORLDWIDTH:int = 1024;
		public static const WORLDHEIGHT:int = 1024;
		
		private var time:uint = 0;
		private var dayLength:uint = 3600;
		public function Overworld() 
		{
			
		}
		public static function create():Overworld {
			var ow:Overworld = new Overworld;
			ow.init();
			return ow;
		}
		public function addReve():void {
			var playerCharacter:GameCharacter = GameCharacter.create();
			playerCharacter.name = "playerCharacter";
			add(playerCharacter);
			playerCharacter.x = FP.halfWidth;
			playerCharacter.y = FP.halfHeight;
		}
		private function init():Overworld {
			trace("Terrain Initialized");
			add(new Terrain());
			addReve();
			return this;
		}
		private function updateTime():void {
			// Increment the time
			time = (time + 1) % dayLength;
			if (time % (dayLength / 6) == 0)
				trace(timeOfDay(this));
		}
		public function getNormalizedTime():Number {
			return time / dayLength;
		}
		public static function timeOfDay(world:Overworld):String {
			var times:Array = ["Midnight", "Dawn", "Day", "Noon", "Dusk", "Night"];
			return times[int((world.time / world.dayLength) * times.length)];
		}
		public static function sunshineAvailable(world:Overworld):Number {
			var ret:Number = Math.sin(world.getNormalizedTime() * Math.PI);
			return ret;
		}
		private static function updateCamera(cameraFocus:GameCharacter):void {
			if (cameraFocus == null)
				return;
			FP.camera.x = FP.clamp(cameraFocus.x - FP.screen.width/2, 0, WORLDWIDTH - FP.screen.width);
			FP.camera.y = FP.clamp(cameraFocus.y - FP.screen.height/2, 0, WORLDHEIGHT - FP.screen.height);
		}
		override public function update():void {
			updateTime();
			updateCamera(getInstance("playerCharacter"));
			super.update();
		}
		
	}

}