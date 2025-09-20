import UIKit

// MARK: Ejercicio 1
struct Rectangulo {
    var ancho: Double
    var alto: Double
    
    func getArea() -> Double {
        return ancho * alto
    }
    
    func getPerimetro() -> Double {
        return 2 * (ancho + alto)
    }
}


//MARK: Ejercicio 2
struct Alumno {
    let name: String
    var notas: [Int]
    
    func getPromedio() -> Double {
        var suma = 0
        for i in 0..<notas.count {
            suma += notas[i]
        }
        return Double(suma)/Double(notas.count)
    }
}


//MARK: Ejercicio 3
struct Inventario {
    let productos: [String: Int]
    
    func getMaxProductoFromInventory() -> String {
        var productoConMayorStock: String = ""
        var stock: Int = 0
        for (producto, unidades) in productos {
            if unidades > stock {
                productoConMayorStock = producto
                stock = unidades
            }
        }
        return productoConMayorStock
    }
}

var inventatory = Inventario(productos: ["Manzanas":7, "Peras":12, "Platanos":3, "Hongos":8, "Uvas": 12, "Lechuga": 30])
//print(inventatory.getMaxProductoFromInventory())

//MARK: Ejercicio 4
struct Club {
    var miembros: Set<String>
    
    mutating func addMember(name: String){
        miembros.insert(name)
    }
    
    mutating func removeMember(name: String){
        miembros.remove(name)
    }
    
    func isMember(name: String) -> Bool{
        if(miembros.contains(name)){ return true; }
        return false;
    }
}

//var member: Club = Club(miembros: ["Braulio", "Jorge", "Oscar", "Elena", "Diana", "Isabel", "Reyna", "Ezequiel"])
//member.addMember(name: "Pablo")
//print(member)
//member.removeMember(name: "Isabel")
//print(member)
//print(member.isMember(name: "Isabel"))
//print(member.isMember(name: "Braulio"))


//MARK: Ejercicio 5
struct Persona {
    let name: String
    let age: Int
    
    func comparePerson(personName: String, personAge: Int) -> String{
        var newName = personName
        if(personAge > age){
            return newName
        }
        return name
    }
}


//MARK: Ejercicio 6
struct Producto {
    let nombre: String
    let precio: Double
}

var productos: [Producto] = [
    Producto(nombre: "Producto 1", precio: 150.00),
    Producto(nombre: "Producto 2", precio: 210.50),
    Producto(nombre: "Producto 3", precio: 85.10),
    Producto(nombre: "Producto 4", precio: 190.00),
    Producto(nombre: "Producto 5", precio: 65.30)
]

func getMostExpensive(de lista: [Producto]) -> Producto?{
    return lista.max(by: {$0.precio < $1.precio})
}

if let productoCaro = getMostExpensive(de: productos) {
    print("El producto más caro es: \(productoCaro.nombre)")
}


//MARK: Ejercicio 7
struct Curso {
    var nombre: String
    var alumnos: [String]
}

func getCourseWithMoreStudents() {
    let diccionario: [String: Curso] = [
        "Español": Curso(nombre: "Español", alumnos: ["Braulio", "Elena", "Oscar"]),
        "Matemáticas": Curso(nombre: "Matemáticas", alumnos: ["Alberto", "Jorge"]),
        "Historia": Curso(nombre: "Historia", alumnos: ["Ximena", "Juan", "Minerva", "Luis"])
    ]
    
    func getCourse(diccionario: [String: Curso]) -> Curso? {
        var elements = diccionario.values.max(by: {$0.nombre.count < $1.nombre.count})
        return elements
    }
}


//MARK: Ejercicio 8
struct Punto {
    let xCoord: Double
    let yCoord: Double
    
    func getDistanceBetweenTwoCoord(x1: Double, y1: Double) -> Double{
        return sqrt((pow((xCoord - x1), 2) + pow((yCoord - y1), 2)))
    }
    
    func getCuadrante() -> String{
        if(xCoord > 0 && yCoord > 0) {
            return "Primer cuadrante"
        } else if(xCoord < 0 && yCoord > 0) {
            return "Segundo cuadrante"
        } else if(xCoord < 0 && yCoord < 0) {
            return "Tercer Cuadrante"
        }
        return "Cuarto cuadrante"
    }
}

let p = Punto(xCoord: 5, yCoord: 2)
print(p.getDistanceBetweenTwoCoord(x1: 1, y1: -2))
print(p.getCuadrante())



//MARK: Ejercicio 9
struct Materia {
    var nombre: String
    var calificaciones: [Int]
    
    func getAverageGrade() -> (nombre: String, promedio: Double) {
        guard !calificaciones.isEmpty else {
            return (nombre, 0.0)
        }
        
        let totalGrades = calificaciones.reduce(0, +)
        let promedio = Double(totalGrades)/Double(calificaciones.count)
        return (nombre, promedio)
    }
}


//MARK: Ejercicio 10
struct Tienda {
    var productos: [Producto] = []
    
    mutating func addProduct(producto: Producto){
        productos.append(producto)
    }
    
    mutating func removeProduct(nombreProducto: String){
        if let idx = productos.firstIndex(where: {$0.nombre == nombreProducto}){
            productos.remove(at: idx)
        } else {
            print("No existe un producto con el nombre: \(nombreProducto)")
        }
    }
    
    func getTotalPrice() -> Double {
        var precio = 0.00
        
        for producto in productos {
            precio += producto.precio
        }
        
        return precio
    }
}
