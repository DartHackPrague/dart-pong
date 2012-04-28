class Renderer {
  Arena arena;

  Renderer(Arena this.arena);
  
  render() {
    renderCollisionObject(arena.ball);
  }
  
  renderCollisionObject(CollisionObject o) {
    Element element = document.query('#${o.id}');
    element.style.left = '${o.x}px';
    element.style.top = '${o.y}px';
  }
}
