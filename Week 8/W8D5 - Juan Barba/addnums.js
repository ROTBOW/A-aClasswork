const readline = require("readline");
const reader = readline.createInterface ({
    input: process.stdin,
    output: process.stdout
});

const prompt = require('prompt-sync')();

// let test = reader.question(" ", el => {
//     console.log(el);
//     reader.close();
// });

function addNumbers (sum, numsLeft, completionCallback){

    while(numsLeft > 0){
        console.log(sum);
        let new_num = prompt();
        sum+=Number(new_num);
        numsLeft--;
    }

    completionCallback(sum);
}

// addNumbers(0, 3, sum => console.log(`Total Sum: ${sum}`));


function addNumbers2(sum, numsLeft, completionCallback) {

    function loopStep () {
        if (numsLeft === 0) {
            completionCallback(sum);
            reader.close();
            return;
        }
        numsLeft--;
        reader.question('bruh', el => {
            sum += Number(el);
            console.log(sum);
            loopStep();
        });
    }
    loopStep();
}


addNumbers2(0, 3, sum => console.log(`Total Sum: ${sum}`));
