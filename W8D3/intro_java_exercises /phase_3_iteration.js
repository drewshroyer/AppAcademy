function bubbleSort(array) {
    let swap; 
    let n = array.length - 1; 
    let result = array; 
    do {
        swap = false; 
        for(let i =0; i < n; i++) {
            if (result[i] > result[i + 1]) {
                let temp = result[i]; 
                result[i] = result[i + 1]; 
                result[i + 1] = temp; 
                swap = true; 
            }
        }
        n--; 
    } while(swap); 
    return result; 
}
console.log(bubbleSort([1, 6, 3, 1, 3]))


function subStrings(string) {

    let result = [];
    for(let i=0; i < string.length; i++) {
        for(let x=1; x < string.length; x++){
            if (x >= i && string.slice(i, x) !== "" && !result.includes(string.slice(i, x))) {
            result.push(string.slice(i,x));
            }
        }
    }
    return result;
}

console.log(subStrings("alibaba"))
console.log(subStrings("appacademy"))