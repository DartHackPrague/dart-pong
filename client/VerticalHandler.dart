class VerticalHandler extends Handler {  
  VerticalHandler(id, x, y, width, height, direction, speed) : super(id, x, y, width, height, direction, speed);
    
  moveUp() {
    if (this.y - speed > 0) { 
      this.y = this.y - speed;
    } else {
      this.y = 0.0;
    }
  }
    
  moveDown() {
    if (this.y + this.height + speed < arena.getHeight()) {
      this.y = this.y + speed;
    } else {
      this.y = arena.getHeight().toDouble() - this.height;
    }
  }
}