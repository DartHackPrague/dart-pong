class Listeners {
  Handler handler;
  Renderer renderer;
  
  Listeners(handler, renderer) {
    this.handler = handler;
    this.renderer = renderer;
        
    window.on.keyDown.add(handlerMoved);
  }
  
  handlerMoved(e) {
    if (e.keyCode == 38) {
      handler.moveUp();
    }
    
    if (e.keyCode == 40) {
      handler.moveDown();
    }
    
    renderer.renderCollisionObject(handler);
  }
}
