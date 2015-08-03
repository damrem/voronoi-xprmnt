package;
import openfl.geom.Point;
import voronoimap.graph.Center;

/**
 * ...
 * @author damrem
 */
class Cell extends PolygonShape
{
	var _center:Center;
	public function new(vertices:Array<Point>, center:Center) 
	{
		super(vertices);
		_center = center;
	}
	
	public function getNeighbours():Array<Cell>
	{
		return
	}
}