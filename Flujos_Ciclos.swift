import UIKit

//MARK: Operadores de rango
let rangoCerrado = -2...5
let rangoAbierto = -2..<5
let abietoPorIzquierda = ...5
let abiertoPorDerecha = 5...
let abiertoCasiPorIzquierda = ..<5

if #available(iOS 26, *){       // Esto no va con paréntesis
    // Algo mas novedoso
} else {
    // Volver a versiones antiguas
}

if #unavailable(iOS 14){ /* Si no hay version o disponibilidad de X version */ }

let animal = "dog"
let sound = switch animal {
    case "dog": "woof"
    case "cat": "meow"
    default: "?"            // Default siempre
}

print(sound)

switch animal {
    case "dog", "cat", "bird": print("Mascota normal")      // Múltiples casos
    default : print("Otro animal exotico")                  // Default siempre
}

let certamenAnimal = 9.8
switch certamenAnimal {
    case 0...5:
        print("Certamen de novatos")
    case 6...10:
        print("Certamen intermedio")
    default:
        print("Certamen avanzado")
}

let calificaciom = 8.96
switch calificaciom {
    case ...5: print("Reprobado")
    case 6..<9: print("Aprobado")
    case 9: print("Sobresaliente")
    case 10...: print("Excepcional")
    default: break
}


var color = (255, 255, 255)
switch color {      // Wildcard al que encuentra primero por coindencia
    case(255, _, _): print("RED")
    case(_, 255, _): print("GREEN")
    case(_, _, 255): print("BLUE")
    default: print("NO COLOR")
}

switch color {
    case let(255, g, b) where g < 255 && b < 255: print("MAX RED")
    case let(r, 255, b) where r < 255 && b < 255: print("MAX GREEN")
    case let(r, g, 255) where r < 255 && g < 255: print("BLUE")
    case (255, 255, 255): print("WHITE")
    default: print("NO COLOR")
}

// Wildcard con if (manejo de patrones)
let p = (-50, 0)
// case -> hacer un match entre un patrón y un valor
if case let (x, 0) = p, x < 0 {
    print("Estás en X negativo")
} else {
    print("Estás en otro punto\n")
}


//MARK: Ciclos de repetición (loops)

// CICLO FOR
var frutas = ["Manzana", "Plátano", "Naranja", "Uva"]

var usuarios = ["Ana": 20, "Luis": 30, "María": 25, "Sofía": 22, "Pablo": 35, "Laura": 28]

for usuario in usuarios {
    print("\(usuario.key) tiene \(usuario.value) años")
}
print("")

for(usuario, edad) in usuarios {
    print("\(usuario) (llave) tiene \(edad) años (clave)")
}
print("")

let numbers = 1...10
for number in numbers where number % 2 == 0 {
    print(number)
}
print("")

//for numeros in stride(f)

// CICLO WHILE
var sueldo = 100_000
var i = 1

while(sueldo > 0) {
    let compra = 1000 * Int.random(in: 1...10)
    print("Compra \(i) realizada por: $\(compra)")
    sueldo -= compra
    print("Dinero restante: $\(sueldo)")
    i += 1
}

sueldo = 50_000
i = 100
repeat {
    let compra = 1000 * Int.random(in: 1...10)
    print("Compra \(i) realizada por: $\(compra)")
    sueldo -= compra
    print("Dinero restante: $\(sueldo)")
    i += 1
} while(sueldo > 0)

print("F")



/* EJERCICIO */

