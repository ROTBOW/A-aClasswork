Function.prototype.inherits = function (parent) {
    // at this point this refers to constructor of the current class
    // function Surrogate() {}
    // Surrogate.prototype = parent.prototype;


    this.prototype = Object.create(parent.prototype)
    this.prototype.constructor = this;
}




function MovingObject () {}

function Ship () {}
Ship.inherits(MovingObject);

function Asteroid () {}
Asteroid.inherits(MovingObject);

let space_rock = new Asteroid()
let ship1 = new Ship()