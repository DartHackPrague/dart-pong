class MessageReceiver {
  WebSocket ws;
  Map callbacks;
  
  MessageReceiver(ws) {
    this.ws = ws;
    
    initListeners();
  }
  
  initListeners() {
    ws.on.message.add( onMessage );
  }
  
  onMessage(e) {
    print(e);
    //var type = e.data.type;
    
    
  }
  
  addCallback(type, callback) {
    callbacks[type] = callback;
  }
}
