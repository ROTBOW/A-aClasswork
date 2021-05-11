import CONSTANTS from './constants'
export default class Bird {
  constructor(dimensions) {
    this.velocity = 0;
    this.y = dimensions.height / 2;
    this.x = dimensions.width * 0.3;

  }

  drawBird(context) {
    
    context.fillStyle = 'yellow';
    context.fillRect(this.x, this.y, CONSTANTS.BIRD_WIDTH, CONSTANTS.BIRD_HEIGHT);
  }

  animate(context) {
    this.drawBird(context);
  }

  flap() {
    this.velocity = CONSTANTS.FLAP_SPEED;
  }

  move() {

    // velocity = -8,
    // Gravity = 0.8
    this.y += this.velocity + CONSTANTS.GRAVITY;
    this.velocity += 0.3;
    if (this.velocity >= CONSTANTS.TERMINAL_VEL) {
      this.velocity = CONSTANTS.TERMINAL_VEL;
    }
  }

}

// Frame 1
   // velocity = 0,
    // Gravity = 0.8
    // y = 0

    // Frame 2
   // velocity = 0,
    // Gravity = 0.8
    // y = 0.8

    // Frame 3
   // velocity = -8,
    // Gravity = 0.8
    // y = -7.2

    // Frame 4
   // velocity = -7.8,
    // Gravity = 0.8
    // y = -15

    // Frame 5
   // velocity = -7.6,
    // Gravity = 0.8
    // y = 0

    // Frame 6
   // velocity = -7.8,
    // Gravity = 0.8
    // y = 0
