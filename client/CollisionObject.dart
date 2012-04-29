class CollisionObject {
  Ball ball;
  String id;
  double x, y, direction, speed; // TODO: speed zatim px/tick, lepe spocitat z kontanty 
  int width, height;
  bool visible;

  
  CollisionObject(this.id, this.x, this.y, this.width, this.height, this.direction, this.speed, this.ball);
  
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
    
    
    
    /*
    // top
    if (this.y < o.y+o.height && this.y+this.height > o.y+o.height && this.x+this.width > o.x && o.x+o.width > this.x) {
      //document.query('#dump').innerHTML = document.query('#dump').innerHTML + '<br>TOP';
      print('T');

      return true;
    } 

    // bottom
    if (this.y+this.height > o.y && this.y+this.height < o.y+o.height && this.x+this.width > o.x && o.x+o.width > this.x.ceil()) {
      //document.query('#dump').innerHTML = document.query('#dump').innerHTML + '<br>BOTTOM';
      print('B');

      return true;
    } 
  
    
    // left
    if (this.x < o.x+o.width && this.x>o.x && this.y+this.height > o.y && this.y < o.y+o.height) {
      //document.query('#dump').innerHTML = document.query('#dump').innerHTML + '<br>LEFT';
      print('L');

      return true;      
    } 

    
    // right
    if (this.x+this.width > o.x && this.x+this.width<o.x+o.width && this.y+this.height > o.y && this.y < o.y+o.height) {
      //document.query('#dump').innerHTML = document.query('#dump').innerHTML + '<br>RIGHT';
      
      print('R');
      return true;      
    } 
    
    return false;
    */
    
    /*
    
    return 
      (o.y+o.height > this.y && o.x+o.width > this.x && o.x < this.x + this.width) ||
      (o.y < this.y + this.height && o.x+o.width > this.x && o.x < this.x + this.width) ||
      (o.x + o.width > this.x && o.y+o.height > this.y && o.y < this.y+this.height) ||
      (o.x < this.x + this.width && o.y+o.height > this.y && o.y < this.y+this.height);
    
    */
    
  }
  
}
