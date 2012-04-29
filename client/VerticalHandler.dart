class VerticalHandler extends Handler {  
  VerticalHandler(id, x, y, width, height, direction, speed) : super(id, x, y, width, height, direction, speed);
    
  moveUp() {
    this.y = this.y - speed;
  }
    
  moveDown() {
    this.y = this.y + speed;
  }
}