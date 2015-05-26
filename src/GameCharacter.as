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
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.Draw;
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
		textGraphic:Text = new Text("Just some placeholder text..."),
		facingDirection:uint = 0;
		public var statSpeed:uint = 3;
		public function GameCharacter() 
		{
			graphic = sprite;
			setHitbox(32, 24, 16, 24);
		}
		public function getCartesianDirectionFromCoords(x:int, y:int):Number {
			var movementAngle:Number = FP.angle(0, 0, x, y);
			return int((movementAngle / 360) * 4);
		}
		public function convertCartesianDirectionToString(direction:int):String {
			switch (direction) {
				case 0:
					return "rt";
				case 1:
					return "dn";
				case 2:
					return "lf";
				case 3:
					return "up";
				default:
					return "";
			}
		}
		override public function update():void {
			var playerRequestedMove:Boolean = Controller.horizontal != 0 || Controller.vertical != 0;
			var animationName:String = "idle";
			if (playerRequestedMove) {
				facingDirection = getCartesianDirectionFromCoords( Controller.horizontal, Controller.vertical);
				animationName = "walk";
			}
			if(playerRequestedMove){
				switch(facingDirection) {
					case 0:
						moveBy(statSpeed, 0, "solid"); break;
					case 1:
						moveBy(0, -statSpeed, "solid"); break;
					case 2:
						moveBy(-statSpeed, 0, "solid"); break;
					case 3:
						moveBy(0, statSpeed, "solid"); break;
				}
			}
			animationName += convertCartesianDirectionToString(facingDirection);
			playAnim(animationName);
			x = FP.clamp(x, 0, Overworld.WORLDWIDTH - width);
			y = FP.clamp(y, 0, Overworld.WORLDHEIGHT - height);
			layer = FP.height - y;
			super.update();
		}
		public function playAnim(state:String = null):void {
			if (sprite) {
				sprite.play(state);
			}
		}
		override public function render():void {
			Draw.hitbox(this);
			super.render();
		}
		
	}

}