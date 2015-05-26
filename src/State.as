package 
{
	import flash.utils.getQualifiedClassName;
	import flash.utils.getQualifiedSuperclassName;
	/**
	 * ...
	 * @author Carvell Scott
	 */
	public class State
	{
		public function State() {
			
		}
		public static function onEnter(state:State):void {
			if (!state) {
				return;
			}
			state.delagatedOnEnter();
		}
		public static function onExit(state:State):void {
			if (!state) {
				return;
			}
			state.delegatedOnExit();
		}
		protected function delagatedOnEnter():void {
			trace("entering state", this);
		}
		protected function delegatedOnExit():void {
			trace("exiting state", this);
		}
		public function toString():String {
			var qualified:String = getQualifiedClassName(this);
			var splitQualified:Array = qualified.split("::");
			if (splitQualified.length > 1)
				return splitQualified[splitQualified.length - 1];
			return qualified;
		}
	}

}