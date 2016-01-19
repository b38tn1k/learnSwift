//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var isPrime = true
var divisors:[Int] = []
var input = 48

for var i = 2; i < input; i++ {
    if input % i == 0 {
        isPrime = false
        divisors.append(i)
    }
}

print(isPrime)
if !isPrime {
    print(divisors)
}

var i = 1
while i <= 6 {
    if i > 4 {
        print(3*i)
    }
    i++
}