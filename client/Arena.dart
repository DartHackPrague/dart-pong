#source('CollisionObject.dart');
#source('Ball.dart');

class Arena {
  List<CollisionObject> collisionObjects;
  
  Ball ball;
  
  Arena(this.collisionObjects, this.ball);
  
  checkCollistions() {
    // pokud dojde ke kolizi, spusti se onCollistion na obou objektech
  }
  
}
