package hxlpers.shapes;

import flash.display.Shape;

/**
 * ...
 * @author damrem
 */
class RectShape extends Shape
{

	public function new(Width:Float = 10.0, Height:Float = 10.0, FillColor:UInt = 0xff0000, Thickness:Float=0.0, StrokeColor:UInt=0x000000, centered:Bool=false) 
	{
		super();
		draw(Width, Height, FillColor, Thickness, StrokeColor);
	}
	
	public function draw(Width:Float = 10.0, Height:Float = 10, FillColor:UInt = 0xff0000, Thickness:Float=0.0, StrokeColor:UInt=0x000000, centered:Bool=false)
	{
		//graphics.clear();
		if (Thickness > 0)
		{
			graphics.lineStyle(Thickness, StrokeColor);
		}
		graphics.beginFill(FillColor);
		graphics.drawRect(centered? -Width / 2:0, centered? -Height / 2:0, Width, Height);
		graphics.endFill();
	}
	
}