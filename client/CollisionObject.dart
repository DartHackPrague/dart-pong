class CollisionObject {
  
  String id;
  double x, y, direction, speed; // TODO: speed zatim px/tick, lepe spocitat z kontanty 
  int width, height;
  bool visible;

  
  CollisionObject(this.id, this.x, this.y, this.width, this.height, this.direction, this.speed) {
  }
  
  
  void onCollisionWith(CollisionObject o) {
  }
  
  
  void changePosition() {  // vymyslet mozne prejmenovani
    if (this.speed != 0.0) {
      this.x += this.speed * Math.cos(this.direction);
      this.y += this.speed * Math.sin(this.direction);
    }
  }
  
  
  Element getHTMLElement() {
    
    Element e = new Element.tag('div');
    e.attributes['id'] = id;
    e.classes.add('colision_object');
    e.style.width = '${width}px';
    e.style.height = '${height}px';
    e.style.top = '${y}px';
    e.style.left = '${x}px';
    
    return e;
    
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
