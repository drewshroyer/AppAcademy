Array.prototype.uniq = function() {

   let uniqAnswer = this.filter((c, index) => {
   return this.indexOf(c) === index; 
    
   }); 
   console.log(uniqAnswer); 

   return uniqAnswer;
}

// let arr = [1, 2, 3, 4, 5, 5, 5, 2, 3, 3]
// let arr2 = [0,0,0,0]
// arr.uniq()
// arr2.uniq()

// let variable = "hello";
// console.log("something")

// Array.prototype.demo = function() {
//    console.log("hello")
// }

// Array.prototype.twoSum = function() {

//    const pairsArr = []
//    for(let i = 0; i < this.length; i++) {
//       for (let j = i+1; j < this.length; j++) {
//          if(this[i] + this[j] === 0) pairsArr.push([this[i], this[j]])
//       }
//    }
//    console.log(pairsArr);

//    return pairsArr;
// }

// arr = [1, -1, -2, 2, 3, 3, 5, -6, -5, 0]
// arr.twoSum()

Array.prototype.transpose = function() {
   // console.log(this)
   let rows = this.length;
   let columns = this[0].length;
   let transpossed = new Array(rows).fill(new Array(columns)) ;
   // let transpossed = new Array();
   // console.log(transpossed);
   for(y = 0; y < columns; y++){
      for (x = 0; x < rows; x++) {
         transpossed[y][x] = this[x][y]
         // console.log(transpossed);
      }
   }
   console.log(transpossed);

   return transpossed;
}

// const arr22 = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
// // console.log(arr22);
// arr22.transpose()

// Array.prototype.transpose2 = function () {
//   array[0].map((_, colIndex) => array.map(row => row[colIndex]));
// }

// let arr = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
// arr.transpose2()

// const callback = function(arg) {
//    return arg;
// }

