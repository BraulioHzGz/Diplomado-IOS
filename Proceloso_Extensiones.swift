// MARK: Extender tipos de datos a los que no tenemos acceso
/*
 Rompen niveles de acceso. Tienen acceso a métodos privados y públicos de una estructura siempre y cuando estén en el mismo archivo
 
*/

let myValue: Double = 5 * 5

extension Double {
    var squared: Double {
        return self * self
    }
}

print(myValue.squared)


struct Car {
    let maker: String
    let model: String
    let year: Int
    var fuelLevel: Double {
        willSet {
            precondition(newValue <= 1.0 && newValue >= 0, "New value must be between 0 a 1")
        }
    }
    // traer un inicializador por default, inicializar otro causaría conflicto
}

// MARK: Puede haber protocolos que hagan extension
extension Car: CustomStringConvertible {
    var description: String {
        return "Car: \(maker) - \(model)"
    }
}

// Agregar inicializadores
extension Car {
    init(maker: String, model: String, year: Int){
        self.maker = maker
        self.model = model
        self.year = year
        self.fuelLevel = 1.0
    }
}

// Tipos anidados sin declararlos dentro de la estructura base
extension Car {
    enum Era {
        case vingage, modern
    }
}

// Definir nuevos métodos sin la necesidad de ponerlo dentro de la estructura original
extension Car {
    mutating emptyFuel(by amout: Double){
        fuelLevel -= amout
}

let firstCar = Car(maker: "Honda", model: "Civic", year: 2017, fuelLevel: 1.0)
