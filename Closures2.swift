//: [Previous](@previous)

import Foundation


// Todas las funciones son closures pero no todos los closures son funciones

// Una función es un closure
// Firma de una función: parámetros que recibe y salida de la función
func isAscending(_ i: Int, _ j: Int) -> Bool {
    return i < j
}

let isAscendingFunction = isAscending

var counter = [1, 3, 40, 32, 2, 53, 77, 13]

// Eso es perfectamente válido porque by: espera (Int, Int) -> throws Bool
counter.sort(by: isAscendingFunction)


// Esto es un closure, por lo que es válido en la sintaxs usando in, y aunque parece función, no lo es, ya que no tiene nombre
counter.sort { (i: Int, j: Int) -> Bool in
    return i < j
}

// Por la inferencia de swift, no es necesario indicarle que dato es cada variable y que regresa, internamente ella sabe que es
counter.sort { i, j in
    return i < j
}

// Reducido con especificaciones y tipo de inferencia
counter.sort(by: { $0 < $1 })

// Reducido sin poner la etiqueta by:
counter.sort {$0 < $1}

//MARK: Firma: ([Double], (Double) -> String) -> [String]
func format(numbers: [Double], ussing formatter: (Double) -> String) -> [String] {
    var result = [String]()
    
    for number in numbers {
        let transformed = formatter(number)
        result.append(transformed)
    }
    
    return result
}

// Este es nuestro closure necesario para la función    // Valor por default al String opcional
let rounder: (Double) -> String = { (number: Double) -> String in
    let roundedNumber = number.rounded()
    let intRounded = Int(roundedNumber)
    return "\(intRounded)"
}

let prices = [5.4892, 44.567, 46.082, 58.68, 6.96441, 0.3]
print(format(numbers: prices, ussing: rounder))


func experimentWithScopes(){
    var numberOfTransformations = 0
    
    let rounder: (Double) -> String = {
        numberOfTransformations += 1
        return String(format: "$%0.2f", $0)
    }
    
    let otherPrices = [5.4892, 44.567, 46.082, 58.68, 6.96441, 0.3]
    let moneyFormatted = format(numbers: otherPrices, ussing: rounder)
    print(moneyFormatted)
}

experimentWithScopes()



let volunterAverages = [10, 4.2, 1.5, 12.2, 16.815]
volunterAverages.reduce(0.0){ partialResult, average in
    partialResult + average
}


let myArray = [1, 2, 3, 4, 5, 6]

let transformedArray = myArray.map({
    return "\($0)"
})

print(transformedArray) // Convierte cada elemento en un string


let filteredArray = myArray.filter{ value in
    return value % 2 == 0
}

print(filteredArray) 
//: [Next](@next)
