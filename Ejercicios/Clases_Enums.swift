import UIKit

// MARK: Ejercicio 1
class Persona {
    let name: String
    let age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    func presentarse() -> String {
        return "Hola, me llamo \(name) y tengo \(age) años."
    }
}

let persona1 = Persona(name: "Juan", age: 30)
persona1.presentarse()



// MARK: Ejercicio 2
class Coche {
    enum VehicleStates: String {
        case on = "Auto encendido"
        case off = "Auto apagado"
    }
    
    func startVehicle() -> String {
        return VehicleStates.on.rawValue
    }
    
    func shutDownVehicle() -> String {
        return VehicleStates.off.rawValue
    }
}

let coche1 = Coche()
coche1.startVehicle()
coche1.shutDownVehicle()


// MARK: Ejercicio 3
class Producto {
    let productName: String
    let productPrice: Double
    
    init(productName: String, productPrice: Double){
        self.productName = productName
        self.productPrice = productPrice
    }
}

class Inventario {
    let stock = [
        Producto(productName: "Producto 1", productPrice: 13.78),
        Producto(productName: "Producto 2", productPrice: 78.50),
        Producto(productName: "Producto 3", productPrice: 10.50),
        Producto(productName: "Producto 4", productPrice: 45.67),
        Producto(productName: "Producto 5", productPrice: 55.30)
    ]
    
    func getMostExpensive() -> Producto?{
        return stock.max(by: {$0.productPrice < $1.productPrice})
    }
}

let myStore = Inventario()
if let producto = myStore.getMostExpensive(){
    print("El producto más caro es: \(producto)")
}


// MARK: Ejercicio 4
class Estudiante {
    let name: String
    let grades: [Int]
    
    init(name: String, grades: [Int]){
        self.name = name
        self.grades = grades
    }
    
    func getAverageGrade() -> Double {
        guard !grades.isEmpty else { return 0.0 }
        
        let totalGrades = grades.reduce(0, +)
        let promedio = Double(totalGrades)/Double(grades.count)
        return promedio
    }
}

let firstStudent = Estudiante(name: "Juan Pérez", grades: [10, 8, 7, 8, 9])
let secondStudent = Estudiante(name: "Ana García", grades: [6, 7, 6, 8, 10])

firstStudent.getAverageGrade()
secondStudent.getAverageGrade()
