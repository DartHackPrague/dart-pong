class Ticker {  
  int time;
  int interval;
  Arena arena;
  Renderer renderer;
  Window window;
  
  Ticker(int this.time, this.arena, this.renderer, this.window);
  
  start() {
    if (interval == null) {
      interval = window.setInterval(tick, this.time);
    }
  }
  
  stop() {
    window.clearInterval(interval);
  }
  
  tick() {
    onTick();
  }
  
  onTick() {
    arena.checkCollisions();
    arena.changePositions();
    
    renderer.render();
    renderer.moveCollisionObject(arena.ball);
  }
}
