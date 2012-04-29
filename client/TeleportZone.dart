class TeleportZone extends CollisionObject {
  Handler handler;
  bool activeRightNow = false;
  
  TeleportZone(id, x, y, width, height, direction, speed) : super(id, x, y, width, height, direction, speed);
  
  void onCollisionWith(CollisionObject o) {
    
    if (arena != null) {
      arena.teleportBallOut();
    }
    
    activeRightNow = true;
  }
  
  String getCssClass() {
    return 'teleportZone';
  }
  
}
