package;

import kha.System;
import kha.Framebuffer;

class Project {

	var walls = [];
	var ray: Ray;
	var particle: Particle;
	var width = System.windowWidth();
	var height = System.windowHeight();

	var mouse = Input.getMouse();

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
		particle.updateParticle(mouse.x, mouse.y);	
	}

	public function render(framebuffer:Framebuffer):Void {
		var g2 = framebuffer.g2;
		g2.begin();
		for (wall in walls){
			wall.show(g2);
		}
		particle.show(g2);
		particle.look(walls, g2);
		g2.end();
	}
}