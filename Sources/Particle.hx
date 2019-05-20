package;

import kha.Color;
import kha.System;
import kha.math.Vector2;

class Particle{
	public var pos: Vector2;
	var rays: Array<Ray>;
	var heading:Float = 0;

	public function new(){
		this.pos = new Vector2(System.windowWidth()/2, System.windowHeight()/2);
		this.rays = [];
		var a = 0.0;
		while (a < 70.0){
			a += 0.1;
			this.rays.push(new Ray(this.pos, a*Math.PI/180.0));
		}
	}

	public function updateParticle(x: Float, y: Float){
		this.pos.x = x;
		this.pos.y = y;
	}

	public function look(walls: Array<Boundary>, g2: kha.graphics2.Graphics){
		var scene = [];
		for (i in 0...this.rays.length){
			var ray = this.rays[i];
			var closest = null;
			var record = Math.POSITIVE_INFINITY;
			for (wall in walls){
				var pt = ray.castwall(wall);
				if (pt != null){
					var d: Float = Math.sqrt(Math.pow((this.pos.x - pt.x), 2) + Math.pow((this.pos.y - pt.y), 2));
					var a = Math.atan2(ray.dir.y, ray.dir.x) - this.heading;
					d *= Math.cos(a*Math.PI/180.0);
					if (d < record){
						record = d;
						closest = pt;
					}
				}
			}
			if (closest != null){
				g2.drawLine(this.pos.x, this.pos.y, closest.x, closest.y);
			}
			scene[i] = record;
		}
		return scene;
	}

	public function rotate(angle: Float){
		this.heading += angle;
		var index = 0;
		var a = 0.0;
		while (a < 70.0){
			a += 0.1;
			this.rays[index].setAngle((a*Math.PI/180.0) + this.heading);
			index++;
		}
	}

	public function move(amount: Float){
		var vel = new Vector2(1 * Math.cos(this.heading), 1 * Math.sin(this.heading));
		vel.normalize();
		vel.x *= amount;
		vel.y *= amount;
		this.pos.x += vel.x;
		this.pos.y += vel.y;
	}

	public function show(g2: kha.graphics2.Graphics){
		for (ray in this.rays){
			ray.show(g2);
		}
	}
}