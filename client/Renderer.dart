class Renderer {
  Arena arena;

  Renderer(Arena this.arena);
  
  render() {
    var ball = document.query('#ball');
    ball.style.left = arena.ball.x;
    ball.style.top = arena.ball.y;
  }
}
