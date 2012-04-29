#import('dart:io');
#import('dart:json');

void main() {
  
  var clients = new List();
  
  HttpServer server = new HttpServer();
  WebSocketHandler wsHandler = new WebSocketHandler();
  server.addRequestHandler((req) => req.path == "/ws", wsHandler.onRequest);
  
  wsHandler.onOpen = (WebSocketConnection conn) {
    print('new connection, number of connections: ' + clients.length);
    
    conn.onMessage = (message) {
      var parsedMsg = JSON.parse(message);
      print("Name of player " + parsedMsg['name']);
      clients.add(parsedMsg['name']);
      var result = {};
      result['type'] = 1;
      result['numberOfClients'] = clients.length;
      conn.send(JSON.stringify(result));
    };
    
    conn.onClosed = (int status, String reason) {
      print('closed with $status for $reason only ' + clients.length + ' left');
      clients.length--;
    };
          
    conn.onError = (e) {
      print('Error was $e only ' + clients.length + ' left');
    };
  };
  print('WebSocket server is running...');
  server.listen('127.0.0.1', 3000);
}