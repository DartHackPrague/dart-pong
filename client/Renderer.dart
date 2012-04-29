class Renderer {
  Arena arena;
  Element container;
  List<CollisionObject> handlers;
  
  Renderer(Arena this.arena, Element this.container, List<CollisionObject> this.handlers);
  
  initRender() {
    arena.collisionObjects.forEach((collisionObject) {
      renderCollisionObject(collisionObject);
    });
    
    renderCollisionObject(arena.ball);
  }
  
  render() {
    moveCollisionObject(arena.ball);
  }
  
  renderCollisionObject(CollisionObject o) {
    Element e = getHTMLElementFromCollisionObject(o);
    container.nodes.add(e); 
  }
  
  renderResults() {
    num i = 0;
    StringBuffer text = new StringBuffer();
    
    handlers.forEach((handler) {
      i++;
      
      text.add('Player ${i}: ${handler.countOfDeaths}<br/>');
    });
    
    document.query('#results').innerHTML = text.toString();
  }
  
  getHTMLElementFromCollisionObject(CollisionObject o) {
    Element e = new Element.tag('div');
    e.attributes['id'] = o.id;
    e.classes.add('colision_object');
    e.style.width = '${o.width}px';
    e.style.height = '${o.height}px';
    e.style.top = '${o.y}px';
    e.style.left = '${o.x}px';
    
    return e;
  }
  
  moveCollisionObject(CollisionObject o) {
    Element element = document.query('#${o.id}');
    element.style.left = '${o.x}px';
    element.style.top = '${o.y}px';
  }
}
