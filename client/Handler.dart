class Handler extends CollisionObject {
  int countOfDeaths = 0;
  
  Handler(id, x, y, width, height, direction, speed) : super(id, x, y, width, height, direction, speed);
  
  moveUp() {
  }
  
  moveDown() {
  }
  
  void onCollisionWith(CollisionObject o) {
    // print('Collision handler');
    if (arena != null) {
      arena.ball.speed += 1;
    }
  }
  
  String getCssClass() {
    return 'handler';
  }
}
