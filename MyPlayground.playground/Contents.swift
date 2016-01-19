//: Playground - noun: a place where people can play

import UIKit

// Strings
var str = "Hello, playground"
var name = "james"
print("hello \(name).")
print("hello " + name + ".")

// Ints
var int:Int = 9
(int+1)/2
print("hello \(int).")

// Doubles
var number:Double = 1.5

//Booleans
var isTrue = true

// Arrays
var myArray = [12, 12, 43, 44, "hi"]
print(myArray[0])
print(myArray.count)
myArray.append("hello")
print(myArray)
myArray.removeAtIndex(0)
print(myArray)
var numberArray = [33, 44, 22, 66, 3425]
print(numberArray)
numberArray.sort()
print(numberArray.sort())

//Dictionaries
var myDict = ["computer" : "mac", "cat" : "none", "coffee" : "required"]
print(myDict["coffee"]!)                                // Remember to force unwrap with !
myDict["pen"] = "havent used one in a while"
myDict.removeValueForKey("computer")

// if
var age = 20
if age >= 18 {
    print("you old")
} else {
    print("sorry")
}

if age >= 18 && age == 20 {
    print("yay")
}

var thisIsTrue = true

if thisIsTrue {
    print("true")
}
