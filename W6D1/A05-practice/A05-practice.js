// write String.prototype.mySlice. It should take a start index and an
// (optional) end index.

String.prototype.mySlice = (start, end) => {

    let slice = "";

    if (typeof end === 'undefined') {
        end = this.length;
    }

    for (let i = start; i < end && i < this.length; i++) {
        slice += this[i];
    }

    return slice;

};

// write Array.prototype.myReduce (analogous to Ruby's Array#inject).

Array.prototype.myReduce = (callback) => {

    let acc = this[0];

    this.slice(1).forEach((el) => {
        acc = callback(acc, el);
    });

    return acc;

};


// write Array.prototype.quickSort(comparator). Here's a quick refresher if
// you've forgotten how quickSort works:
//   - choose a pivot element from the array (usually the first)
//   - for each remaining element of the array:
//     - if the element is less than the pivot, put it in the left half of the
//     array.
//     - otherwise, put it in the right half of the array.
//   - recursively call quickSort on the left and right halves, and return the
//   full sorted array.



// write myFind(array, callback). It should return the first element for which
// callback returns true, or undefined if none is found.

function myFind (array, callback) {
    array.forEach( (el) => {
        if (callback(el)) {
            return el;
        }
    });
};


// write sumNPrimes(n)

function sumNPrimes (n) {
    count = 0;
    sum = 0

    for (let i = 2; count < n; i++) {
        if (isPrime(i)) {
            sum += i;
            count += 1;
        }
    }
    return sum;
};

function isPrime (num) {
    
    if (num <= 1) {
        return false;
    };
    
    for (let i = 2; i < num; i++) {
        if (num % i === 0) {
            return false;
        }
    };

    return true;
    
};

// write Function.prototype.myBind.

Function.prototype.myBind = function (ctx, ...bindArgs) {
    return (...callArgs) => {
        return this.apply(ctx, bindArgs.concat(callArgs));
    };
};


// write Function.prototype.inherits.

Function.prototype.inherits = function(ParentClass) {
    function Surrogate() {}
    Surrogate.prototype = ParentClass.prototype;
    this.prototype = new Surrogate();
    this.prototype.constructor = this;
};