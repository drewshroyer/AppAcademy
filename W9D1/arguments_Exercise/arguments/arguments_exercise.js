

function sum([...numbers]) {
    const sum = 0;
    for(i=0;i<numbers.length;i++) {
        sum += numbers[i];
    }
    return console.log(sum);
}

// let arr = [1,2,3,45,5,4];
// sum(arr);

class Cat {
    constructor(name) {
        this.name = name;
    }

    says(sound, person) {
        console.log(`${this.name} says ${sound} to ${person}!`);
        return true;
    }
}

class Dog {
    constructor(name) {
        this.name = name;
    }
}

const markov = new Cat("Markov");
const pavlov = new Dog("Pavlov");



Function.prototype.myBind = function (ctx,...bindArgs) {

    const that= this;
    return function(...callArgs) {
        return that.apply(ctx, bindArgs.concat(callArgs));
 };
};

// markov.says("meow", "Ned");
// markov.says.myBind(pavlov, "meow", "Kush")();
// markov.says.myBind(pavlov)("meow", "a tree");
// markov.says.myBind(pavlov, "meow")("Markov");
// const notMarkovSays = markov.says.myBind(pavlov);
// notMarkovSays("meow", "me");

function curriedSum(numArgs){
    const numbers = [];
    
        function _curry(num){
            numbers.push(num);

            if (numbers.length === numArgs){
                const sum = numbers.reduce((acc,el) => acc + el);
                // numbers.forEach((num) => {total += num});  **this satisfies the same as the answer above 
                // console.log(sum);    **this printed the answer twice 
                return sum;             
            } else { 
                return _curry;
            }
        }
    return _curry;
}

// const sum2 = curriedSum(4);
// sum2(5)(30)(20)(1); // => 56


// FROM TEST: Write a `Function.prototype.myCurry(numArgs)` method that collects arguments
// until the number of arguments collected is equal to the original `numArgs` 
// value and then invokes the curried function.

Function.prototype.myCurry = function (numArgs) {
    let nums = [];
    let fcn = this;
    return function _myCurry (el) {
        nums.push(el);
        if (nums.length < numArgs) {
          return _myCurry;
        } else {
          return fcn.apply(null, nums);
        }
    };
};