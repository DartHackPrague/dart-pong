class Arena {
  List<CollisionObject> collisionObjects;
  Ball ball;
  bool isNewGame = false;
  
  Arena( this.collisionObjects, this.ball );
  
  checkCollisions() {
    collisionObjects.forEach((collisionObject) {
        if (ball.isCollisionWith(collisionObject)) {
          ball.onCollisionWith(collisionObject);
          collisionObject.onCollisionWith(ball);
        }
    });
  }
  
  startNewGame() {
    ball.x = 300.0;
    ball.y = 300.0;
    ball.speed = 1.0;
    
    isNewGame = true;
  }
  
  int getWidth() {
    int maxWidth = 0;
    collisionObjects.forEach((collisionObject) {
      if (collisionObject.x > maxWidth) {
        maxWidth = collisionObject.x;
      }
    });
    
    return maxWidth;
  }
  
  int getHeight() {
    int maxHeight = 0;
    collisionObjects.forEach((collisionObject) {
      if (collisionObject.y > maxHeight) {
        maxHeight = collisionObject.y;
      }
    });
    
    return maxHeight;
  }
  
  // v tuto chvili jen u micku
  changePositions() {
    ball.changePosition();
  }
  
}
