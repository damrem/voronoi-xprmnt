package hxlpers.shapes;
import as3.TypeDefs.Point;
import openfl.display.Shape;

/**
 * ...
 * @author damrem
 */
class SegmentShape extends Shape
{
	var point1:Point;
	var point2:Point;
	public function new(point1:Point, point2:Point) 
	{
		super();
		trace(point1, point2);
		this.point1 = point1;
		this.point2 = point2;
		
		//draw();
	}
	
	public function draw() 
	{
		//graphics.clear();
		graphics.moveTo(point1.x, point1.y);
		graphics.lineTo(point2.x, point2.y);
	}
	
	
}