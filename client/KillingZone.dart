class KillingZone extends CollisionObject {
  Handler handler;
  bool killedRightNow = false;
  
  KillingZone(id, x, y, width, height, direction, speed, this.handler) : super(id, x, y, width, height, direction, speed);
  
  void onCollisionWith(CollisionObject o) {
    if (arena != null) {
      arena.startNewGame();
    }
    
    handler.countOfDeaths++;
    killedRightNow = true;
  }
}
