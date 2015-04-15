package  
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.geom.Point;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	/**
	 * ...
	 * @author Carvell Scott
	 */
	public class GameCharacter extends Entity
	{
		public static const
			IDLEDN:String = "idledn",
			IDLEUP:String = "idleup",
			IDLELF:String = "idlelf",
			IDLERT:String = "idlert",
			WALKDN:String = "walkdn",
			WALKUP:String = "walkup",
			WALKLF:String = "walklf",
			WALKRT:String = "walkrt";
		protected var 
		loadedBitmapData:BitmapData,
		sprite:Spritemap,
		charName:String,
		facingDirection:uint = 0;
		public var statSpeed:uint = 3
		public function GameCharacter() 
		{
			graphic = sprite;
			setHitbox(32, 24, 16, 24);
		}
		override public function update():void {
			if(Controller.horizontal != 0 || Controller.vertical != 0){
				var movementAngle:Number = FP.angle(0, 0, Controller.horizontal, Controller.vertical);
				switch(facingDirection = int((movementAngle / 360) * 4)) {
					case 0:
						moveBy(statSpeed, 0, "solid");
						playAnim(WALKRT);
						break;
					case 1:
						moveBy(0, -statSpeed, "solid");
						playAnim(WALKUP);
						break;
					case 2:
						moveBy(-statSpeed, 0, "solid");
						playAnim(WALKLF);
						break;
					case 3:
						moveBy(0, statSpeed, "solid");
						playAnim(WALKDN);
						break;
				}
			}
			else
				switch(facingDirection) {
					case 0:
						playAnim(IDLERT); break;
					case 1:
						playAnim(IDLEUP); break;
					case 2:
						playAnim(IDLELF); break;
					case 3:
						playAnim(IDLEDN); break;
				}
			x = FP.clamp(x, 0, FP.width - width);
			y = FP.clamp(y, 0, FP.height - height);
			layer = FP.height - y;
		}
		public function playAnim(state:String = null):void {
			if (sprite) {
				sprite.play(state);
			}
		}
		
	}

}