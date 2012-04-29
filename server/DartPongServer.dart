#import('dart:io');
#import('dart:json');

void main() {
  
  int clients;
  WebSocketConnection conn1;
  WebSocketConnection conn2;
  
  List conns = [];
  
  HttpServer server = new HttpServer();
  WebSocketHandler wsHandler = new WebSocketHandler();
  server.addRequestHandler((req) => req.path == '/ws', wsHandler.onRequest);
  
  wsHandler.onOpen = (WebSocketConnection conn) {
    print('new connection');
    
    conns.add(conn);
    
    conn.onMessage = (message) {
      var parsedMsg = JSON.parse(message);
      var result = {};
      
      if (parsedMsg['type'] == 1) {
        print('First player has joined to the game.');
        result['type'] = 1;
        result['numberOfClients'] = conns.length;
        result['message'] = 'One player is waiting for opponent.';
        print('......');
        conns.forEach((c) {
          print(c);
          c.send(JSON.stringify(result));
        });
      }
      if (parsedMsg['type'] == 2) {
        print('Ball crosses the teleport zone with x = ' + parsedMsg['x'] + ', y = ' + parsedMsg['y']);
        conns.forEach((c) {
          c.send(JSON.stringify(parsedMsg));
        });
      }
      
    };
    
    conn.onClosed = (int status, String reason) {
      print('closed with $status for $reason');
      var result = {};
      result['type'] = 3;
      result['message'] = 'Someone left the game.';
      
      conns.forEach((c) {
        c.send(JSON.stringify(result));
      });
    };
          
    conn.onError = (e) {
      print('Error was $e');
      var result = {};
      result['type'] = 4;
      result['message'] = 'Error has occured.';
      
      conns.forEach((c) {
        //c.send(JSON.stringify(result));
      });
    };
  };
  print('WebSocket server is running...');
  server.listen('127.0.0.1', 3000);
}