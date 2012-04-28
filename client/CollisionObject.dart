class CollisionObject {
  
  double x, y;
  int width, height;
  double direction;
  double speed; 
  bool visible;
  
  void onCollisionWith(CollisionObject o) {
    
  }
  
  void changePosition() {  // vymyslet mozne prejmenovani
    this.x = this.x + speed / Math.sin(direction);
    this.y = this.y + speed * Math.sin(direction);
  }
  
  bool isCollisionWith(CollisionObject o) { // kulicka + mozne dalsi objekty
    
    // top
    if (o.y+o.height > this.y && o.x+o.width > this.x && o.x < this.x + this.width) {
      this.onCollision();
      return true;
    } 

    // bottom
    if (o.y < this.y + this.height && o.x+o.width > this.x && o.x < this.x + this.width) {
      this.onCollision();
      return true;
    } 
    
  
    return false;
  }
  
}
