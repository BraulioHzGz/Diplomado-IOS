import UIKit

var dineroDisponible: Double = 20000.00
let cuotaPuente: Double = 100.00
let cuotaTunel: Double = 50.00
let precioGas: Double = 575.00

guard dineroDisponible >= precioGas else {
    fatalError("No alcanza con la gasolina que tenemos")
}

dineroDisponible -= precioGas
guard dineroDisponible >= cuotaPuente else {
    fatalError("No podemos pasar por el puente")
}

dineroDisponible -= cuotaPuente
guard dineroDisponible >= cuotaTunel else {
    fatalError("No podemos pasar por el tunel")
}

dineroDisponible -= cuotaTunel
print("¡Llegamos a nuestro destino!")


// Caso con un punto X

let p = (-50, 0)
guard case let (x, 0) = p, x < 0 else {
    fatalError("Solamente se puede poner puntos positivos")
}
