class Ball extends CollisionObject {
  Ball(id, x, y, width, height, direction, speed) : super(id, x, y, width, height, direction, speed);
  
  static double flipAngleVertical(double alpha) {
    return Math.PI - alpha;
  }
  
  static double flipAngleHorizontal(double alpha) {
    return 2*Math.PI - alpha;
  }
  
  void onCollisionWith(CollisionObject o) {
    if (this.x > o.x && this.x+this.width < o.x+o.width) {
      this.direction = flipAngleHorizontal(this.direction);
    } else {
      this.direction = flipAngleVertical(this.direction);
    }  
  }
}
