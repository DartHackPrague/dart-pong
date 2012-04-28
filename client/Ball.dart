class Ball extends CollisionObject {
  Ball(id, x, y, width, height, direction, speed) : super(id, x, y, width, height, direction, speed);
  
  void onCollisionWith(CollisionObject o) {
    
    // bounce
    
    // top
    if (o.y+o.height > this.y && o.x+o.width > this.x && o.x < this.x + this.width) {
       this.direction = 2*Math.PI - this.direction;
    } 

    // bottom
    if (o.y < this.y + this.height && o.x+o.width > this.x && o.x < this.x + this.width) {
      this.direction = 2*Math.PI - this.direction;
    } 
    
    // left
    if (o.x + o.width > this.x && o.y+o.height > this.y && o.y < this.y+this.height) {
      this.direction = Math.PI - this.direction;
    } 

    // right
    if (o.x < this.x + this.width && o.y+o.height > this.y && o.y < this.y+this.height) {
      this.direction = Math.PI - this.direction; 
    } 

    
    
  }
  


}
