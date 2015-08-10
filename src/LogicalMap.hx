package;
import as3.Rectangle;
import com.nodename.delaunay.Voronoi;
import de.polygonal.math.PM_PRNG;
import as3.TypeDefs;

import voronoimap.Size;

/**
 * ...
 * @author damrem
 */
class LogicalMap
{
	var _size:Size;
	public var points:Array<Point>;
	var mapRandom:PM_PRNG;
	public var voronoi:Voronoi;
	
	public function new(nbPoints, size:Size) 
	{
		_size = size;
		mapRandom = new PM_PRNG();
		points = generateRandomPoints(nbPoints);
	}
	
	/**
	 * Generate random points and assign them to be on the island or
	 * in the water. Some water points are inland lakes; others are
	 * ocean. We'll determine ocean later by looking at what's
	 * connected to ocean.
	 */
    public function generateRandomPoints( NUM_POINTS : Int ) : Array<Point> {
		var p:Point, i:Int, points:Array<Point> = new Array<Point>();
		for (i in 0...NUM_POINTS) {
			p = {x:mapRandom.nextDoubleRange(10, _size.width-10),
			y:mapRandom.nextDoubleRange(10, _size.height-10) };
			points.push(p);
		}
		return points;
	}
	
	 /**
     * Improve the random set of points with Lloyd Relaxation.
     */
    public function improveRandomPoints(numLloydIterations : Int ) : Void {
      // We'd really like to generate "blue noise". Algorithms:
      // 1. Poisson dart throwing: check each new point against all
      //     existing points, and reject it if it's too close.
      // 2. Start with a hexagonal grid and randomly perturb points.
      // 3. Lloyd Relaxation: move each point to the centroid of the
      //     generated Voronoi polygon, then generate Voronoi again.
      // 4. Use force-based layout algorithms to push points away.
      // 5. More at http://www.cs.virginia.edu/~gfx/pubs/antimony/
      // Option 3 is implemented here. If it's run for too many iterations,
      // it will turn into a grid, but convergence is very slow, and we only
      // run it a few times.
		var i:Int, p:Point, q:Point, voronoi:Voronoi, region:Vector<Point>;
		for (i in 0...numLloydIterations) {
			voronoi = new Voronoi(points, null, new Rectangle(0, 0, _size.width, _size.height));
			for (p in points) {
				region = voronoi.region(p);
				p.x = 0.0;
				p.y = 0.0;
				for (q in region) {
					p.x += q.x;
					p.y += q.y;
				}
				p.x /= region.length;
				p.y /= region.length;
				region.splice(0, region.length);
			}
			voronoi.dispose();
		}
	}
	
	
	/**
	 * Create a graph structure from the Voronoi edge list. The
     * methods in the Voronoi object are somewhat inconvenient for
     * my needs, so I transform that data into the data I actually
     * need: edges connected to the Delaunay triangles and the
     * Voronoi polygons, a reverse map from those four points back
     * to the edge, a map from these four points to the points
     * they connect to (both along the edge and crosswise).
	 */
	public function buildGraph() : Void {
	   voronoi = new Voronoi(points, null, new Rectangle(0, 0, _size.width, _size.height));
	   trace(voronoi.edges());
	   /*
		buildGraph(points, voronoi);
	   improveCorners();
	   voronoi.dispose();
	   voronoi = null;
	   points = null;
	   */
	}
	
	
}