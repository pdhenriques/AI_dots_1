class Obstacle 
{
  //-----------------------------------------------------------------------------------------------------------------
  // Member Variables
  LineSegment line1;  
  LineSegment line2;  
  LineSegment line3;  
  LineSegment line4;

  //-----------------------------------------------------------------------------------------------------------------
  // Constructor
  Obstacle(PVector p1, PVector p2, PVector p3, PVector p4)
  {
    line1 = new LineSegment(p1, p2);
    line2 = new LineSegment(p2, p4);
    line3 = new LineSegment(p4, p3);
    line4 = new LineSegment(p3, p1);
  }

  //-----------------------------------------------------------------------------------------------------------------
  // Constructor
  Obstacle(int x, int y, int sizeX, int sizeY)
  {
    line1 = new LineSegment(new PVector(x, y), new PVector(x+sizeX, y));
    line2 = new LineSegment(new PVector(x+sizeX, y), new PVector(x+sizeX, y+sizeY));
    line3 = new LineSegment(new PVector(x+sizeX, y+sizeY), new PVector(x, y+sizeY));
    line4 = new LineSegment(new PVector(x, y+sizeY), new PVector(x, y));
  }

  //-----------------------------------------------------------------------------------------------------------------
  // The main function that returns true if line segment 'l' and any of the lines of 'this' obstacle intersect. 
  LineSegment collides(LineSegment l)
  {
    PVector collisionPoint = null;
    LineSegment exitPoint = null;

    if (line1.doIntersect(l))
    {
      collisionPoint = line1.calculateInterceptionPoint(l);
      exitPoint = new LineSegment(collisionPoint, new PVector(0, 0));
    } else if (line2.doIntersect(l))
    {
      collisionPoint = line2.calculateInterceptionPoint(l);
      exitPoint = new LineSegment(collisionPoint, new PVector(0, 0));
    } else if (line3.doIntersect(l))
    {
      collisionPoint = line3.calculateInterceptionPoint(l);
      exitPoint = new LineSegment(collisionPoint, new PVector(0, 0));
    } else if (line4.doIntersect(l))
    {
      collisionPoint = line4.calculateInterceptionPoint(l);
      exitPoint = new LineSegment(collisionPoint, new PVector(0, 0));
    }

    return exitPoint;
  }

  //-----------------------------------------------------------------------------------------------------------------
  //draws the obstacle on the screen
  void show() {
    fill(200, 200, 255);
    quad(line1.point1.x, line1.point1.y, line2.point1.x, line2.point1.y, line3.point1.x, line3.point1.y, line4.point1.x, line4.point1.y);
    line1.show();
    line2.show();
    line3.show();
    line4.show();
  }

  //-----------------------------------------------------------------------------------------------------------------
  //prints the obstacle on the console
  String print() 
  {
    return "Obstacle from " + line1.point1.toString() + " to " + line2.point2.toString() + "!";
  }
}
