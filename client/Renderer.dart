class Renderer {
  Arena arena;
  Element container;
  
  Renderer(Arena this.arena, Element this.container);
  
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
