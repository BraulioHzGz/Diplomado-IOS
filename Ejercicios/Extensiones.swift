//: [Previous](@previous)

import Foundation

// MARK: Ejercicio 1
// Encontrar en el playground de Protocolos

// MARK: Ejercicio 2
extension Array {
    func secondElement() -> Element? {
        guard count > 1 else { return nil }
        return self[1]
    }
    
    var isNotEmpty: Bool {
        return !isEmpty
    }
}

let numbers = [1, 2, 3, 4]
if let second = numbers.secondElement() {
    print("The second element is \(second)")
} else {
    print("The array does not have a second element")
}

let emptyArray: [Int] = []
print("Is the array not empty? \(emptyArray.isNotEmpty)")


// MARK: Ejercicio 3
//extension Int {
//    enum EvenOrOdd: String {
//        case even = "even"
//        case odd = "odd"
//    }
//    
//    var evenOrOdd: EvenOrOdd {
//        return self % 2 == 0 ? .even : .odd
//    }
//}
//
//let myInt = 2
//print(myInt.evenOrOdd)
//print(7.evenOrOdd)


// MARK: Ejercicio 4
extension Int {
    enum EvenOrOdd: CustomStringConvertible {
        case even
        case odd
        
        var description: String {
            switch self {
                case .even: return "Hey, I'm an even number"
                case .odd: return "Oh no, I'm an odd number"
            }
        }
    }
    
    var evenOrOdd: EvenOrOdd {
        return self % 2 == 0 ? .even : .odd
    }
}

let anotherInt = 4
print(anotherInt.evenOrOdd)
print(9.evenOrOdd)

//: [Next](@next)
