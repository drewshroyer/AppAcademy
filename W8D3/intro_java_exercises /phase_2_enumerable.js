arr47 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

Array.prototype.myEach = function (func) {

    for (i = 0; i < this.length; i++) {
        func(this[i]);
    }
};

arr47.myEach((num) => {
    console.log(`${num * 3} is ${num} times 3`);
});

// myMap 

Array.prototype.myMap = function (func) {
    const results = [];
    this.myEach(num => results.push(func(num)));
    return results;
}

console.log([1, 2, 3].myMap(num => num + 2));



Array.prototype.myReduce = function (func, initial_val) {

    let arr = this;

    if (initial_val === undefined) {
        initial_val = arr[0];
        arr = arr.slice(1);
    }

    let result = initial_val;

    arr.myEach(ele => result = func(result, ele));

    return result;
}

console.log([1, 2, 3, 4, 5, 6].myReduce((acc, ele) => acc + ele));