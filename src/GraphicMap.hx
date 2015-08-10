package;
import com.nodename.delaunay.Edge;
import hxlpers.shapes.SegmentShape;
import openfl.display.Sprite;

/**
 * ...
 * @author damrem
 */
class GraphicMap extends Sprite
{
	var logicalMap:LogicalMap;

	public function new(logicalMap:LogicalMap) 
	{
		super();
		this.logicalMap = logicalMap;
		
	}
	public function drawEdges()
	{
		var edge:Edge;
		for (edge in logicalMap.voronoi.edges())
		{
			trace("edge="+edge);
			trace("leftVertex="+edge.leftVertex);
			trace("coord="+edge.leftVertex.coord);
			
			if (edge.leftVertex != null && edge.rightVertex != null)
			{
				var line = new SegmentShape(edge.leftVertex.coord, edge.rightVertex.coord);
				line.graphics.lineStyle(1, 0xff0000);
				line.draw();
				addChild(line);
			}
		}
	}
	
}