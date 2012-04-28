#import('dart:html');

#source('Renderer.dart');
#source('Ticker.dart');
#source('CollisionObject.dart');
#source('Arena.dart');
#source('Ball.dart');


void main() {
  new DartPong();
}

class DartPong {

  DartPong() {
    this.run();
  }

  void run() {
    List<CollisionObject> map;
    Ball ball = new Ball();
    Arena arena = new Arena( map, ball );
    Renderer renderer = new Renderer( arena );
    Ticker ticker = new Ticker( 100 );    
  }

}
