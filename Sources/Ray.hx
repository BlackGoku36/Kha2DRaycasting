package;

import kha.math.Vector2;

class Ray{
	var pos:Vector2 = new Vector2();
	var dir:Vector2 = new Vector2();

	public function new(pos: Vector2, angle: Float){
		this.pos = pos;
		this.dir = new Vector2(1 * Math.cos(angle), 1 * Math.sin(angle));
	}

	public function lookAt(x: Float, y: Float){
		this.dir.x = x - this.pos.x;
		this.dir.y = y - this.pos.y;

		this.dir.normalize();
	}
	
	public function show(g2: kha.graphics2.Graphics): Void {
		//g2.translate(this.pos.x, this.pos.y);
		g2.drawLine(0, 0, this.dir.x * 10, this.dir.y * 10);
	}

	public function castwall(wall:Boundary): Vector2{
		var x1 = wall.a.x;
		var y1 = wall.a.y;
		var x2 = wall.b.x;
		var y2 = wall.b.y;

		var x3 = this.pos.x;
    	var y3 = this.pos.y;
    	var x4 = this.pos.x + this.dir.x;
		var y4 = this.pos.y + this.dir.y;

		var den: Float = (x1 - x2) * (y3 - y4) - (y1 - y2) * (x3 - x4);
    	if (den == 0) {
      		return null;
		}

		var t = ((x1 - x3) * (y3 - y4) - (y1 - y3) * (x3 - x4)) / den;
		var u = -((x1 - x2) * (y1 - y3) - (y1 - y2) * (x1 - x3)) / den;
		if (t > 0 && t < 1 && u > 0) {
			var pt = new Vector2();
			pt.x = x1 + t * (x2 - x1);
			pt.y = y1 + t * (y2 - y1);
			return pt;
		} else {
			return null;
		}
	}

}