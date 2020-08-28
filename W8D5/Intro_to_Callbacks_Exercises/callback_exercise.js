// class Clock {
//     constructor() {
//         const d = new Date();
//         this.seconds = d.getSeconds(); 
//         this.minutes = d.getMinutes(); 
//         this.hours = d.getHours();
    
//     this.printTime();
//     setInterval(this._tick.bind(this), 1000);
//     }

//     printTime() {
//         let time = `${this.hours}:${this.minutes}:${this.seconds}`;
//         console.log(time);
//     }

//     _tick() {
//         this._incrementSeconds();
//         this.printTime();
//     }

//     _incrementSeconds() {
//         this.seconds += 1;
//         if (this.seconds === 60) {
//             this.seconds = 0;
//             this._incrementMinutes();
//         }
//     }

//     _incrementMinutes() {
//         this.minutes += 1;
//         if (this.minutes === 60) {
//             this.minutes = 0;
//             this._incrementHours();
//         }
//     }

//     _incrementHours() {
//         this.hours += 1;
//         if (this.hours === 24) {
//             this.hours = 0;
//             this.minutes = 0;
//             this.seconds = 0;
//         }
//     }    
// } 

// const clock = new Clock; 

//setInterval(callback, delay[, ...args])


//      callback < Function > The function to call when the timer elapses.
//     delay < number > The number of milliseconds to wait before calling the callback.
// ...args < any > Optional arguments to pass when the callback is called.
//     Returns: <Timeout> for use with clearInterval()
//     Schedules repeated execution of callback every delay milliseconds.

//     When delay is larger than 2147483647 or less than 1, the delay will be set to 1. Non-integer delays are truncated to an integer.

// If callback is not a function, a TypeError will be thrown.


// const readline = require("readline"); 
// const reader = readline.createInterface( {
//     input: process.stdin, 
//     output: process.stdout
// }); 

const readline = require('readline');

const reader = readline.createInterface({
    input: process.stdin,
    output: process.stdout,
    terminal: false
});

function addNumbers(sum, numsLeft, completionCallback){
    if (numsLeft > 0) {
        reader.question("Enter a Number:", numString => { //async
            sum += parseInt(numString); 
            console.log(sum);
            addNumbers(sum, numsLeft-1, completionCallback)
        });
    } else {
        completionCallback(sum);
    }
} 

console.log(addNumbers(0, 3, sum => {
    console.log(`Total Sum: ${sum}`)
    reader.close();
}))