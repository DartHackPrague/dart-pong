#import('dart:html');

#source('Arena.dart');

class Ticker {
  
  int time;
  int interval;
  Arena arena;
  
  Ticker(int this.time) { 
    this.start();
  }
  
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
    
  }
}
