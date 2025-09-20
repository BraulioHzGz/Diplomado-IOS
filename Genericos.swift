//: [Previous](@previous)

import Foundation

// MARK: Un genérico permite describir código flexible, funciones reutilizables y tipos de datos que funcionan con otro tipo de datos, cumpliendo todo lo necesario

let something: [String] = []
let something2 = [String]()
let something3: Array<String> = []      // Notación genérica

// Stack -> Limitado a un solo tipo de datos INT
//struct Stack {
//    var items = [Int]()
//    
//    mutating func push(_ newItem: Int) {
//        items.append(newItem)
//    }
//    
//    mutating func pop() -> Int? {
//        guard !items.isEmpty else {
//            return nil
//        }
//        return items.removeLast()
//    }
//}

// Element es un placeholder, no sabemos cuando vale
struct Stack<Element> {
    var items = [Element]()
    
    mutating func push(_ newItem: Element) {
        items.append(newItem)
    }
    
    mutating func pop() -> Element? {
        guard !items.isEmpty else {
            return nil
        }
        return items.removeLast()
    }
}


var intStack = Stack<Int>()     // Ya es algo específico y no genérico
intStack.push(1)
intStack.push(10)

print(intStack.pop())
print(intStack.pop())
print(intStack.pop())

var strStack = Stack<String>()
strStack.push("Element 1")
strStack.push("Element 2")

print(strStack.pop())


// MARK: Métodos y funciones genéricas
func myMap<T, U>(items: [T], _ transformer: (T) -> (U)) -> [U] {
    // T -> Type
    // U -> Consecuente de la letra T
    var result = [U]()
    
    for item in items {
        result.append(transformer(item))
    }
    
    return result
}

let string = ["one", "two", "chree"]
let stringsLength = myMap(items: string) { string in
    return string.count
}
print(stringsLength)

let stringsLength2 = myMap(items: string) {
    return $0.count
}
print(stringsLength2)


// Equatable hace que el placeholders T sea del mismo tipo y pueda garantizar la igualdad
func checkIfEqual<T: Equatable>(_ first: T, _ second: T) -> Bool{
    return first == second
}

func checkIfStringsAreEqual<T: CustomStringConvertible, U: CustomStringConvertible>(_ first: T, _ second: U) -> Bool{
    return first.description == second.description
}



// MARK: Los protocolos no tienen genéricos, pero si tienen algo similar llamado AssociatedType
//: [Next](@next)
