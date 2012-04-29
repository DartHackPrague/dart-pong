class Arena {
  List<CollisionObject> collisionObjects;
  
  Ball ball;
  
  Arena( this.collisionObjects, this.ball );
  
  checkCollisions() {
    collisionObjects.forEach((collisionObject) {
      //document.query('#dump').innerHTML = document.query('#dump').innerHTML + '<br>${collisionObject.x}';
        if (ball.isCollisionWith(collisionObject) && ball.available) {
          ball.onCollisionWith(collisionObject);
          collisionObject.onCollisionWith(ball);
        }
    });
  }
  
  startNewGame() {
    ball.x = 300.0;
    ball.y = 300.0;
    ball.speed = 1.0;
  }
  
  teleportBallOut() {
    print('Teleport OUT');
    ball.available = false;
  }
  
  teleportBallIn() {
    print('Teleport IN');
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
    if (ball.available) ball.changePosition();
  }
  
}
