class Renderer {
  Arena arena;

  Renderer(Arena this.arena);
  
  render() {
    var ballElement = document.query('#${arena.ball.id}');
    ballElement.style.left = '${arena.ball.x}px';
    ballElement.style.top = '${arena.ball.y}px';
  }
}
