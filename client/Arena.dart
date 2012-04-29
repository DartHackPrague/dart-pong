class Arena {
  List<CollisionObject> collisionObjects;
  
  Ball ball;
  
  Arena( this.collisionObjects, this.ball );
  
  checkCollisions() {
    collisionObjects.forEach((collisionObject) {
      //document.query('#dump').innerHTML = document.query('#dump').innerHTML + '<br>${collisionObject.x}';
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
  }
  
  // v tuto chvili jen u micku
  changePositions() {
    ball.changePosition();
  }
  
}
