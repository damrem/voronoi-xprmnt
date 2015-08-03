package hxlpers;
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.geom.Matrix;
import openfl.Assets;

/**
 * ...
 * @author damrem
 */
class Bmp
{
	public static var PATH:String = "assets/img/";
	
	static public function createBmd(id:String, flipped:Bool = false):BitmapData
	{
		var bmd = Assets.getBitmapData(Bmp.PATH + id);
		
		if (flipped)
		{
			bmd = flip(bmd);
		}
		return bmd;
	}
	
	static public function createBmp(id:String, flipped:Bool = false):Bitmap
	{
		var bm = new Bitmap(createBmd(id, flipped));
		
		return bm;
	}
	
	/**
	 * http://stackoverflow.com/questions/7773488/flipping-a-bitmap-horizontally
	 * @param	original
	 * @param	axis
	 * @return
	 */
	static public function flip(original:BitmapData, ?axis:Axis):BitmapData
	{
		if (axis == null)
		{
			axis = X;
		}
		var flipped:BitmapData = new BitmapData(original.width, original.height, true, 0);
		var matrix:Matrix;
		switch(axis)
		{
			case X:
				matrix = new Matrix( -1, 0, 0, 1, original.width, 0);
			case Y:
				matrix = new Matrix( 1, 0, 0, -1, 0, original.height);
		}
		flipped.draw(original, matrix, null, null, null, true);
		return flipped;
	}
}


enum Axis 
{
	X;
	Y;
}