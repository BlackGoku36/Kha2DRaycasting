package;

import kha.input.KeyCode;
import kha.input.Keyboard;
import kha.input.Mouse;

class Input{
	static var mouse: UMouse;

	public static function getMouse():UMouse{
		if (mouse == null) mouse = new UMouse();
		return mouse;
	}

}

class UMouse{
	var buttons = ['left', 'right', 'middle'];
	var buttonsDown = new Map<String, Bool>();

	public var x = 0;
	public var y = 0;
	public var movementX = 0.0;
	public var movementY = 0.0;
	public var lastX = -1.0;
	public var lastY = -1.0;
	public var didMove = false;
	public var wheelDelta = 0;

	public function new(){
		kha.input.Mouse.get().notify(downListener, upListener, moveListner, wheelListener);
	}

	public function onMouseDown(button: String){
		return buttonsDown.get(button);
	}

	public static function buttonCode(button: Int): String{
		if (button == 0) return "left";
		else if (button ==1) return "right";
		else return "middle";
	}
	function downListener(button: Int, x: Int, y: Int):Void{
		var b = buttonCode(button);
		this.x = x;
		this.y = y;
		buttonsDown.set(b, true);
	}

	function upListener(button: Int, x: Int, y: Int):Void{
		var b = buttonCode(button);
		this.x = x;
		this.y = y;
		buttonsDown.set(b, false);
	}

	function moveListner(x: Int, y: Int, movementX: Int, movementY: Int): Void{
		if (lastX == -1.0 && lastY == -1.0){
			lastX = x;
			lastY = y;
		}
		this.movementX += x-lastX;
		this.movementY += y-lastY;

		lastX = x;
		lastY = y;
		this.x = x;
		this.y = y;

		didMove = true;
	}

	function wheelListener(delta: Int){
		wheelDelta = delta;
	}
}