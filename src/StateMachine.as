package 
{
	/**
	 * ...
	 * @author Carvell Scott
	 */
	public class StateMachine 
	{
		private var stateStack:Vector.<State> = new Vector.<State>;
		public function StateMachine() 
		{
			
		}
		public final function getState():State {
			if (stateStack.length < 1) {
				return null;
			}
			return stateStack[stateStack.length - 1];
		}
		public final function changeState(nextState:State):void {
			State.onExit(getState())
			if (stateStack.length < 1) {
				stateStack.push(nextState);
			}
			else
				stateStack[stateStack.length - 1] = nextState;
			State.onEnter(nextState);
		}
		public final function pushState(nextState:State):void {
			State.onExit(getState());
			stateStack.push(nextState);
			State.onEnter(nextState);
		}
		public final function popState():void {
			State.onExit(getState());
			stateStack.pop();
		}
	}

}