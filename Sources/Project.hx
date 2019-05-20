package;

import kha.Color;
import haxe.ds.Map;
import kha.System;
import kha.Framebuffer;

class Project {

	var walls:Array<Boundary> = [];
	var ray: Ray;
	var particle: Particle;
	var width = System.windowWidth();
	var height = System.windowHeight()/2;

	var mouse = Input.getMouse();
	var kb = Input.getKeyboard();

	public var col = Color.White;

	public function new() {
		for (i in 0...5){
			var x1 = Math.random() * width;
			var x2 = Math.random() * width;
			var y1 = Math.random() * height;
			var y2 = Math.random() * height;
			walls[i] = new Boundary(x1, y1, x2, y2);
		}
		walls.push(new Boundary(0, 0, width, 0));
		walls.push(new Boundary(width, 0, width, height));
		walls.push(new Boundary(width, height, 0, height));
		walls.push(new Boundary(0, height, 0, 0));
		particle = new Particle();
	}

	public function update():Void {

		if (kb.onDown("w") || kb.onDown("up")) particle.move(1.0);
		else if (kb.onDown("s")|| kb.onDown("down")) particle.move(-1.0);

		if (kb.onDown("a")|| kb.onDown("left")) particle.rotate(-0.1);
		else if (kb.onDown("d")|| kb.onDown("right")) particle.rotate(0.1);
	}

	public function render(framebuffer:Framebuffer):Void {
		var g2 = framebuffer.g2;
		g2.begin();
		for (wall in walls){
			wall.show(g2);
		}
		particle.show(g2);
		var scene = particle.look(walls, g2);
		var w = width / scene.length;
		for (i in 0...scene.length){
			var sq = scene[i] * scene[i];
			var wSq = width * width;
			var b = map(sq, 0, wSq, 255, 0);
			var h = map(scene[i], 0, width, height, 0);
			g2.color = Color.fromBytes(Std.int(b), Std.int(b), Std.int(b));
			g2.fillRect(i * w, height*2, w + 1, -h);
			g2.color = Color.White;
		}
		g2.end();
	}

	public function map(n: Float, start1: Float, stop1: Float, start2: Float, stop2: Float, ?withinBounds:Bool = false){
		var newval = (n - start1) / (stop1 - start1) * (stop2 - start2) + start2;

		if (!withinBounds){
			return newval;
		}
		if (start2 < stop2){
			return Math.max(Math.min(newval, stop2), start2);
		}else {
			return Math.max(Math.min(newval, start2), stop2);
		}

	}
}