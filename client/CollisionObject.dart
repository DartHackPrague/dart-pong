class CollisionObject {
  Arena arena;
  String id;
  double x, y, direction, speed; // TODO: speed zatim px/tick, lepe spocitat z kontanty 
  int width, height;
  bool visible, available = true;

  
  CollisionObject(this.id, this.x, this.y, this.width, this.height, this.direction, this.speed);
  
  void onCollisionWith(CollisionObject o) {
    // print('collision');
  }
  
  
  void changePosition() {  // vymyslet mozne prejmenovani
    if (this.speed != 0.0) {
      this.x = this.getNextX();
      this.y = this.getNextY();
    }
  }
  
  double getNextX() {
    return this.x + this.speed * Math.cos(this.direction);
  }
  
  double getNextY() {
    return this.y + this.speed * Math.sin(this.direction);
  }
  
  bool isCollisionWith(CollisionObject o) { // kulicka + mozne dalsi objekty
   
    return
        this.x + this.width > o.x
        && this.x < o.x + o.width
        && this.y + this.height > o.y
        && this.y < o.y + o.height;
  }
  
  String getCssClass() {
    return '';
  }
}
