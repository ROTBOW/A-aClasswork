const prompt = require('prompt-sync')({sigint: true});


let Hanoi = function (player) {
    this.pegs = [ [], [], [] ];
    this.player = player;
}


Hanoi.prototype.setPegs = function () {
    let discs = [1,2,3];

    this.pegs.forEach(peg => {
        let temp = Math.floor(Math.random() * discs.length);
        peg.push(discs[temp]);
        discs.splice(temp, 1);
    });

}

Hanoi.prototype.show = function() {
    console.log(this.pegs);
}

function isntValid (str) {
    let re = /\d,\d/g;
    return !re.test(str);
}

Hanoi.prototype.getMove = function () {
    console.log('pls make your move, like so 1,2\n');
    let move = prompt();

    if (isntValid(move)) {
        return -0;
    }

    move = move.split(',')
    move = move.map(num => Number(num));
    return move;
}

Hanoi.prototype.makeMove = function (move) {
    if (move == -0) {
        return undefined;
    }

    firstPeg = move[0];
    newPeg = move[1];
    let disc = this.pegs[firstPeg].shift();
    this.pegs[newPeg].unshift(disc);
}

Hanoi.prototype.checkWin = function () {
    let answer = [1,2,3]
    for (let i = 0; i < 3; i++) {
        let right = 0;
        for (let j = 0; j < 3; j++) {
            if (this.pegs[i][j] === answer[j]) {
                right++
            }
        }
        if (right === 3) {
            return true;
        }
    }
    return false;
}

Hanoi.prototype.play = function () {
    this.setPegs();

    while (true) {
        this.show();
        if (this.checkWin()) {
            break;
        }
        this.makeMove(this.getMove());
    }

    console.log(`great job ${this.player}, you did it.`)
}

let game1 = new Hanoi("Johnny");

game1.play();

// game1.setPegs();
// console.log(game1.pegs);
// game1.makeMove([1,2]);
// console.log(game1.pegs);