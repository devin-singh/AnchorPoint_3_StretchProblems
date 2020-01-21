//: [Previous](@previous)

/*:
 # Tuesday Stretch Problem 3.2
 ## JSONSerialization
 
 ### Instructions:
 * Create a person class with four properties: **name**, **age**, **hasLice**, and **siblingNames**. Choose the correct types for each.
 * Make a failable initializer that takes in a dictionary of type String : Any.
 * Test this initializer on the *testDictionary* to make sure it works.
 
 ### Instructions continued
 * Read about [JSONSerialization](https://developer.apple.com/documentation/foundation/jsonserialization)
 * Use a Do/Try/Catch to do the following steps:
 * Use the JSONSerialization class to deserialize the *data* using the jsonObject function.
 * Cast the result of the jsonObject function into a [String: Any] dictionary and use it to initialize a Person
 */

import UIKit



let jsonString = """

{

"name": "Derek",

"age": 28,

"hasLice": false,

"timeSinceBirth": 28.2345,

"siblingNames": ["Eve","Harmon","Gerald","Marty"]

}

"""

let data = jsonString.data(using: .utf8, allowLossyConversion: false)!


class Person {
    
    var name: String?
    var age: Int?
    var hasLice: Bool?
    var timeSinceBirth: Double?
    var siblingNames: [String]?
    
    init?(dict: [String: Any]) {
        self.age = dict["age"] as? Int
        self.name = dict["name"] as? String
        self.hasLice = dict["hasLice"] as? Bool
        self.timeSinceBirth = dict["timeSinceBirth"] as? Double
        self.siblingNames = dict["siblingNames"] as? [String]
    }
}

let testDictionary: [String: Any] = ["name":"Derek","age":28,"hasLice":false,"timeSinceBirth":28.2345,"siblingNames":["Eve","Harmon","Gerald","Marty"]]

let person = Person(dict: testDictionary)

person?.age
person?.name
person?.hasLice
person?.timeSinceBirth
person?.siblingNames

var jsonPerson: Person?

do {
    let jsonObject = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any]
    if let jsonObjectUw = jsonObject {
        jsonPerson = Person(dict: jsonObjectUw)
    }
} catch {
    print(error, error.localizedDescription)
}

jsonPerson?.name
jsonPerson?.age
jsonPerson?.hasLice
jsonPerson?.timeSinceBirth
jsonPerson?.siblingNames
//: [Next](@next)
