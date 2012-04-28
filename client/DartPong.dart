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
    map.add(new CollisionObject( 'leva_stena', 0, 0, 1, 600, 0, 0 ));
    map.add(new CollisionObject( 'horni_stena', 0, 0, 800, 1, 0, 0 ));
    map.add(new CollisionObject( 'prava_stena', 800, 0, 1, 600, 0, 0 ));
    map.add(new CollisionObject( 'spodni_stena', 0, 600, 800, 1, 0, 0 ));
    
    Ball ball = new Ball( 'ball', 300, 300, 10, 10, 6, 1 );
    Handler handler = new Handler( 'handler', 10, 300, 10, 100, 0, 0 );
    map.add(handler);
    
    Arena arena = new Arena( map, ball );
    Renderer renderer = new Renderer( arena );
    Ticker ticker = new Ticker( 10, arena, renderer, window );
    
    Listeners listener = new Listeners(handler, renderer);
    
    ticker.start();
  }

}
