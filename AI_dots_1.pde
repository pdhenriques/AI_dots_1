Population test;
PVector goal  = new PVector(400, 40);

ObstacleManager obs = new ObstacleManager();



void setup() {
  size(800, 800); //size of the window
  frameRate(-1);//increase this to make the dots go faster
  setLevel(2);
  test = new Population(1000);//create a new population with 1000 members
}


void draw() { 
  background(255);

  //draw goal
  fill(255, 0, 0);
  ellipse(goal.x, goal.y, 10, 10);

  //draw obstacle(s)
  obs.showAll();

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

void setLevel(int levelIndex)
{
  int wallThickness = 20;
  ObstacleManager.add(new Obstacle(0, 0, width, wallThickness));
  ObstacleManager.add(new Obstacle(width - wallThickness, 0, wallThickness, height));
  ObstacleManager.add(new Obstacle(0, height - wallThickness, width, wallThickness));
  ObstacleManager.add(new Obstacle(0, 0, wallThickness, height));
  switch(levelIndex) {
    case 0: 
      println("Start Level Zero");
      break;
    case 1: 
      println("Start Level One");
      ObstacleManager.add(new Obstacle(0, 380, 700, 10));
      break;
    case 2: 
      println("Start Level Two");
      ObstacleManager.add(new Obstacle(300, 230, 700, 10));
      ObstacleManager.add(new Obstacle(0, 380, 500, 10));
      ObstacleManager.add(new Obstacle(300, 530, 700, 10));
      break;
    case 3: 
      println("Start Level Three");
      ObstacleManager.add(new Obstacle(100, 300, 600, 30));
      ObstacleManager.add(new Obstacle(700, 300, 30, 300));
      ObstacleManager.add(new Obstacle(70, 300, 30, 300));
      break;
  }
  
}
