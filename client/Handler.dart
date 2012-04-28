class Handler extends CollisionObject {
  Handler(id, x, y, width, height, direction, speed, ball) : super(id, x, y, width, height, direction, speed, ball);
  
  moveUp() {
    if (direction == Math.PI) {
      this.x = this.x - speed;
    } else {
      this.y = this.y - speed;
    }
  }
  
  moveDown() {
    if (direction == Math.PI) {
      this.x = this.x + speed;
    } else {
      this.y = this.y + speed;
    }
  }
  
  void onCollisionWith(CollisionObject o) {
    ball.speed += 1;
  }
  
}
