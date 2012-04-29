class MessageReceiver {
  WebSocket ws;
  Map callbacks;
  DartPong dartPong;
  
  MessageReceiver(ws, dartPong) {
    this.ws = ws;
    this.dartPong = dartPong;
    
    initListeners();
  }
  
  initListeners() {
    ws.on.message.add( onMessage );
  }
  
  onMessage(e) {print('f');return;
    var data = JSON.parse(e.data);
    
    if (data['type'] == 1) {
      fetchNumberOfPlayers(data);
    }
    
    if (data['type'] == 2) {
      fetchNumberOfPlayers(data);
    }
  }
  
  addCallback(type, callback) {
    callbacks[type] = callback;
  }
  
  fetchNumberOfPlayers(data) {
    dartPong.prepareGameForMultiplayer(data['numberOfClients'] > 1 ? 2 : 1);
    
    if (data['numberOfClients'] > 1 && dartPong.multiplayerId == 1) {
      dartPong.arena.ball.setAsIn();
    }
  }
  
  showBall(data) {
    //dartPong.arena.
  }
}
