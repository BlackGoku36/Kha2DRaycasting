package;

import kha.input.KeyCode;
import kha.input.Keyboard;
import kha.input.Mouse;

class Input{
	static var keyboard: UKeyBoard;
	static var mouse: UMouse;

	public static function getKeyboard():UKeyBoard {
		if (keyboard == null) keyboard = new UKeyBoard();
		return keyboard;
	}

	public static function getMouse():UMouse{
		if (mouse == null) mouse = new UMouse();
		return mouse;
	}

}

class UKeyBoard{
	static var keys = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'period', 'comma', 'space', 'backspace', 'tab', 'enter', 'shift', 'control', 'alt', 'escape', 'delete', 'back', 'up', 'right', 'left', 'down', 'f1', 'f2', 'f3', 'f4', 'f5', 'f6', 'f7', 'f8', 'f9', 'f10', 'f11', 'f12'];
	var keysDown = new Map<String, Bool>();

	public function new(){
		Keyboard.get().notify(downListener, upListener);
	}

	public function onDown(key: String):Bool{
		return keysDown.get(key);
	}

	public static function keyCode(key: kha.input.KeyCode):String {
		if (key == kha.input.KeyCode.Space) return "space";
		else if (key == kha.input.KeyCode.Backspace) return "backspace";
		else if (key == kha.input.KeyCode.Tab) return "tab";
		else if (key == kha.input.KeyCode.Return) return "enter";
		else if (key == kha.input.KeyCode.Shift) return "shift";
		else if (key == kha.input.KeyCode.Control) return "control";
		else if (key == kha.input.KeyCode.Alt) return "alt";
		else if (key == kha.input.KeyCode.Escape) return "escape";
		else if (key == kha.input.KeyCode.Delete) return "delete";
		else if (key == kha.input.KeyCode.Up) return "up";
		else if (key == kha.input.KeyCode.Down) return "down";
		else if (key == kha.input.KeyCode.Left) return "left";
		else if (key == kha.input.KeyCode.Right) return "right";
		else if (key == kha.input.KeyCode.Back) return "back";
		else if (key == kha.input.KeyCode.Comma) return "comma";
		else if (key == kha.input.KeyCode.Period) return "period";
		else if (key == kha.input.KeyCode.Colon) return ":";
		else if (key == kha.input.KeyCode.Semicolon) return ";";
		else if (key == kha.input.KeyCode.LessThan) return "<";
		else if (key == kha.input.KeyCode.Equals) return "=";
		else if (key == kha.input.KeyCode.GreaterThan) return ">";
		else if (key == kha.input.KeyCode.Add) return "+";
		else if (key == kha.input.KeyCode.Plus) return "+";
		else if (key == kha.input.KeyCode.Subtract) return "-";
		else if (key == kha.input.KeyCode.HyphenMinus) return "-";
		else if (key == kha.input.KeyCode.Zero) return "0";
		else if (key == kha.input.KeyCode.Numpad0) return "0";
		else if (key == kha.input.KeyCode.One) return "1";
		else if (key == kha.input.KeyCode.Numpad1) return "1";
		else if (key == kha.input.KeyCode.Two) return "2";
		else if (key == kha.input.KeyCode.Numpad2) return "2";
		else if (key == kha.input.KeyCode.Three) return "3";
		else if (key == kha.input.KeyCode.Numpad3) return "3";
		else if (key == kha.input.KeyCode.Four) return "4";
		else if (key == kha.input.KeyCode.Numpad4) return "4";
		else if (key == kha.input.KeyCode.Five) return "5";
		else if (key == kha.input.KeyCode.Numpad5) return "5";
		else if (key == kha.input.KeyCode.Six) return "6";
		else if (key == kha.input.KeyCode.Numpad6) return "6";
		else if (key == kha.input.KeyCode.Seven) return "7";
		else if (key == kha.input.KeyCode.Numpad7) return "7";
		else if (key == kha.input.KeyCode.Eight) return "8";
		else if (key == kha.input.KeyCode.Numpad8) return "8";
		else if (key == kha.input.KeyCode.Nine) return "9";
		else if (key == kha.input.KeyCode.Numpad9) return "9";
		else if (key == kha.input.KeyCode.F1) return "f1";
		else if (key == kha.input.KeyCode.F2) return "f2";
		else if (key == kha.input.KeyCode.F3) return "f3";
		else if (key == kha.input.KeyCode.F4) return "f4";
		else if (key == kha.input.KeyCode.F5) return "f5";
		else if (key == kha.input.KeyCode.F6) return "f6";
		else if (key == kha.input.KeyCode.F7) return "f7";
		else if (key == kha.input.KeyCode.F8) return "f8";
		else if (key == kha.input.KeyCode.F9) return "f9";
		else if (key == kha.input.KeyCode.F10) return "f10";
		else if (key == kha.input.KeyCode.F11) return "f11";
		else if (key == kha.input.KeyCode.F12) return "f12";
		else return String.fromCharCode(cast key).toLowerCase();
	}
	function downListener(key: KeyCode):Void{
		var k = keyCode(key);
		keysDown.set(k, true);
	}
	function upListener(key: KeyCode):Void{
		var k = keyCode(key);
		keysDown.set(k, false);
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