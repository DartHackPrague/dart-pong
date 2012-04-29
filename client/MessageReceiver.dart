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
  
  onMessage(e) {
    var data = JSON.parse(e.data);
    print(data['type']);
    if (data['type'] == 1) {
      fetchNumberOfPlayers(data);
    }
    
    if (data['type'] == 2) {
      showBall(data);
    }
  }
  
  addCallback(type, callback) {
    callbacks[type] = callback;
  }
  
  fetchNumberOfPlayers(data) {
    if (data['numberOfClients'] > 1 && dartPong.multiplayerId == 1) {
      dartPong.arena.ball.setAsIn();
    } else {
      dartPong.prepareGameForMultiplayer(data['numberOfClients'] > 1 ? 2 : 1); 
    }
  }
  
  showBall(data) {
    if (data['x'] > 500 && dartPong.multiplayerId == 1) {
      dartPong.arena.teleportBallIn(data);
    }
    
    if (data['x'] < 100 && dartPong.multiplayerId == 2) {
      dartPong.arena.teleportBallIn(data);
    }
  }
}
