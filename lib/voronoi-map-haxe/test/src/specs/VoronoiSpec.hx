package specs;

import as3.NumberCore;
import as3.Rectangle;
import as3.TypeDefs;
import co.janicek.core.math.RandomCore;
import com.nodename.delaunay.Site;
import com.nodename.delaunay.Voronoi;
import jasmine.J;

using co.janicek.core.math.RandomCore;
using as3.PointCore;

class VoronoiSpec {

	public function new() {
		J.describe("Voronoi", function() {
			
			J.it("should make voronoi", function() {
				var r = 1;
				var points = new Vector<Point>();
				for (i in 0...5) {
					var x = ((r = r.nextParkMiller()).toFloatRange(1, 99));
					var y = ((r = r.nextParkMiller()).toFloatRange(1, 99));
					var p = { x:x, y:y };
					points.push( p );
				}
				
				var v = new Voronoi(points, null, new Rectangle(0, 0, 100, 100));
				J.expect(v).not.toBeNull();
			});
			
		});
	}
	
}