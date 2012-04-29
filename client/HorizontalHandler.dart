class HorizontalHandler extends Handler{  
  HorizontalHandler(id, x, y, width, height, direction, speed) : super(id, x, y, width, height, direction, speed);
    
  moveUp() {
    this.x = this.x - speed;
  }
    
  moveDown() {
    this.x = this.x + speed;
  }
}
