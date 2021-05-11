

function sum() {
  return Array.from(arguments).reduce((acc, ele) => acc + ele)
}

function spreadSum(...args) {
  return args.reduce((acc, ele) => acc + ele)
}


Function.prototype.myBind = function(ctx, ...args) {
  return (...callArgs) => {
    this.apply(ctx, [ ...args, ...callArgs ]);
  }
}

// class Cat {
//   constructor(name) {
//     this.name = name;
//   }

//   says(sound, person) {
//     console.log(`${this.name} says ${sound} to ${person}!`);
//     return true;
//   }
// }

// class Dog {
//   constructor(name) {
//     this.name = name;
//   }
// }

// const markov = new Cat("Markov");
// const pavlov = new Dog("Pavlov");

// markov.says("meow", "Ned");
// // Markov says meow to Ned!
// // true

// // bind time args are "meow" and "Kush", no call time args
// markov.says.myBind(pavlov, "meow", "Kush")();
// // Pavlov says meow to Kush!
// // true

// // no bind time args (other than context), call time args are "meow" and "a tree"
// markov.says.myBind(pavlov)("meow", "a tree");
// // Pavlov says meow to a tree!
// // true

// // bind time arg is "meow", call time arg is "Markov"
// markov.says.myBind(pavlov, "meow")("Markov");
// // Pavlov says meow to Markov!
// // true

// // no bind time args (other than context), call time args are "meow" and "me"
// const notMarkovSays = markov.says.myBind(pavlov);
// notMarkovSays("meow", "me");
// // Pavlov says meow to me!
// // true



// maxNums = 3
function curriedSum(maxNums) {
  const numbers = []
    return function _curriedSum(num) {
      // numbers.length = 2
      // num = 1
      numbers.push(num);
      if (numbers.length >= maxNums) return numbers.reduce((acc, ele) => acc + ele)
      return _curriedSum;
    }
  
}



Function.prototype.curry = function(numArgs) {
  const params = [];
  const that = this;
  // numArgs = 3

  return function _curry(ele) {
    params.push(ele)
    return (numArgs === params.length) ? that(...params) : _curry;
  }
}


function addThree(num1, num2, num3) {
  return num1 + num2 + num3;
}








// function sumThree(num1, num2, num3) {
//   return num1 + num2 + num3;
// }

// sumThree(4, 20, 6); // == 30

// // you'll write `Function#curry`!
// let f1 = sumThree.curry(3); // tells `f1` to wait until 3 arguments are given before running `sumThree`
// f1 = f1(4); // [Function]
// f1 = f1(20); // [Function]
// f1 = f1(6); // = 30

// // or more briefly:
// sumThree.curry(3)(4)(20)(6); // == 30