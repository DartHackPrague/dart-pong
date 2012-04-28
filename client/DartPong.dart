#import('dart:html');

#source('Renderer.dart');
#source('Ticker.dart');
#source('CollisionObject.dart');
#source('Arena.dart');
#source('Ball.dart');
#source('Handler.dart');
#source('Listeners.dart');


void main() {
  new DartPong();
}

class DartPong {

  DartPong() {
    this.run();
  }

  void run() {
    List<CollisionObject> map = new List<CollisionObject>();
    map.add(new CollisionObject( 'leva_stena', 0, 0, 10, 600, 0, 0 ));
    map.add(new CollisionObject( 'horni_stena', 0, 0, 800, 10, 0, 0 ));
    map.add(new CollisionObject( 'prava_stena', 790, 0, 10, 600, 0, 0 ));
    map.add(new CollisionObject( 'spodni_stena', 0, 790, 800, 10, 0, 0 ));
    
    Ball ball = new Ball( 'ball', 300, 300, 10, 10, 0, 1);
    Arena arena = new Arena( map, ball );
    Renderer renderer = new Renderer( arena );
    Ticker ticker = new Ticker( 10, arena, renderer, window );
    
    ticker.start();
    
    var listeners = new Listeners();
    listeners.initHandler({});
  }

}
