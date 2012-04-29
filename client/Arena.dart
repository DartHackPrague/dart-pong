class Arena {
  List<CollisionObject> collisionObjects;
  WebSocket websocket;
  Ball ball;
  
  Arena( this.collisionObjects, this.ball, [this.websocket=null]) {
  }
  
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
    ball.setAsOut();
    
    if (this.websocket != null) {
    
      PongMessage msg = new PongMessage();
      msg.type = 1;
      msg.speed = ball.speed;
      msg.direction = ball.direction;
      msg.x = ball.x;
      msg.y = ball.y;
      
      this.websocket.send(JSON.stringify(msg));
    }

  }
  
  teleportBallIn(PongMessage msg) {
    print('Teleport IN');
    ball.x = this.getWidth() - ball.x;
    ball.y = msg.y;
    ball.speed = msg.speed;
    ball.direction = msg.direction;

    ball.setAsIn();
    
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
