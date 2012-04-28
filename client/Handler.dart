class Handler extends CollisionObject {  
  
  Handler(id, x, y, width, height, direction, speed) : super(id, x, y, width, height, direction, speed);
  
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
  
}
