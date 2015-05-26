package  
{
	import flash.display.BitmapData;
	import flash.geom.Point;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.TiledImage;
	import net.flashpunk.graphics.Tilemap;
	import net.flashpunk.masks.Grid;
	import utils.ResourceKeeper;
	/**
	 * ...
	 * @author Carvell Scott
	 */
	public class Terrain extends Entity
	{
		public static const
			FIELDWIDTH:uint = 32,
			FIELDHEIGHT:uint = 32;
		public var
			blueprints:BitmapData,
			map:BitmapData,
			collisionMap:Image,
			tiles:Tilemap,
			backtiles:TiledImage,
			coords:Point = new Point(0, 0),
			terrainGraphic:Graphiclist = new Graphiclist();
			grid:Grid;
		
		public function Terrain() 
		{
			ResourceKeeper.loadBitmapFrom("img/terrain/spring_field.png", loadedTerrain);
			
		}
		private function loadedTerrain(b:BitmapData):void {
			tiles = new Tilemap(b, FIELDWIDTH * Global.GRIDSIZE, FIELDHEIGHT * Global.GRIDSIZE, Global.GRIDSIZE / 2, Global.GRIDSIZE / 2); 
			terrainGraphic.add(terrainPlz());
			graphic = terrainGraphic;
			layer = int.MAX_VALUE;
			FP.world.add(this);
			return;
		}
		public function terrainPlz():Tilemap {
			blueprints = new BitmapData(FIELDWIDTH, FIELDHEIGHT, false);
			var noiseA:BitmapData = new BitmapData(FIELDWIDTH, FIELDHEIGHT, false);
			var scale:int = 16;
			
			noiseA.perlinNoise(FIELDWIDTH * scale, FIELDHEIGHT * scale, 4, Math.random() * 0xFFFFFFFF, true, false, 7, true);
			for (var i:int = 0; i < FIELDWIDTH; i++) {
				for (var j:int = 0; j < FIELDHEIGHT; j++) {
					if (noiseA.getPixel(i, j) / 0xFFFFFF < 1/4) {
						blueprints.setPixel(i, j, 0x000000);
					}
				}
			}
			for (var c:int = 0; c < FIELDWIDTH; c++) {
				for (var r:uint = 0; r < FIELDHEIGHT; r++) {
					autoTile(c, r);
				}
			}
			return tiles;
		}
		private function isDirt(x:uint, y:uint):int {
			return (blueprints.getPixel(x, y) / 0xFFFFFF);
		}
		private function autoTile(col:uint, row:uint):void {
			var i:uint = 0, j:uint = 0, style:uint = 0;
			var subcol:uint = col * 2, subrow:uint = row * 2;
			var spaceOccupied:int = isDirt(col, row);
			for (i = 0; i < 2; i++){
				for (j = 0; j < 2; j++) {
					var tile:int = -1;
					var index:uint = 0, hor:int, ver:int;
					hor = (i == 0) ? -1 : 1;
					ver = (j == 0) ? -1 : 1;
					if(spaceOccupied){
						index = (2 * isDirt(col + hor, row)) + isDirt(col, row + ver);
						index += int(index == 3) * isDirt(col + hor, row + ver);
						index += 1;
					}
					index += int(hor > 0) * 6;
					index += int(ver > 0) * 12;
					
					tile = index;
					tiles.setTile(subcol + i, subrow + j, tile + (style * 20));
				}
			}
		}
		override public function update():void {
			//tiles.blend = backtiles.blend = BlendMode.MULTIPLY;
			var currentTimeColor:uint = FP.colorLerp(0x8080FF, 0xFFFFFF, Global.sunshineAvailable);
			if(tiles){
				tiles.color = currentTimeColor;
				//backtiles.color = currentTimeColor;
			}
			super.update();
		}
	}

}