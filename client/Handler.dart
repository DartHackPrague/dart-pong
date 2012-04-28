class Handler extends CollisionObject {
  Handler(id, x, y, width, height, direction, speed, ball) : super(id, x, y, width, height, direction, speed, ball);
  
  moveUp() {
  }
  
  moveDown() {
  }
  
  void onCollisionWith(CollisionObject o) {
    ball.speed += 1;
  } 
}
