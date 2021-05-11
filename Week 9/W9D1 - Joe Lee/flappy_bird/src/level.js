import CONSTANTS from './constants'

class Pipe {
  constructor(x, y) {
    this.x = x;
    this.y = y;
  }

  drawPipe(ctx) {
    ctx.fillStyle = "red";
    ctx.fillRect(this.x, this.y, 20, 100);
  }

  animate(ctx) {
    this.move();
    this.drawPipe(ctx);
  }

  move() {
    this.x += CONSTANTS.SCROLL_SPEED;
  }

}


export default class Level {
  constructor(dimensions) {
    this.dimensions = dimensions;
    this.pipes = [];
    this._createPipe();
  }

  _createPipe() {
    let startPos = 0;
    for (let i = 0; i < 3; i++) {
      this.pipes.push(new Pipe(startPos, 0))
      startPos += CONSTANTS.PIPE_GAP
    }
  }

  drawBackground(ctx) {
    ctx.fillStyle = "skyblue";
    ctx.fillRect(0, 0, this.dimensions.width, this.dimensions.height);
  }

  animate(ctx) {
    this.drawBackground(ctx);
    if (this.pipes[0].x < 0) {
      this.pipes.shift();
      this.pipes.push(new Pipe(this.dimensions.width, 0))
    }
    this.pipes.forEach(pipe => pipe.animate(ctx))
  }
}