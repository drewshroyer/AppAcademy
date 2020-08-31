
// FROM TEST Write a `Function.prototype.inherits(ParentClass)` method. It should extend
// the methods of `ParentClass.prototype` to `ChildClass.prototype`.
//
// **Do NOT use `Object.create`, `Object.assign`, `Object.setPrototypeOf`, or
// modify the `__proto__` property of any object directly.**

Function.prototype.inherits = function(Parent) {    // FOUR STEPS
    function Surrogate() { }                        // 1. Define a Surrogate class
        Surrogate.prototype = Parent.prototype;     // 2. Set the prototype of the Surrogate (Surrogate.prototype = SuperClass.prototype)
        this.prototype = new Surrogate();           // 3. Subclass.prototype = new Surrogate()
        this.prototype.constructor = this;          // 4. Subclass.prototype.constructor = Subclass
}


/// USING Object.create 

const asteroid = Object.create(MovingObject);

Function.prototype.inherits2 = function (Parent) {
    this.prototype = Object.create(Parent.prototype);
    this.prototype.constructor = this;             // otherwise instances of Dog will have 'instance.constructor === Animal'
}

// ll objects (with the exception of objects created with Object.create(null)) will have a constructor property. Objects created without the explicit use of a constructor function (such as object- and array-literals) will have a constructor property that points to the Fundamental Object constructor type for that object.

https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/createfunction Tree(name) {
  