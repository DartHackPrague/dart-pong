class Ball extends CollisionObject {
  Ball(id, x, y, width, height, direction, speed) : super(id, x, y, width, height, direction, speed);
  
  static double flipAngleVertical(double alpha) {
    return Math.PI - alpha;
  }
  
  static double flipAngleHorizontal(double alpha) {
    return 2*Math.PI - alpha;
  }
  
  void onCollisionWith(CollisionObject o) {
    if (this.x > o.x && this.x+this.width < o.x+o.width) {
      this.direction = flipAngleHorizontal(this.direction);
    } else {
      this.direction = flipAngleVertical(this.direction);
    }  
  }
  
  void setAsOut(){
    this.available = false;
    this.visible = false;
    Element element = document.query('#${this.id}'); // TODO: duplicitni kod k tom metodam v rendereru, ktere neumim volat
    element.style.visibility = 'hidden';// TODO: duplicitni kod k tom metodam v rendereru, ktere neumim volat
  }
  
  void setAsIn(){
    this.available = true;
    this.visible = true;
    Element element = document.query('#${this.id}'); // TODO: duplicitni kod k tom metodam v rendereru, ktere neumim volat
    element.style.visibility = 'visible'; // TODO: duplicitni kod k tom metodam v rendereru, ktere neumim volat
  }
  
}
