class Ball extends CollisionObject {
  Ball(id, x, y, width, height, direction, speed, ball) : super(id, x, y, width, height, direction, speed, ball);
  
  static double flipAngleHorizontal(double alpha) {
    return Math.PI - alpha;
  }
  
  static double flipAngleVrtical(double alpha) {
    return 2*Math.PI - alpha;
  }
  
  void onCollisionWith(CollisionObject o) {
    
    // bounce
    print('Collision BALL');
    // top
    if (this.y < o.y+o.height && this.y+this.height > o.y+o.height && this.x+this.width > o.x && o.x+o.width > this.x) {
      this.direction = 2*Math.PI - this.direction;
    } 

    // bottom
    if (this.y+this.height > o.y && this.y+this.height < o.y+o.height && this.x+this.width > o.x && o.x+o.width > this.x.ceil()) {
      this.direction = 2*Math.PI - this.direction;
    } 
    
    // left
    if (this.x < o.x+o.width && this.x>o.x && this.y+this.height > o.y && this.y < o.y+o.height) {
      this.direction = Math.PI - this.direction;
    } 

    // right
    if (this.x+this.width > o.x && this.x+this.width<o.x+o.width && this.y+this.height > o.y && this.y < o.y+o.height) {
      this.direction = Math.PI - this.direction; 
    } 

    
    
  }
  


}
