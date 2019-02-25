static class ObstacleManager 
{
  //-----------------------------------------------------------------------------------------------------------------
  // Member Variables
  static ArrayList<Obstacle> obs;
  
  //-----------------------------------------------------------------------------------------------------------------
  // Constructor
  ObstacleManager() {
    obs = new ArrayList<Obstacle>();
  }

  //-----------------------------------------------------------------------------------------------------------------
  // Add Obstacle to ObstacleManager
  static void add(Obstacle o)
  {
    obs.add(o);
  }
  
  //-----------------------------------------------------------------------------------------------------------------
  // Get list of Obstacles
  static ArrayList<Obstacle> get() {
      return obs;
  }
  
  //-----------------------------------------------------------------------------------------------------------------
  // Show Obstacles
  void showAll() {
      for (int i = obs.size() - 1; i >= 0; i--) {
        Obstacle o = obs.get(i);
        o.show();
      }
  }
  
}
