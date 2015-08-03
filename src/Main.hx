package;

import hxlpers.Rnd;
import hxlpers.shapes.PolygonShape;
import hxlpers.shapes.RectShape;
import hxlpers.shapes.SegmentShape;
import openfl.display.Bitmap;
import openfl.display.Shape;
import openfl.display.Sprite;
import openfl.geom.Point;
import openfl.text.TextField;
import openfl.text.TextFieldAutoSize;
import voronoimap.Map;

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
		
		var map = new Map( { width:640, height:480 } );
		
		map.go0PlacePoints(42);
		map.go1ImprovePoints(1);
		for (i in 0...map.points.length)
		{
			//trace(map.points[i]);
			var dot = new RectShape(1, 1, 0xffff00, 0, 0, true);
			dot.x = map.points[i].x;
			dot.y = map.points[i].y;
			//addChild(dot);
		}
		
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
				
				
				/*
				var m = border.midpoint;
				if (m != null)
				{
					var mShape = new RectShape(1, 1, 0xffff00);
					var tf = new TextField();
					tf.background = true;
					tf.backgroundColor = color;
					tf.autoSize = TextFieldAutoSize.LEFT;
					tf.text = "" + k;
					tf.x=mShape.x = m.x;
					tf.y = mShape.y = m.y;
					trace(tf.width);
					tf.x -= tf.width / 2;
					tf.y -= tf.height / 2;
					addChild(tf);
				}
				*/
				
				
				
				
			}
			
			
			
			
		}
		
		
		//addChild(createDelaunay(map));
		addChild(createVoronoi(map));
		
	}
	
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

}
