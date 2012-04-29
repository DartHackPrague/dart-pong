class KillingZone extends CollisionObject {
  Handler handler;
  
  KillingZone(id, x, y, width, height, direction, speed, ball, this.handler) : super(id, x, y, width, height, direction, speed, ball);
  
  void onCollisionWith(CollisionObject o) {
    ball.x = 300.0;
    ball.y = 300.0;
    ball.speed = 1.0;
    
    handler.countOfDeaths++;
  }
}
