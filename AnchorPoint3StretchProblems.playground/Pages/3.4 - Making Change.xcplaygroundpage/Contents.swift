//: [Previous](@previous)
/*:
 # Thursday Stretch Problem 3.4
 ## Making Change
 
 ### Instructions:
 Make a function that takes in a given amount of money (i.e. 2.15) and returns a string of the amount of dollars, quarters, dimes, nickels, and pennies needed to make that amount of money. Return something like: Your change is 1 quarter, 2 dimes, 0 nickels, and 1 penny.
 
 ### Black Diamond 💎💎💎
 Make a function that takes in the cost of an item, and the amount of money paid (i.e. cost: $2.15, amount paid: $5.00) and then returns a string detailing the amount of change in dollars, quarters, dimes, nickels, and pennies.
 
 When this works, try to recreate Swift's built-in filter function. Just like the Swift function, it should be generic and it should take a closure that returns a Bool, from which it determines how to filter your sequence type.
 */

import Foundation
// 2.34
func getChange(money: Double) -> String {
    var change: String = ""
    //234
    var pennies = money * 100
    
    let numDollars = getDollars(pennies: pennies)
    if numDollars == 1 { change += "\(numDollars) Dollar "} else {change += "\(numDollars) Dollars "}
    pennies = pennies - Double(numDollars*100)
    
    let numQuarters = getQuarters(pennies: pennies)
    if numQuarters == 1 { change += "\(numQuarters) Quarter " } else { change += "\(numQuarters) Quarters " }
    pennies = pennies - Double(numQuarters*25)
    
    let numDimes = getDimes(pennies: pennies)
    if numDimes == 1 {change += "\(numDimes) Dime " } else { change += "\(numDimes) Dimes " }
    pennies = pennies - Double(numDimes*10)
    
    let numNickels = getNickels(pennies: pennies)
    if numNickels == 1 { change += "\(numNickels) Nickel " } else { change += "\(numNickels) Nickels " }
    pennies = pennies - Double(numNickels*5)
    
    let numPennies = getPennies(pennies: pennies)
    if numPennies == 1 { change += "\(getPennies(pennies: pennies)) Penny " } else { change += "\(getPennies(pennies: pennies)) Pennies " }
    pennies = pennies - Double(numPennies)
    
    return change
}

func getDollars(pennies: Double) -> Int {
    
    var trackPennies = pennies
    var numDollars: Int = 0
    //94
    //200
    if trackPennies >= 100 {
        numDollars += 1
        trackPennies = trackPennies - 100
        //0
        //100
        numDollars = numDollars + getDollars(pennies: trackPennies) // 2
    }
    
    return numDollars //0
}

func getQuarters(pennies: Double) -> Int {
    var trackPennies = pennies
    var numQuarters: Int = 0
    if pennies >= 25 {
        numQuarters += 1
        trackPennies = trackPennies - 25
        numQuarters = numQuarters + getQuarters(pennies: trackPennies)
    }
    
    return numQuarters
}

func getDimes(pennies: Double) -> Int {
    var trackPennies = pennies
    var numDimes: Int = 0
    if pennies >= 10 {
        numDimes += 1
        trackPennies = trackPennies - 10
        numDimes = numDimes + getDimes(pennies: trackPennies)
    }
    
    return numDimes
}

func getNickels(pennies: Double) -> Int {
    var trackPennies = pennies
    var numNickels: Int = 0
    if pennies >= 5 {
        numNickels += 1
        trackPennies = trackPennies - 5
        numNickels = numNickels + getNickels(pennies: trackPennies)
    }
    
    return numNickels
}

func getPennies(pennies: Double) -> Int {
    var trackPennies = pennies
    var numPennies: Int = 0
    if pennies > 0 {
        numPennies += 1
        trackPennies = trackPennies - 1
        numPennies = numPennies + getPennies(pennies: trackPennies)
    }
    return numPennies
}

let change = getChange(money: 2.00)



// Black Diamond Attempt


func returnChange(cost: Double, paid: Double) -> String {
    let change = paid - cost
    if change < 0 {
        return "Not enough paid"
    }
    return getChange(money: change)
}

let changeFromPayment = returnChange(cost: 2.19, paid: 10)

//: [Next](@next)
