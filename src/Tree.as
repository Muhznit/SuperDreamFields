package  {
	import enums.EFruitType;
	import flash.display.BitmapData;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.Mask;
	import net.flashpunk.utils.Draw;
	import utils.ResourceKeeper;
	
	/**
	 * ...
	 * @author Carvell Scott
	 */
	public class Tree extends Entity {
		private static var
		treeBitmapData:BitmapData;
		private var 
		sprite:Spritemap,
		species:EFruitType,
		life:uint = 0,
		fullyGrown:uint = Global.dayLength * 7;
		
		
		public function Tree(x:Number = 0, y:Number = 0) {
			layer = FP.height - y;
			super(x, y);
		}
		public function init(species:EFruitType):Entity {
			this.species = species;
			if(treeBitmapData == null)
				ResourceKeeper.loadBitmapFrom("img/terrain/trees.png", loadedSprites);
			else
				loadedSprites(treeBitmapData);
			return this;
		}
		public function loadedSprites(b:BitmapData):void {
			if(treeBitmapData == null) treeBitmapData = b;
			sprite = new Spritemap(b, 64, 128);
			sprite.originX = 32;
			sprite.originY = 128;
			sprite.scale = .5;
			this.type = "solid";
			setHitbox(16, 16, 8, 16);
			graphic = sprite;
		}
		private function setSpecies(fruitKind:EFruitType):void {
			if (!sprite)
				return;
			switch (fruitKind) {
				case EFruitType.APPLE:
					sprite.setFrame(1); break;
				case EFruitType.BANANA:
					sprite.setFrame(0); break;
				default:
					sprite.visible = false;
			}
		}
		private function interactWithReve(reve:CharacterReve = null):void {
			// I don't like this.
			if (reve == null) {
				var reves:Vector.<CharacterReve> = new Vector.<CharacterReve>;
				world.getClass(CharacterReve, reves);
				for each(var reve:CharacterReve in reves) {
					interactWithReve(reve);
				}
			}
			var dist:Number = FP.distance(x, y, reve.x, reve.y);
			var amtSunAbsorbed:int = FP.lerp(20, 0, dist / 64);
			if (dist <= 64 && reve.currCharge > amtSunAbsorbed) {
				reve.currCharge -= amtSunAbsorbed;
				life += 4 * amtSunAbsorbed;
			}
		}
		override public function update():void {
			var sunlightAdded:int = FP.lerp(0, 10, Global.sunshineAvailable);
			
			interactWithReve();
			life = Math.min(fullyGrown, life + sunlightAdded);
			if(sprite)
				sprite.scale = FP.lerp(.5, 1, life / fullyGrown);
			super.update();
		}
		
	}

}