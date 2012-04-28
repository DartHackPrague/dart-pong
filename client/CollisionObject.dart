class CollisionObject {
  
  int width, height;
  double x, y, direction, speed; // TODO: speed zatim px/tick, lepe spocitat z kontanty 
  bool visible;
  
  CollisionObject(this.x, this.y, this.width, this.height, this.direction, this.speed) {
    
  }
  
  void onCollisionWidth(CollisionObject o) {
  }
  
  void changePosition() {  // vymyslet mozne prejmenovani
    if (this.speed != 0.0 && this.direction != 0.0) {
      this.x += speed * Math.cos(direction);
      this.y += speed * Math.sin(direction);
    }
  }
  
  
  
  bool isCollisionWith(CollisionObject o) { // kulicka + mozne dalsi objekty
    
    // top
    if (o.y+o.height > this.y && o.x+o.width > this.x && o.x < this.x + this.width) {
      return true;
    } 

    // bottom
    if (o.y < this.y + this.height && o.x+o.width > this.x && o.x < this.x + this.width) {
      return true;
    } 
    
    // left
    if (o.x + o.width > this.x && o.y+o.height > this.y && o.y < this.y+this.height) {
      return true;      
    } 

    // right
    if (o.x < this.x + this.width && o.y+o.height > this.y && o.y < this.y+this.height) {
      return true;      
    } 
    
    return false;
    
    /*
    
    return 
      (o.y+o.height > this.y && o.x+o.width > this.x && o.x < this.x + this.width) ||
      (o.y < this.y + this.height && o.x+o.width > this.x && o.x < this.x + this.width) ||
      (o.x + o.width > this.x && o.y+o.height > this.y && o.y < this.y+this.height) ||
      (o.x < this.x + this.width && o.y+o.height > this.y && o.y < this.y+this.height);
    
    */
    
  }
  
}
