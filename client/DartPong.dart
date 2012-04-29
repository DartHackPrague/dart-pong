#import('dart:html');
#import('dart:json');

#source('Renderer.dart');
#source('Ticker.dart');
#source('CollisionObject.dart');
#source('Arena.dart');
#source('Ball.dart');
#source('Handler.dart');
#source('VerticalHandler.dart');
#source('HorizontalHandler.dart');
#source('HandlerListener.dart');
#source('KillingZone.dart');
#source('TeleportZone.dart');
#source('MessageReceiver.dart');
#source('PongMessage.dart');

void main() {
  Element container =  document.query('#mainAppContainer'); // TODO: vypeknit
  new DartPong( container );
}

class DartPong {
  int multiplayerId;
  WebSocket ws;
  Arena arena;
  
  Element container;
  bool isMultiplayer = false;
  
  DartPong(Element this.container) {
    this.runMultiPlayer();
  }

  void runSinglePlayer() {
    Ball ball = new Ball( 'ball', 300, 300, 10, 10, 6, 1 );
    
    List<CollisionObject> map = new List<CollisionObject>();
    List<CollisionObject> handlers = new List<CollisionObject>();
    List<CollisionObject> killingZones = new List<CollisionObject>();
    
    Handler leftHandler  = new VerticalHandler( 'left_handler', 10, 300, 10, 100, 0, 30 );
    map.add(leftHandler);
    handlers.add(leftHandler);
    Handler rightHandler = new VerticalHandler( 'right_handler', 580, 300, 10, 100, 0, 30 );
    map.add(rightHandler);
    handlers.add(rightHandler);
    Handler bottomHandler = new HorizontalHandler( 'bottom_handler', 250, 580, 100, 10, 0, 30 );
    map.add(bottomHandler);
    handlers.add(bottomHandler);
    Handler topHandler = new HorizontalHandler( 'top_handler', 250, 10, 100, 10, 0, 30 );
    map.add(topHandler);
    handlers.add(topHandler);
    
    CollisionObject leftWall = new KillingZone( 'left_wall', 0, 0, 1, 600, 0, 0, leftHandler );
    map.add(leftWall);   
    killingZones.add(leftWall);   
    CollisionObject topWall = new KillingZone( 'top_wall', 0, 0, 600, 1, 0, 0, topHandler );
    map.add(topWall);
    killingZones.add(topWall);
    CollisionObject rightWall = new KillingZone( 'right_wall', 600, 0, 1, 600, 0, 0, rightHandler );
    map.add(rightWall);
    killingZones.add(rightWall);
    CollisionObject bottomWall = new KillingZone( 'bottom_wall', 0, 600, 600, 1, 0, 0, bottomHandler );
    map.add(bottomWall);
    killingZones.add(bottomWall);
    
    CollisionObject test = new CollisionObject( 'test', 350, 350, 100, 100, 0, 0 );
    map.add(test);
    
    
    arena = new Arena( map, ball );
    
    leftHandler.arena = arena;
    rightHandler.arena = arena;
    bottomHandler.arena = arena;
    topHandler.arena = arena;
    
    leftWall.arena = arena;
    rightWall.arena = arena;
    bottomWall.arena = arena;
    topWall.arena = arena;
    
    Renderer renderer = new Renderer( arena, container, handlers, killingZones );
    renderer.initRender();
    
    HandlerListener leftHandlerListener  = new HandlerListener(leftHandler, 38, 40, renderer);
    HandlerListener rightHandlerListener = new HandlerListener(rightHandler, 83, 88, renderer);
    HandlerListener bottomHandlerListener = new HandlerListener(bottomHandler, 66, 78, renderer);
    HandlerListener topHandlerListener = new HandlerListener(topHandler, 85, 73, renderer);
    
    Ticker ticker = new Ticker( 10, arena, renderer, window );
    ticker.start();
  }
  
  void runMultiPlayer()
  {
    ws = new WebSocket("ws://localhost:3000/ws");
    MessageReceiver receiver = new MessageReceiver(ws, this);
   
    ws.on.open.add(send);
  }  
  
  send(e) {
    ws.send( JSON.stringify({'type': 1, 'name' : 'Pavel' }) );
  }
  
  void prepareGameForMultiplayer(int number) {
    multiplayerId = number;
    
    Ball ball = new Ball( 'ball', 300, 300, 10, 10, 6, 1 );
    
    List<CollisionObject> map = new List<CollisionObject>();
    List<CollisionObject> handlers = new List<CollisionObject>();
    List<CollisionObject> killingZones = new List<CollisionObject>();
    
    Handler handler;
    if (number == 1) {
      handler = new VerticalHandler( 'right_handler', 580, 300, 10, 100, 0, 30 );
    } else {
      handler  = new VerticalHandler( 'left_handler', 10, 300, 10, 100, 0, 30 );
    }
    map.add(handler);
    handlers.add(handler);
    
    CollisionObject teleport;
    CollisionObject killingZone;
    
    if (number == 1) {
      teleport = new TeleportZone( 'left_wall', 0, 0, 1, 600, 0, 0);
      killingZone = new KillingZone( 'right_wall', 600, 0, 1, 600, 0, 0, handler );
    } else {
      teleport = new TeleportZone( 'right_wall', 600, 0, 1, 600, 0, 0 );
      killingZone = new KillingZone(  'left_wall', 0, 0, 1, 600, 0, 0 , handler );
    }
    
    map.add(teleport);
    map.add(killingZone);
    killingZones.add(killingZone);
       
    CollisionObject topWall = new CollisionObject( 'top_wall', 0, 0, 600, 1, 0, 0 );
    map.add(topWall);
    CollisionObject bottomWall = new CollisionObject( 'bottom_wall', 0, 600, 600, 1, 0, 0 );
    map.add(bottomWall);
    
    
    
    arena = new Arena( map, ball, ws );
    
    handler.arena = arena;
    
    teleport.arena = arena;
    killingZone.arena = arena;
    bottomWall.arena = arena;
    topWall.arena = arena;
    
    Renderer renderer = new Renderer( arena, container, handlers, killingZones );
    renderer.initRender();
    
    ball.setAsOut();
    
    HandlerListener leftHandlerListener  = new HandlerListener(handler, 38, 40, renderer);
    
    Ticker ticker = new Ticker( 10, arena, renderer, window );
    ticker.start();
  }
}
