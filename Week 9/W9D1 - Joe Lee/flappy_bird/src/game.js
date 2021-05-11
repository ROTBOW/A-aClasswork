import Level from './level';
import Bird from './bird';

export default class FlappyBird {
  constructor(canvas){
    
    this.ctx = canvas.getContext("2d");
    this.dimensions = { width: canvas.width, height: canvas.height };
    this.bird = new Bird(this.dimensions);
    this.level = new Level(this.dimensions);

    canvas.addEventListener('click', () => this.bird.flap())
  }

  animate(running) {
    if (running) {
      
      this.level.animate(this.ctx);

      this.bird.move();
      this.bird.animate(this.ctx);
      requestAnimationFrame(() => this.play());
    } else {
      requestAnimationFrame(() => this.restart());
    }
  }

  restart() {
    this.level = new Level(this.dimensions);
    this.bird = new Bird(this.dimensions);
    
    this.running = false;
    this.animate(this.running);
  }

  play() {
    
    this.running = true;
    this.animate(this.running);
  }

}