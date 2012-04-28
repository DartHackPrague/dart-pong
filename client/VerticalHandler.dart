class VerticalHandler extends Handler {  
  VerticalHandler(id, x, y, width, height, direction, speed, ball) : super(id, x, y, width, height, direction, speed, ball);
    
  moveUp() {
    this.y = this.y - speed;
  }
    
  moveDown() {
    this.y = this.y + speed;
  }
}