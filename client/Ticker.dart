#import('dart:html');

#source('Arena.dart');
#source('Renderer.dart');

class Ticker {  
  int time;
  int interval;
  Arena arena;
  Renderer renderer;
  
  Ticker(int this.time, this.renderer);
  
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
    arena.checkCollistions();
    arena.changePositions();
    
    renderer.render();
  }
}
