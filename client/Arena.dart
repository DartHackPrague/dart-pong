class Arena {
  List<CollisionObject> collisionObjects;
  
  Ball ball;
  
  Arena( this.collisionObjects, this.ball );
  
  checkCollistions() {
    collisionObjects.forEach((collisionObject) {
        if (ball.isCollisionWith(collisionObject)) {
          ball.onCollisionWith(collisionObject);
          collisionObject.onCollisionWith(ball);
        }
    });
  }
  
  // v tuto chvili jen u micku
  changePositions() {
    ball.changePosition();
  }
  
}
