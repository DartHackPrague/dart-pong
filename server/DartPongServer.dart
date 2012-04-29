#import('dart:io');
#import('dart:json');

void main() {
  
  int clients;
  WebSocketConnection conn1;
  WebSocketConnection conn2;
  
  HttpServer server = new HttpServer();
  WebSocketHandler wsHandler = new WebSocketHandler();
  server.addRequestHandler((req) => req.path == '/ws', wsHandler.onRequest);
  
  wsHandler.onOpen = (WebSocketConnection conn) {
    print('new connection');
    if (conn1 == null) {
      conn1 = conn;
    } else {
      conn2 = conn;
    }
    
    conn.onMessage = (message) {
      var parsedMsg = JSON.parse(message);
      var result = {};
      if (parsedMsg['type'] == 1) {
        clients++;
        print('First player has joined to the game.');
        result['type'] = 1;
        result['numberOfClients'] = clients;
        result['message'] = 'One player is waiting for opponent.';
        conn1.send(JSON.stringify(result));
        if(conn2 != null) {
          conn2.send(JSON.stringify(result));
        }
      }
      if (parsedMsg['type'] == 2) {
        print('Ball crosses the teleport zone with x = ' + parsedMsg['x'] + ', y = ' + parsedMsg['y']);
        conn1.send(message);
        if(conn2 != null) {
          conn2.send(message);
        }
      }
      
    };
    
    conn.onClosed = (int status, String reason) {
      print('closed with $status for $reason');
      var result = {};
      result['type'] = 3;
      result['message'] = 'Someone left the game.';
      conn1.send(JSON.stringify(result));
      if(conn2 != null) {
        conn2.send(JSON.stringify(result));
      }
    };
          
    conn.onError = (e) {
      print('Error was $e');
      var result = {};
      result['type'] = 4;
      result['message'] = 'Error has occured.';
      conn1.send(JSON.stringify(result));
      if(conn2 != null) {
        conn2.send(JSON.stringify(result));
      }
    };
  };
  print('WebSocket server is running...');
  server.listen('127.0.0.1', 3000);
}