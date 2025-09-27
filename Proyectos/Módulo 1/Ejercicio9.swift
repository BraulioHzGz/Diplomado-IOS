//: [Previous](@previous)

struct Person {
    let name: String
    let age: Int
}

func findAgeDifference(_for: [Person]){
    let sortedPeopleArray = _for.sorted { $0.age < $1.age }
    
    //var oldPerson: Person = sortedPeopleArray.last!
    var oldPerson: Person = sortedPeopleArray.last!
    var youngPerson: Person = sortedPeopleArray.first!
    var ageDifference: Int = oldPerson.age - youngPerson.age
    var finalResult = (oldest: oldPerson.age, youngest: youngPerson.age, difference: ageDifference)
    
    print(finalResult)
}

let son = Person(name: "Juan", age: 19)
let daughter = Person(name: "Maria", age: 12)
let mother = Person(name: "Benita", age: 60)
let father = Person(name: "Camilo", age: 58)
let family = [daughter, son, mother, father]

findAgeDifference(_for: family)


//: [Next](@next)
