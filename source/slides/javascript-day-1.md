# JavaScript!

---

## A Brief Comparison between Ruby and JavaScript

[Link to video](https://www.destroyallsoftware.com/talks/wat)

---

## Big Differences

* `do..end` vs `{}`
* `==` vs `===`
* methods vs functions
* implicit vs explicit return
* hashes vs "objects"
* classes vs prototypes

---

## Declaring variables

You must _always_ use `var` before declaring a variable the first time. If you don't, it will work, but not do what you expect.

```javascript
// Good
var x = 1;

// BAD
y = 1;
```

---

## Functions

JavaScript _functions_ are like Ruby _methods_,
but they don't always have a containing object.

JavaScript functions can also be used like Ruby _blocks_.

---

```ruby
# Ruby
def welcome(thing)
  "Hello #{thing}!"
end

welcome("class")
# returns "Hello class!"
```

```javascript
// JavaScript
function welcome(thing) {
  return "Hello " + thing + "!";
}

welcome("class");
// returns "Hello class!"
```

---

## Anonymous Functions

```javascript
var welcome = function (thing) {
  return "Hello " + thing + "!";
});

welcome("class")
```

---

## Functions are everything

Functions can be:

* assigned to variables
* passed as arguments
* returned from functions

---

## Functions as arguments

```ruby
# Ruby
[1, 2, 3].each do |number|
  puts number * number
end
```

```javascript
// JavaScript
[1, 2, 3].forEach(function (number) {
  console.log(number * number);
});
```

---

## Returning functions

```javascript
function greet(greeting) {
  return function() {
    return greeting + " world!";
  };
}

var hello = greet("Hello");
var goodbye = greet("Goodbye");

hello(); // Hello world!
goodbye(); // Goodbye world!
```

---

## if-else

```javascript
if (answer === "1") {
  return "Right answer!"
} else if (answer === "2") {
  return "Wrong answer!"
} else {
  return "Invalid answer!"
}
```

---

## while

```ruby
# Ruby
num = 0
while num < 3
  num += 1
  puts num
end
```

```javascript
// JavaScript
var num = 0;
while (num < 3) {
  num++;
  console.log(num);
}
```

---

## for

```javascript
// JavaScript
for (var n = 0; n < 3; n++) {
  console.log(n);
}
```

---

## Resources

* [JSBin](http://jsbin.com)
* [Mozilla Developer Network - JavaScript](https://developer.mozilla.org/en-US/docs/Web/JavaScript)
