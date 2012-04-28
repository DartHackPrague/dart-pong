class HorizontalHandler extends Handler{  
  HorizontalHandler(id, x, y, width, height, direction, speed, ball) : super(id, x, y, width, height, direction, speed, ball);
    
  moveUp() {
    this.x = this.x - speed;
  }
    
  moveDown() {
    this.x = this.x + speed;
  }
}
