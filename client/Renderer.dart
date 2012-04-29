class Renderer {
  Arena arena;
  Element container;
  List<CollisionObject> handlers;
  List<CollisionObject> killingZones;
  
  Renderer(Arena this.arena, Element this.container, List<CollisionObject> this.handlers, List<CollisionObject> this.killingZones);
  
  initRender() {
    arena.collisionObjects.forEach((collisionObject) {
      renderCollisionObject(collisionObject);
    });
    
    renderCollisionObject(arena.ball);
  }
  
  render() {
    moveCollisionObject(arena.ball);
    
    killingZones.forEach((handler) {
      if (handler.killedRightNow) {
        handler.killedRightNow = false;
        
        document.query('#${handler.id}').classes.add('killed');
        window.setTimeout(() {
          document.query('#${handler.id}').classes.remove('killed'); 
        }, 200);
      }
    });
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
    
    e.classes.add(o.getCssClass());
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
  
  
  /* TODO: JAK JE ZAVOLAT Z ARENY? */
  hideCollisionObject(CollisionObject o) {
    Element element = document.query('#${o.id}');
    element.style.visibility = 'hidden';
  }
  
  showCollisionObject(CollisionObject o) {
    Element element = document.query('#${o.id}');
    element.style.visibility = 'visible';
  }

}
