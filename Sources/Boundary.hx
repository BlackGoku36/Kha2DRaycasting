package;

import kha.math.Vector2;

class Boundary{
	public var a: Vector2;
	public var b: Vector2;

	public function new(x1: Float, y1: Float, x2: Float, y2: Float){
		this.a = new Vector2(x1, y1);
		this.b = new Vector2(x2, y2);
	}

	public function show(g2: kha.graphics2.Graphics): Void {
		g2.drawLine(this.a.x, this.a.y, this.b.x, this.b.y);
	}
}