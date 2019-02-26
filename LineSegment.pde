public class LineSegment
{
  //-----------------------------------------------------------------------------------------------------------------
  // Member Variables
  PVector point1;
  PVector point2;

  //-----------------------------------------------------------------------------------------------------------------
  // Constructor
  LineSegment(PVector p1, PVector p2)
  {
    point1 = p1;
    point2 = p2;
  }

  //-----------------------------------------------------------------------------------------------------------------
  // Given three colinear points p, q, r, the function checks if point q lies on line segment 'pr' 
  boolean onSegment(PVector p, PVector q, PVector r) 
  { 
    if (q.x <= max(p.x, r.x) && q.x >= min(p.x, r.x) && q.y <= max(p.y, r.y) && q.y >= min(p.y, r.y)) 
      return true; 
    return false;
  } 

  //-----------------------------------------------------------------------------------------------------------------
  // To find orientation of ordered triplet (p, q, r). 
  // The function returns following values 
  // 0 --> p, q and r are colinear 
  // 1 --> Clockwise 
  // 2 --> Counterclockwise 
  int orientation(PVector p, PVector q, PVector r) 
  {   
    float val = (q.y - p.y) * (r.x - q.x) - (q.x - p.x) * (r.y - q.y); 
    if (val == 0) return 0;
    return (val > 0)? 1: 2;
  } 

  //-----------------------------------------------------------------------------------------------------------------
  // The main function that returns true if line segment 'l2' and 'this' line intersect. 
  boolean doIntersect(LineSegment l2) 
  { 
    int o1 = orientation(point1, point2, l2.point1); 
    int o2 = orientation(point1, point2, l2.point2); 
    int o3 = orientation(l2.point1, l2.point2, point1); 
    int o4 = orientation(l2.point1, l2.point2, point2); 

    if (o1 != o2 && o3 != o4) return true; 
    if (o1 == 0 && onSegment(point1, l2.point1, point2)) return true; 
    if (o2 == 0 && onSegment(point1, l2.point2, point2)) return true; 
    if (o3 == 0 && onSegment(l2.point1, point1, l2.point2)) return true; 
    if (o4 == 0 && onSegment(l2.point1, point2, l2.point2)) return true; 

    return false;
  }

  //-----------------------------------------------------------------------------------------------------------------
  // Returns the box surrounding the line
  PVector[] getBoundingBox() {
    PVector[] res = new PVector[2];
    res[0] = point1;
    res[1] = point2;
    return res;
  }

  //-----------------------------------------------------------------------------------------------------------------
  //draws the line on the screen
  void show() {
    stroke(0, 150, 150);
    line(point1.x, point1.y, point2.x, point2.y);
  }

  //-----------------------------------------------------------------------------------------------------------------
  // Gets the vector as if point1 was the origin
  PVector getVector() {
    return new PVector(point1.x - point2.x, point1.y - point2.y);
  }

  //-----------------------------------------------------------------------------------------------------------------
  //prints the line on the console
  String print() 
  {
    return "Line from " + point1.toString() + " to " + point2.toString() + "!";
  }

  PVector calculateInterceptionPoint(LineSegment l) 
  { 
    PVector A = point1;
    PVector B = point2;
    PVector C = l.point1;
    PVector D = l.point2;

    // Line AB represented as a1x + b1y = c1 
    float a1 = B.y - A.y; 
    float b1 = A.x - B.x; 
    float c1 = a1*(A.x) + b1*(A.y); 

    // Line CD represented as a2x + b2y = c2 
    float a2 = D.y - C.y; 
    float b2 = C.x - D.x; 
    float c2 = a2*(C.x)+ b2*(C.y); 

    float determinant = a1*b2 - a2*b1; 

    if (determinant == 0) 
    { 
      // The lines are parallel. This is simplified 
      // by returning a pair of FLT_MAX 
      return null;
    } else
    { 
      float x = (b2*c1 - b1*c2)/determinant; 
      float y = (a1*c2 - a2*c1)/determinant; 
      return new PVector(x, y);
    }
  }
}
