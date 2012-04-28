class HandlerListener {
  Handler handler;
  Renderer renderer;
  int keyUpCode;
  int keyDownCode;
  
  HandlerListener(handler, keyUpCode, keyDownCode, renderer) {
    this.handler = handler;
    this.renderer = renderer;
    this.keyUpCode = keyUpCode;
    this.keyDownCode = keyDownCode;
        
    window.on.keyDown.add(handlerMoved);
  }
  
  handlerMoved(e) {
    if (e.keyCode == keyUpCode) {
      handler.moveUp();
    }
    
    if (e.keyCode == keyDownCode) {
      handler.moveDown();
    }
    
    renderer.moveCollisionObject(handler);
  }
}
