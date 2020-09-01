const Bullet = require("./bullet.js");
const Utils = require("./utils");
const Asteroid = require("./asteroid.js");
const MovingObject = require("./moving_object.js");
const Game = require("./game.js");
const GameViews = require("./game_view.js");
const Ship = require("./ship.js");

document.addEventListener("DOMContentLoaded", function(){
  const canvasEl = document.getElementsByTagName("canvas")[0]; // this and the line below both will work 
    // const canvasEl = document.getElementsById("game-canvas");
  canvasEl.width = 500;
  canvasEl.height = 500;

  const ctx = canvasEl.getContext("2d");

  window.MovingObject = MovingObject;
  window.ctx = ctx;
});






