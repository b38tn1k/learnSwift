//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// For Loop
for var i = 1; i < 10; i++ {
    print(i)
}

for var i = 2; i < 21; i += 2 {
    print(i)
}

var myArray:[Double] = [1, 3, 2, 4, 5, 8, 54325, 5]

for x in myArray {
    print(x)
}

for (index, value) in myArray.enumerate() {
    print("index \(index) value \(value)")
    myArray[index] = value/2
}
print(myArray)

