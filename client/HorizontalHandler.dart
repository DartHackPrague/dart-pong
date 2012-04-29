class HorizontalHandler extends Handler{  
  HorizontalHandler(id, x, y, width, height, direction, speed) : super(id, x, y, width, height, direction, speed);
    
  moveUp() {
    if (this.x - speed > 0) { 
      this.x = this.x - speed;
    } else {
      this.x = 0.0;
    }
  }
    
  moveDown() {
    if (this.x + this.width + speed < arena.getWidth()) {
      this.x = this.x + speed;
    } else {
      this.x = arena.getWidth().toDouble() - this.width;
    }
  }
}
