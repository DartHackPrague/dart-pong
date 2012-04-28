#import('dart:html');

#source('Renderer.dart');
#source('Ticker.dart');
#source('CollisionObject.dart');
#source('Arena.dart');
#source('Ball.dart');
#source('Handler.dart');
#source('VerticalHandler.dart');
#source('HorizontalHandler.dart');
#source('HandlerListener.dart');


void main() {
  Element container =  document.query('#mainAppContainer'); // TODO: vypeknit
  new DartPong( container );
}

class DartPong {
  Element container;
  
  DartPong(Element this.container) {
    this.run();
  }

  void run() {
    Ball ball = new Ball( 'ball', 300, 300, 10, 10, 6, 1, null );
    
    // tu referenci na ball bych mel asi rano vymyslet lepeji
    
    List<CollisionObject> map = new List<CollisionObject>();
    map.add(new CollisionObject( 'leva_stena', 0, 0, 1, 600, 0, 0, ball ));
    map.add(new CollisionObject( 'horni_stena', 0, 0, 800, 1, 0, 0, ball ));
    map.add(new CollisionObject( 'prava_stena', 800, 0, 1, 600, 0, 0, ball ));
    map.add(new CollisionObject( 'spodni_stena', 0, 600, 800, 1, 0, 0, ball ));
    
    Handler leftHandler  = new VerticalHandler( 'left_handler', 10, 300, 10, 100, 0, 10 , ball);
    map.add(leftHandler);
    Handler rightHandler = new VerticalHandler( 'right_handler', 780, 300, 10, 100, 0, 10 , ball);
    map.add(rightHandler);
    Handler bottomHandler = new HorizontalHandler( 'bottom_handler', 350, 580, 100, 10, 0, 10 , ball);
    map.add(bottomHandler);
    Handler topHandler = new HorizontalHandler( 'top_handler', 350, 10, 100, 10, 0, 10 , ball);
    map.add(topHandler);
    
    
    Arena arena = new Arena( map, ball );
    
    Renderer renderer = new Renderer( arena, container );
    renderer.initRender();
    
    HandlerListener leftHandlerListener  = new HandlerListener(leftHandler, 38, 40, renderer);
    HandlerListener rightHandlerListener = new HandlerListener(rightHandler, 83, 88, renderer);
    HandlerListener bottomHandlerListener = new HandlerListener(bottomHandler, 66, 78, renderer);
    HandlerListener topHandlerListener = new HandlerListener(topHandler, 85, 73, renderer);
    
    Ticker ticker = new Ticker( 10, arena, renderer, window );
    ticker.start();
  }
}
