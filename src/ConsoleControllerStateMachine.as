package 
{
	/**
	 * ...
	 * @author Carvell Scott
	 */
	public class ConsoleControllerStateMachine extends StateMachine 
	{
		public var enteredText:String = "";
		public function ConsoleControllerStateMachine() 
		{
			super();
			
		}
		public function get CONSOLEREADY():ConsoleReady {
			return ConsoleReady.INSTANCE;
		}
		public function get CONSOLEINPUT():ConsoleInput {
			return ConsoleInput.INSTANCE;
		}
		public function get CONSOLEOUTPUT():ConsoleOutput {
			return ConsoleOutput.INSTANCE;
		}
		public function exec():void {
			var currState:ConsoleStateInterface = getState() as ConsoleStateInterface;
			if (currState != null) {
				currState.exec(this);
			}
		}
		
	}

}
interface ConsoleStateInterface 
{
	function exec(stateMachine:ConsoleControllerStateMachine):void;
}
import net.flashpunk.FP;
import net.flashpunk.utils.Input;
import net.flashpunk.utils.Key;
class ConsoleReady extends State implements ConsoleStateInterface {
	public static const INSTANCE:ConsoleReady = new ConsoleReady;
	public function ConsoleReady() {
		//super();
	}
	public function exec(stateMachine:ConsoleControllerStateMachine):void {
		if (Input.pressed(Key.ENTER)) {
			stateMachine.enteredText = "";
			Input.keyString = "";
			stateMachine.changeState(ConsoleInput.INSTANCE);
		}
	}
}
class ConsoleInput extends State implements ConsoleStateInterface {
	public static const INSTANCE:ConsoleInput = new ConsoleInput;
	public function ConsoleInput() {
		//super();
	}
	public function exec(stateMachine:ConsoleControllerStateMachine):void {
		stateMachine.enteredText = Input.keyString;
		FP.console.log(stateMachine.enteredText);
		if (Input.pressed(Key.ENTER)) {
			stateMachine.changeState(ConsoleOutput.INSTANCE);
		}
	}
}
class ConsoleOutput extends State implements ConsoleStateInterface {
	public static const INSTANCE:ConsoleOutput = new ConsoleOutput;
	public function ConsoleOutput() {
		//super();		
	}
	public function exec(stateMachine:ConsoleControllerStateMachine):void {
		trace("Console producing output!");
		trace(stateMachine.enteredText);
		stateMachine.enteredText = "";
		stateMachine.changeState(ConsoleReady.INSTANCE);
	}

}