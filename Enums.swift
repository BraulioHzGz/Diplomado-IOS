//: [Previous](@previous)

import Foundation

enum TrafficLight {
    // Instancias ya definidas
    case red, yellow, green
    
    
}

let currentLight = TrafficLight.green

// Al ser enum, no hay necesidad de usar default en el switch case
switch currentLight {
    case .green: print("GO")
    case .yellow: print("BETTER STOP")
    case.red: print("STOP NOW")
}

let anotherLight: TrafficLight = .yellow


// MARK: raw value -> indicar que tipo de datos va a tener el enum (uniques) y primitivos
enum AnimalType: String {
    //case mammal, bird, reptile  // Sin especificar tipo
    case mammal = "mamifero"    // Con especificacion
    case bird = "ave"
    case reptile = "reptil"
    
    init?(string: String){
        self?.init(rawValue: string.lowercased())
    }
    
    init(_ string: String){
        if let value = Self.init(string: string){
            self = value
        } else {
            self = .reptile
        }
    }
    
    // self -> referencia a la instancia
    // Self -> referencia al tipo de dato
}

let animal = AnimalType.bird.rawValue
print(animal)

let currentAnimalType: AnimalType = .mammal.rawValue
print(currentAnimalType.rawValue)

let usersAnimal1 = AnimalType(rawValue: "Ave")   // nil -> no hay llave "Ave"
let usersAnimal2 = AnimalType(rawValue: "ave")   // .bird -> si hay llave "ave"


// MARK: Valores asociados
enum ContactMethod {
    case email(String)
    case phone(countryCode: Int, number: String)
    case postal(street: String, zip: String)
    
    // Métodos tienen que ser computados
    func description() -> String {
        return switch self {
            case let .email(address): address
            case let .phone(countryCode, number): "+\(countryCode) \(number)"
            case let .postal(street, zip): "\(street), \(zip)"
        }
    }
    
}

let contact = ContactMethod.email("alice@example.com")      // Copia única con email diferente
let youContact = ContactMethod.email("another@example.com") // Copia única con email diferente
contact.description()       // Regresa la cadena anterior


/*enum Pet {
    case dog, cat, parrot, turtle
    
    var animalType: AnimalType {
        switch self {
            case .cat, .dog: .mammal
            case .parrot: .bird
            case .turtle: .reptile
        }
    }
}*/


enum Metrics {
    static let maxTries = 3
}

Metrics.maxTries
//: [Next](@next)
