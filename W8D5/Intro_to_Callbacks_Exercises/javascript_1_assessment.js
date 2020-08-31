// const { Hash } = require("crypto");

function binarySearch(array, target) {
    if (array.length === 0) return -1; 

    let probe = array.length / 2
    let caseNum = Math.sign(target - probe);

    if (caseNum === 0) {
        return probe;
    } else if (caseNum === -1) {
        binarySearch(array, target)
    } else (caseNum === 1) 
        let subanswer = binarySearch(array.slice(probe + 1, -1), target)
        if (subanswer === -1) { 
            return -1; 
          }  else  {
              return probe + 1 + subanswer;
          }
    
}

// console.log(binarySearch([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], 4))

function factors(num) {
    let allNums = [];
    for(i=1; i<num; i++) {
        allNums.push(i);
    }
    return allNums.filter(el => num % el === 0);
}

// console.log(factors(32))
// console.log(factors(775))

function factorials_rec(num) {
    if (num === 1) return 1;

    return num * factorials_rec(num - 1);
}

// console.log(factorials_rec(6))

function fibs_sum(num) {
    if (num === 1) return 1;
    if (num === 2) return 2;

    return fibs_sum(num - 1) + fibs_sum(num - 2) + 1;
}

// console.log(fibs_sum(40))

// Write a function `firstEvenNumbersSum(n)` that returns the sum of the
// first n even numbers recursively. Assume n > 0

function firstEvenNumbersSum(n) {
    if (n === 1) return 2;

    return (2 * n) + firstEvenNumbersSum(n - 1);
}

// console.log(firstEvenNumbersSum(4))

// Write an `Array.prototype.median` method that returns the median of elements
// in an array. If the length is even, return the average of the middle two 
// elements.

Array.prototype.median = function(array) {
    if(this.length % 2 !==0) {
        console.log(this[(this.length / 2) - .5]);
        return this[this.length / 2];
    } else {
        let midSum = this[this.length / 2] + this[(this.length / 2) - 1]
        console.log(midSum / 2);
        return midSum / 2;
    }
}

// array = [1, 2, 3, 4, 5, 8, 9, 100, 101]
// array2 = [1, 2, 3, 4]
// array.median()
// array2.median()

function anagrams(str1, str2) {
    let map1 = {};
    for(i = 0; i < str1.length; i++) {
        if (!Object.keys(map1).includes(str1[i])) {
            map1[str1[i]] = 1;
        } else {
        map1[str1[i]] += 1;
        }
    }
    for(x = 0; x < str2.length; x++) {
        if (!Object.keys(map1).includes(str1[i])) {
            return false;
        } else {
        map1[str2[i]] -= 1;
        }
    }
    return Object.values(map1).every(letterCount => letterCount === 0);
}


// console.log(anagrams('listen', 'silent')) //=> true
// console.log(anagrams('listen', 'potato')) //=> false
// console.log(anagrams('dog', 'dog')) //=> true

Array.prototype.quickSort = function (func) {
    if (this.length <= 1) return this;

    if (!func) {
        func => (x, y) => {
            if (x < y) return -1;
            return 1
        };
    }

    const pivot = this[0];
    let left = this.slice(1).filter((el) => func(el, pivot) === -1);
    let right = this.slice(1).filter((el) => func(el, pivot) === 1);

    left.quickSort(func);
    right.quickSort(func);

    return left.concat([pivot]).concat(right);
}

array = [1, 202, 312, 421, 5, 8, 9, 100, 101]
array.quickSort()

