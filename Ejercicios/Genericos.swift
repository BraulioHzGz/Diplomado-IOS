//: [Previous](@previous)

import Foundation

// MARK: Ejercicio 1
struct Pair<T, U> {
    var firstElement: T
    var secondElement: U
    
    init(_ firstElement: T, _ secondElement: U){
        self.firstElement = firstElement
        self.secondElement = secondElement
    }
    
    var swap: Pair<U, T> {
        return Pair<U, T>(secondElement, firstElement)
    }
}


var myPair = Pair("Hello", 1)
print(myPair)
print(myPair.swap)


// MARK: Ejercicio 2
print("\n\n")
struct Stack<Element> {
    var items = [Element]()
    
    mutating func push(_ newItem: Element) {
        items.append(newItem)
    }
    
    mutating func pop() -> Element? {
        guard !items.isEmpty else { return nil }
        return items.removeLast()
    }
    
    func map<U>(_ transformer: (Element) -> (U)) -> [U] {
        var result = [U]()
        
        for item in items {
            result.append(transformer(item))
        }
        
        return result
    }
    
    func filter(_ isIncluded: (Element) -> Bool) -> Stack<Element> {
        var filteredStack = Stack<Element>()
            
        for item in items {
            if isIncluded(item) {
                filteredStack.push(item)
            }
        }
            
        return filteredStack
    }
}

var intStack = Stack<Int>()
intStack.push(1)
intStack.push(2)
print(intStack)
print(intStack.filter { $0 == 5 })


// MARK: Ejercicio 3
print("\n\n")
func findAll<T: Equatable>(_ array: [T], _ elementToFind: T) -> [Int] {
    var positions: [Int] = []
    
    for (index, element) in array.enumerated() where element == elementToFind {
        positions.append(index)
    }
    
    return positions
}

let element = 3
let array = [5,3,7,3,9]
print("Elemento a buscar: \(element)")
print("Posiciones encontradas: \(findAll(array, element))")


// MARK: Ejercicio 4
print("\n\n")
extension Dictionary {
    func mapValuesToArray<U>(_ transformer: (Value) -> (U)) -> [U] {
        var result: [U] = []
        for (_, Value) in self {
            result.append(transformer(Value))
        }
        return result
    }
}

let dictionary = ["one": 1, "two": 2, "three": 3]
print("Diccionario inicial: \(dictionary)")
let stringValues = dictionary.mapValuesToArray { "\($0)" }
print(stringValues) // ["1", "2", "3"]



// MARK: Ejercicio 5
print("\n\n")
protocol ComparableItem {
    func isSmallerThan(_ other: Self) -> Bool
}

func sortedItems<T: ComparableItem>(_ items: [T]) -> [T] {
    var sortedItems = items
    sortedItems.sort { $0.isSmallerThan($1) }
    return sortedItems
}

// Estructuras para las pruebas
struct Person: ComparableItem {
    let name: String
    let age: Int
    
    func isSmallerThan(_ other: Person) -> Bool {
        self.age < other.age
    }
}

struct Product: ComparableItem {
    let name: String
    let price: Double
    
    func isSmallerThan(_ other: Product) -> Bool {
        self.price < other.price
    }
}

let people = [
    Person(name: "Alice", age: 30),
    Person(name: "Bob", age: 25),
    Person(name: "Charlie", age: 35)
]

let sortedPeople = sortedItems(people)
for person in sortedPeople {
    print("\(person.name): \(person.age)")
}




//: [Next](@next)
