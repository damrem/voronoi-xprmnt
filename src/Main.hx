package;

//import hxlpers.Rnd;
//import hxlpers.shapes.PolygonShape;
import hxlpers.shapes.RectShape;
//import hxlpers.shapes.SegmentShape;
//import openfl.display.Bitmap;
//import openfl.display.Shape;
import openfl.display.Sprite;
//import openfl.geom.Point;
//import openfl.text.TextField;
//import openfl.text.TextFieldAutoSize;

/**
 * ...
 * @author damrem
 */
class Main extends Sprite 
{

	public function new() 
	{
		super();
		
		// Assets:
		//var bmp = addChild(new Bitmap(openfl.Assets.getBitmapData("img/favicon.png")));
		//trace(bmp);
		//var tf = new TextField
		
		var logicalMap = new LogicalMap( 42, { width:640, height:480 } );
		logicalMap.improveRandomPoints(1);
		
		/*
		map.go0PlacePoints(42);
		map.go1ImprovePoints(1);
		*/
		for (p in logicalMap.points)
		{
			//trace(p);
			//trace(map.points[i]);
			var dot = new RectShape(1, 1, 0xffff00, 0, 0, true);
			dot.x = p.x;
			dot.y = p.y;
			addChild(dot);
		}
		
		logicalMap.buildGraph();
		
		var graphicMap = new GraphicMap(logicalMap);
		graphicMap.drawEdges();
		addChild(graphicMap);
		
		
		
		/*
		map.go2BuildGraph();
		
		var centers = map.centers;
		
		for (i in 0...centers.length)
		{
			var center = centers[i];
			var corners = new Array<Point>();
			var color = Rnd.int(0, 0xffffff);
			for (j in 0...center.corners.length)
			{
				var corner = center.corners[j];
				corners.push(new Point(corner.point.x, corner.point.y));
			}
			
			var polygonShape = new PolygonShape(corners);
			polygonShape.graphics.beginFill(color);
			polygonShape.draw();
			polygonShape.graphics.endFill();
			addChild(polygonShape);
			
			
			
			for (k in 0...center.borders.length)
			{
				var border = center.borders[k];
				
				
				
				
				
				
				
			}
			
			
			
			
		}
		
		
		//addChild(createDelaunay(map));
		addChild(createVoronoi(map));
		*/
	}
	
	
	/*
	function createDelaunay(map:Map):Sprite
	{
		var delaunay = new Sprite();
		for (center in map.centers)
		{
			for (border in center.borders)
			{
				var d0 = border.d0;
				var d1 = border.d1;
				
				if (d0 != null && d1 != null)
				{
					var d0p = new Point(d0.point.x, d0.point.y);
					var d1p = new Point(d1.point.x, d1.point.y);
					var dSegmentShape = new SegmentShape(d0p, d1p);
					dSegmentShape.graphics.lineStyle(1, 0xff0000, 0.25);
					dSegmentShape.draw();
					delaunay.addChild(dSegmentShape);
				}
			}
		}
		return delaunay;
	}
	
	function createVoronoi(map:Map):Sprite
	{
		var voronoi = new Sprite();
		for (center in map.centers)
		{
			for (border in center.borders)
			{
				var v0 = border.v0;
				var v1 = border.v1;
				
				if (v0 != null && v1 != null)
				{
					var v0p = new Point(v0.point.x, v0.point.y);
					var v1p = new Point(v1.point.x, v1.point.y);
					var vSegmentShape = new SegmentShape(v0p, v1p);
					vSegmentShape.graphics.lineStyle(1, 0xff0000, 0.25);
					vSegmentShape.draw();
					voronoi.addChild(vSegmentShape);
				}
			}
		}
		return voronoi;
	}
	*/
}
