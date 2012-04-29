class Handler extends CollisionObject {
  int countOfDeaths = 0;
  
  Handler(id, x, y, width, height, direction, speed, ball) : super(id, x, y, width, height, direction, speed, ball);
  
  moveUp() {
  }
  
  moveDown() {
  }
  
  void onCollisionWith(CollisionObject o) {
    // print('Collision handler');
    ball.speed += 1;
  } 
}
