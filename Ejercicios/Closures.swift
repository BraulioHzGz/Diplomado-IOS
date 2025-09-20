import UIKit

// MARK: Ejercicio 1
func operacion(numero1: Int, numero2: Int, ussing operando: (Int, Int) -> Int) {
    print(operando(numero1, numero2))
}

operacion(numero1: 10, numero2: 10, ussing: *)


// MARK: Ejercicio 2
func esMayorQue(_ n1: Int, _ n2: Int, ussing comparador: (Int, Int) -> Bool) {
    print(comparador(n1, n2))
}

esMayorQue(5, 10, ussing: <)


// MARK: Ejercicio 3
func procesarCadena(texto: [String], ussing concatenador: ([String]) -> String) -> String {
    return concatenador(texto)
}

let concatenador : ([String]) -> String = { (texto: [String]) -> String in
    var cadenaFinal : String = ""
    
    for i in 0..<texto.count {
        if i != texto.count - 1 {
            cadenaFinal.append("\(texto[i]) ")
        } else {
            cadenaFinal.append("\(texto[i])")
        }
    }
    return cadenaFinal
}

print(procesarCadena(texto: ["Hola", "guerrero", "aventurero", "perdido", "en", "el", "tiempo"], ussing: concatenador))


// MARK: Ejercicio 4
func compararString(_ cadena1: String, _ cadena2: String, ussing comparador: (String, String) -> String) {
    switch comparador(cadena1, cadena2) {
        case ">" : print(true)
    default: print("...")
    }
}

compararString("Hola", "Adiós", ussing: >)
