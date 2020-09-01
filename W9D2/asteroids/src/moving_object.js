

function MovingObject(options) {
    this.pos = options.pos;
        if (this.pos === "undefined") this.pos = [0,0];
    this.vel = options.vel;
        if (this.vel === "undefined") this.vel = [0, 0];
    this.color = options.color;
        if (this.color === "undefined") this.color = "blue";
    this.radius = options.radius;
        if (this.radius === "undefined") this.radius = 50;
}
        
MovingObject.prototype.draw = function(ctx) {
    ctx.fillStyle = this.color;
    ctx.beginPath();
    ctx.arc(this.pos[0], this.pos[1], this.radius, 0, 2 * Math.PI);
    ctx.fill();
}

MovingObject.prototype.move = function() {
    this.pos += this.vel;
}



// 1. Invoke [`beginPath`][beginPath] with no arguments
// 1. Invoke [`arc`][arc] with the appropriate dimensions to draw a circle
// 1. Pick a color to set as `strokeStyle`
// 1. Set the `lineWidth` attribute to some integer
// 1. Invoke `stroke` with no arguments
// 1. Open `index.html` in your browser to view it

// To fill in the circle:

// 1. Pick a color to set as `fillStyle`
// 1. Invoke `fill` with no arguments
// 1. Open `index.html` in your browser to view it


// document.addEventListener("DOMContentLoaded", function(){
//   const canvasEl = document.getElementById("mycanvas");
//   canvasEl.width = 500;
//   canvasEl.height = 500;

//   const ctx = canvasEl.getContext("2d");
//   ctx.fillStyle = "purple";
//   ctx.fillRect(0, 0, 500, 500);

//   ctx.beginPath();
//   ctx.arc(100, 100, 20, 0, 2*Math.PI, true);
//   ctx.strokeStyle = "green";
//   ctx.lineWidth = 5;
//   ctx.stroke();
//   ctx.fillStyle = "blue";
//   ctx.fill();
// });








module.exports = MovingObject;

// module.exports = { Animal: Animal, Cat: Cat, newAnimal: newAnimal };
