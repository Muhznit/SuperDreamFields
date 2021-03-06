package  
{
	import enums.EFruitType;
	import flash.display.BitmapData;
	import flash.geom.Point;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.Draw;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import utils.ResourceKeeper;
	/**
	 * ...
	 * @author Carvell Scott
	 */
	public class CharacterReve extends GameCharacter
	{	
		private var 
		reveStates:Array = ["umbrella", "normal", "busty"],
		currReveState:String = "umbrella";
		
		public var currCharge:int = 0;
		private var maxCharge:int = 0;
		
		private var lastReveState:String = "normal";
		
		public function CharacterReve() 
		{
			ResourceKeeper.loadBitmapFrom("img/reve/spritesheet.png", initializeSpriteAndAdd);
		}
		private function initializeSpriteAndAdd(b:BitmapData):void {
			maxCharge = Global.dayLength;
			sprite = new Spritemap(b, 64, 64);
			for (var i:int = 0; i < reveStates.length; i++) {
				var currSpriteGroup:uint = i * 12;
				sprite.add("idledn" + reveStates[i], [currSpriteGroup], 10);
				sprite.add("idleup" + reveStates[i], [currSpriteGroup + 3], 10);
				sprite.add("idlelf" + reveStates[i], [currSpriteGroup + 6], 10);
				sprite.add("idlert" + reveStates[i], [currSpriteGroup  + 9], 10);
				sprite.add("walkdn" + reveStates[i], [currSpriteGroup, currSpriteGroup + 1, currSpriteGroup, currSpriteGroup + 2], 10);
				sprite.add("walkup" + reveStates[i], [currSpriteGroup + 3, currSpriteGroup + 4, currSpriteGroup + 3, currSpriteGroup + 5], 10);
				sprite.add("walklf" + reveStates[i], [currSpriteGroup + 6, currSpriteGroup + 7, currSpriteGroup + 6, currSpriteGroup + 8], 10);
				sprite.add("walkrt" + reveStates[i], [currSpriteGroup + 9, currSpriteGroup + 10, currSpriteGroup + 9, currSpriteGroup + 11], 10);
			}
			sprite.x = -32;
			sprite.y = -64;
			graphic = new Graphiclist(sprite);
			charName = "Reve";
			this.name = charName = "Reve";
			facingDirection = 3;
			FP.world.add(this);
			trace("Reve initialized!");
		}
		override public function update():void {
			var quarterCharge:int = maxCharge / 4;
			var halfMaxCharge:int = maxCharge / 2;
			
			if (currReveState != "umbrella") {
				var sunlightAdded:int = FP.lerp( -5, 5, Global.sunshineAvailable);
				if (Input.pressed(Key.S))
					sunlightAdded = maxCharge;
				currCharge = FP.clamp(currCharge + sunlightAdded, 0, halfMaxCharge);
			}
			
			if (currReveState == "busty") {
				statSpeed = 1;
			}
			else
				statSpeed = Input.check(Key.SHIFT) ? 6 : 3;
				
			if (currCharge > quarterCharge && !Global.sfwMode){
				currReveState = "busty";
			}
			else {
				if (currReveState == "busty"){
					currReveState = lastReveState;
				}
			}
			if (Input.pressed(Key.X)) {
				trace(currReveState, currCharge);
				if (currReveState != "busty")				
					if (currReveState == "umbrella")
						currReveState = "normal";
					else
						currReveState = "umbrella";
			}
			if (Input.pressed(Key.Z)) {
				if (currCharge > quarterCharge) {
					plantTree(EFruitType.APPLE);
				}
				else {
					plantTree(EFruitType.BANANA);
				}
				currCharge = 0;
				
			}
			super.update();
		}
		private function plantTree(fruitkind:EFruitType):void {
			var treeCoords:Point = new Point(x, y);
			var gridSize:int = Global.GRIDSIZE;
			switch(facingDirection) {
				case 0: treeCoords.x += gridSize + width; break;
				case 1: treeCoords.y -= gridSize + height; break;
				case 2: treeCoords.x -= gridSize + width; break;
				case 3: treeCoords.y += gridSize + height; break;
				default:
					trace("Wait, how are you not facing any direction?");
			}
			
			// Snap the tree's coordinates to the grid.
			treeCoords.x /= gridSize;
			treeCoords.x *= gridSize;
			treeCoords.y /= gridSize;
			treeCoords.y *= gridSize;
			
			// Actually create the tree
			var tree:Tree = FP.world.create(Tree, true) as Tree;
			if (tree) {
				tree.x = treeCoords.x;
				tree.y = treeCoords.y;
				tree.init(fruitkind);
			}
		}
		override public function playAnim(state:String = null):void {
			if(sprite)
				sprite.play(state + currReveState);
		}
		override public function render():void {
			if(sprite == null)
				Draw.hitbox(this);
			//Draw.circle(x, y, 5);
			Draw.rect(FP.world.camera.x, FP.world.camera.y + 480 - textGraphic.height, 640, textGraphic.height, 0x000000, .5);
			var tool:String = currReveState == "umbrella" ? "Umbrella" : "Invisible tree planting device";
			textGraphic.text = "Sunlight: " + currCharge + "\t\tTime: " + Global.timeOfDay + "\t\tTool:" + tool + "\nArrow keys: Move. X: Switch tools. Z: Make plants";
			textGraphic.updateTextBuffer();
			textGraphic.color = 0xFFFFFF;
			textGraphic.alpha = 1;
			Draw.graphic(textGraphic, FP.world.camera.x, FP.world.camera.y + 480 - textGraphic.height);
			super.render();
		}
		
	}

}