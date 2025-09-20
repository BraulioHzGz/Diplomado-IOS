import UIKit

//MARK: Opcionales -> variables que pueden o no tener un datos

// Optional(value) -> Tiene un valor
/*
var optionalString: String? = "Choco"

// Manera segura de cuidar un Optional
print(optionalString)                                               // Resultado -> Optional("Choco")
guard let unwrappedString = optionalString else { fatalError() }    // Funciona para evitar errores con optional
 */

/*if let optionalString {
    print(optionalString }
else {
    print("No variable available")
}*/
                              
//MARK: Optional Chaining -> Acceder a valores o datos de manera segura
/*
let count1 = optionalString?.count      // Manera segura
let count2 = optionalString!.count      // Manera no segura

//MARK: Funciones en swift -> func <name>(){}
func greetEveryone(){
    print("Hello World")
}

func introduceSomeone(name: String, age: Int){
    if age < 18 {
        print("Youngster", name);
    } else {
        print("This is ", name);
    }
}
 */

/* No es mala, pero los argumentos no son mu entendibles
func Add(rhs: Int, lhs: Int){
    rhs + lhs
}
*/

// _ -> Se puede omitir, no es necesario y la etiqueta es ignorada

// Funciones con return incluido
func addSomeNumber() -> Int {       // Si es función de 1 argumento de retorno y de 1 línea, se puede omitir el return
    2 + 2
}

func sortEvenNumber(_ numbers: [Int]) -> (evens: [Int], odds: [Int]){
    var evens = [Int]()
    var odds = [Int]()
    
    for number in numbers {
        if number % 2 == 0 {
            evens.append(number)
        } else {
            odds.append(number)
        }
    }
    return (evens, odds)
}

let sortedNumber = sortEvenNumber([10, 1, 4, 3, 57, 43, 27, 84, 156, 11])
print("Evens: \(sortedNumber.evens) | Odds: \(sortedNumber.odds)")


/*func grabMiddleName(fromFullname name: (String, String?, String)) -> String? {
    return name.1
}*/

/*func greetByMiddleName(fromFullname name: (first: String, middle: String?, last: String)) -> String? {
    guard let middleName = name.middle else {
        return ("Hey there")
    }
    return print("Hey, \(middleName)!")
}*/

//let middleName = grabMiddleName(fromFullname: "Grecia", "nil", "Escárcega")
//let middleName = greetByMiddleName(fromFullname: "Grecia", "x", "Escárcega")

//if let middleName = middleName {
//    print(middleName)
//}

func applySunscreen(at time: Int) throws -> Bool {
    switch time {
        case 8...17: return true
        case 0...7, 17...23: return true
        default: throw NSError(domain: "", code: -100)
    }
}

let time = -5
do {
    let shouldApplySunscreen = try applySunscreen(at: time)
    if shouldApplySunscreen {
        print("Apply sunscreen!")
    } else {
        print("Not necessary at all")
    }
} catch {
    print(error.localizedDescription)
}

let optionalTry = try? applySunscreen(at: 84)


func areaOfTriangle(base: Double, h: Double) -> Double {
    let rectangule = base * h
    
    func divide() -> Double {
        return rectangule / 2
    }
    
    return divide()
}
