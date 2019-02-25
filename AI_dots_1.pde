Population test;
PVector goal  = new PVector(400, 10);

ObstacleManager obs = new ObstacleManager();
Obstacle o1;
Obstacle o2;
Obstacle o3;


void setup() {
  size(800, 800); //size of the window
  frameRate(1000);//increase this to make the dots go faster
  
  o1 = new Obstacle(100, 300, 600, 30);
  o2 = new Obstacle(700, 300, 30, 300);
  o3 = new Obstacle(70, 300, 30, 300);
  ObstacleManager.add(o1);
  ObstacleManager.add(o2);
  ObstacleManager.add(o3);

  test = new Population(1000);//create a new population with 1000 members
}


void draw() { 
  background(255);

  //draw goal
  fill(255, 0, 0);
  ellipse(goal.x, goal.y, 10, 10);

  //draw obstacle(s)
  o1.show();
  o2.show();
  o3.show();

  if (test.allDotsDead()) {
    //genetic algorithm
    test.calculateFitness();
    test.naturalSelection();
    test.mutateDemBabies();
  } else {
    //if any of the dots are still alive then update and then show them

    test.update();
    test.show();
  }
}
