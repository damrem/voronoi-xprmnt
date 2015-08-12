package;
import as3.TypeDefs.Point;
import as3.TypeDefs.Vector;
import com.nodename.delaunay.Edge;
import com.nodename.geom.LineSegment;
import hxlpers.Rnd;
import hxlpers.shapes.PolygonShape;
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
			//trace("edge="+edge);
			//trace("leftVertex="+edge.leftVertex);
			//trace("coord="+edge.leftVertex.coord);
			if (edge.leftSite != null)
			{
				//trace(edge.leftSite.coord);
			}
			
			if (edge.leftSite != null && edge.rightSite != null/* && edge.leftSite.coord!=null&&edge.rightVertex.coord!=null*/)
			{
				//trace(edge.leftSite.);
				var line = new SegmentShape({x:edge.leftSite.x, y:edge.leftSite.y}, {x:edge.rightSite.x, y:edge.rightSite.y});
				line.graphics.lineStyle(1, 0xff0000);
				line.draw();
				addChild(line);
			}
		}
	}
	
	public function drawHull()
	{
		var hull:LineSegment;
		for (hull in logicalMap.voronoi.hull())
		{
			//trace("hull="+hull);
			
				var line = new SegmentShape(hull.p0, hull.p1);
				line.graphics.lineStyle(5, 0x00ff00);
				line.draw();
				addChild(line);
		}
	}
	
	
	public function drawRegions()
	{
		var region:Vector<as3.TypeDefs.Point>;
		trace(logicalMap.voronoi.regions());
		for (region in logicalMap.voronoi.regions())
		{
			var regionAsArray = new Array<openfl.geom.Point>();
			trace("region="+region);
			var p:Point;
			for (p in region) {
				regionAsArray.push(new openfl.geom.Point(p.x, p.y));
			}
			
			var poly = new PolygonShape(regionAsArray);
			poly.graphics.beginFill(Rnd.int(0x000000, 0xffffff));
			poly.draw();
			addChild(poly);
		}
			
		
			
	}
	
}