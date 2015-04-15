package utils  {
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.net.URLRequest;
	/**
	 * ...
	 * @author Carvell Scott
	 */
	public class ResourceKeeper {
		public function ResourceKeeper() {
			
		}
		public static function loadBitmapFrom(filename:String, notification:Function):void {
			var dataLoader:Loader = new Loader();
			function onCompletion(e:Event):void {
				var bmp:Bitmap = dataLoader.content as Bitmap;
				notification(bmp.bitmapData);
				dataLoader.unload();
			}
			dataLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, onCompletion);
			dataLoader.load(new URLRequest(filename));
		}
	}
}