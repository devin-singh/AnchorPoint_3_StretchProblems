/*:
 # Monday Stretch Problem 3.1
 ## Closures
 
 ### Instructions:
 1. User filter to create an array that contains all the numbers that are multiples of 3 from the numbersArray. Print your result.
 2. Find the largest number from the previous number array and then print it. Use reduce to solve. Print your result.
 3. Join all the string objects in the stringsArray into one string using reduce. Make sure spaces are in between each string. Print your result.
 
 ### Black Diamond 💎💎💎
 In one line convert blackDiamondDictionary into a joined string describing Mama, Papa, and Baby bear's porridge temperature. CompactMap, Reduce, and anonymouse closure arguments will be your friend.
*/

import Foundation

var numbersArray = [11,24,45,44,59,43,88,93,58,11,13,14,15,190]
var stringsArray = ["I", "Love", "DevMountain"]
var blackDiamondDictionary = ["Mama" : "too cold", "Papa" : "too hot", "Baby" : "just right"]

// Google: Swift higher order functions
var multiplesOfThree = numbersArray.filter { $0 % 3 == 0 }
print(multiplesOfThree)


let largestNum = multiplesOfThree.reduce(0, { max($0, $1) })

print(largestNum)

// $0 in this case is the initial value in this case. It is not each element in the array
let oneString = stringsArray.reduce("", { $0 + $1 })
print(oneString)


let final = blackDiamondDictionary.reduce("") {(string, element) in return "\(element.key)'s porriage is \(element.value) \n" + string}

print(final)
//: [Next](@next)
