class Listeners {
  int i = 0;
  initHandler(handler) {
    
    window.on.keyDown.add(handerMoved);
    
  }
  
  handerMoved(e) {
    i++;
    
    document.query('#arena').innerHTML = '${i}';
  }
}
