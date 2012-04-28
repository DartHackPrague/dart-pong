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
    Element e = o.getHTMLElement();
    container.nodes.add(e); 
  }
  
  moveCollisionObject(CollisionObject o) {
    Element element = document.query('#${o.id}');
    element.style.left = '${o.x}px';
    element.style.top = '${o.y}px';
  }
}
