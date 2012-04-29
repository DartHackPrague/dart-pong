#import('dart:io');
#import('dart:json');

void main() {
  
  var clients = new List();
  
  HttpServer server = new HttpServer();
  WebSocketHandler wsHandler = new WebSocketHandler();
  server.addRequestHandler((req) => req.path == '/ws', wsHandler.onRequest);
  
  wsHandler.onOpen = (WebSocketConnection conn) {
    print('new connection, number of connections: ' + clients.length);
    
    conn.onMessage = (message) {
      var parsedMsg = JSON.parse(message);
      var result = {};
      if (parsedMsg['type'] == 1) {
        print(parsedMsg['name'] + ' has joined to the game.');
        clients.add(parsedMsg['name']);
        
        result['type'] = 1;
        result['numberOfClients'] = clients.length;
        conn.send(JSON.stringify(result));
      }
      if (parsedMsg['type'] == 2) {
        print('Ball crosses the teleport zone with x = ' + parsedMsg['x'] + ', y = ' + parsedMsg['y']);
        conn.send(message);
      }
      
    };
    
    conn.onClosed = (int status, String reason) {
      print('closed with $status for $reason and ' + clients.length + ' clients remaining...');
      clients.length--;
    };
          
    conn.onError = (e) {
      print('Error was $e and ' + clients.length + ' clients remaining...');
    };
  };
  print('WebSocket server is running...');
  server.listen('127.0.0.1', 3000);
}