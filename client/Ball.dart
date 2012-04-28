class Ball extends CollisionObject {
  Ball(x, y, width, height, direction, speed) : super(x, y, width, height, direction, speed);
  
  void onCollisionWith(CollisionObject o) {
  }
}
