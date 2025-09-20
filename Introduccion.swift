import UIKit

//MARK: comentarios de línea múltiple y simple
// Comentario de unilinea
/*
 Comentario de multilinea
 */

//MARK: variables y constantes
// variables: var <id> = <valor" -> Llamar bajo la convención lowerCase
var greeting = "Hello, playground"
greeting = "Bye playground"

// constantes: let <id> = <valor> -> Llamar bajo la convención de lowerCase
let constanteUno = "Const"

var 😭 = 1

//MARK: Inferencia y no inferencia en los tipos de datos
// Inferencia    -> Datos primitivos explícitamente
// No Inferencia -> Tipos de datos muy específicos
var texto: String = "String"
var entero: Int = 1
var double: Double = 1.0
var float: Float = 1.0
var booleano: Bool = true

// Números
let maxValueInt = Int.max
let minValueInt = Int.min
let maxValueUInt = UInt.max
let minValueUInt = UInt.min

//MARK: Operadores de comparación
var n1 = 1
var n2 = 2

n1 > n2
n1 < n2
n1 >= n2
n1 <= n2
n1 == n2
n1 != n2

//MARK: Manejo de String
let cadena1 = "Hola "
let cadena2 = "Mundo"
cadena1 + cadena2       // La menos favorita del desarrollo

// Caracter de escape
let nombre = "Braulio"
let mensaje = "Buenos días \(nombre)"

// Manejo de métodos
mensaje.isEmpty


//MARK: Arreglos
// Un arreglo es una colección de datos ordenados con valores que se pueden repetir y se accede con su índice
var miArray = [1, 2, 3, 4]
var miArray2: [Int] = [1, 2, 3, 4]
var miArray3: [Int] = []

var miArray4 = Array(repeating: 2.5, count: 3)

miArray[1]

var miArray5: [String] = ["A", "B", "C"]

// Agregar elementos
miArray5.append("D")        // Agregar usando el método append
miArray5 += ["E", "F", "G"] // Agregar usando concatenación +=
miArray5

// Modificar elementos de un arreglo
miArray5[0] = "Hola Mundo"
miArray5

// Insertar un elemento
miArray5.insert("Hola", at: 1)  // Agregar en la posición N (at: n)
miArray5

// Eliminar o remover un elementos
miArray5.remove(at: 1)      // Elimina un elemento en la posición N (at: N)
miArray5


//MARK: Sets
// Conjunto de datos únicos que pueden estar en cualquier orden en orden hashable
var miSet = Set<Int>()
var miSet2 = Set([1, 2, 3, 4])
var miSet3: Set<String> = ["A", "B", "C"]

miSet3.insert("D")  // Devuelve una tupla si el valor se inserta
miSet3.remove("D")
miSet3.contains("C")    // True
miSet3.contains("E")    // False


//MARK: Diccionarios
// Colecciones no ordenadas que se accede mediante la llave (llave - valor)
var miDiccionario: [String: Int] = ["A": 1, "B": 2, "C": 3]
var miDiccionario2: [String: String] = [:]

// Obtener un valor con base en la clase
miDiccionario["A"]

// Modificar un valor usando la llave
miDiccionario["A"] = 10

// Manera indirecta de crear elementos -> No existe un valor y lo inserta
miDiccionario["E"] = 4

// Remover un elemento de un diccionario
miDiccionario["E"] = nil                // Lo ponemos en nil (NULL)
miDiccionario.removeValue(forKey: "D")  // Removemos un elemento elegantemente


//MARK: Tuplas
// multiples valores en un solo contenedor, es decir, un solo elemento va a tener varios elementos de un mismo o varios valores
var color = ("#ff0000", "Rojo")
var tupla1: (String, Int) = ("A",1)
var calificacion = (nombre:"Dante", algebra:8)

// Si hay inferencia de tipo, podemos acceder a los índices con números
color.0
color.1

// Si no hay inferencia, podemos acceder a los índices con las etiquetas
calificacion.nombre
calificacion.algebra

/*
 En swift, el operador % (remainder / residuo) no funciona igual que en otros lenguajes de programación, es importante considerar eso, pues trabajar con números negativos cambia.
 
    - print(9 % 4)   -> 1
    - print(-9 % 4)  -> -1      (mantiene el signo del dividendo [-9])
    - print(9 % -4)  -> 1       (mantiene el signo del dividendo [9])
    - print(-9 % -4) -> -1      (mantiene el signo del dividendo [-9])
 */






/* EJERCICIOS */

// Ejercicio 1: una variable que guarde un string y una constante que guarde un int
var name = "Braulio"
let valor = 23

// Ejercicio 2
var apellidoPaterno: String = "Hernandez"
var idEstado: Int = 9
var peso: Double = 45.0
var activo: Bool = true

// Ejercicio 3
var numero_1 = 23.5
var numero_2 = 20.8
print(numero_1 / numero_2)
print(numero_1 > numero_2)

// Ejercicio 4
var numero_3 = 10
var numero_4 = 20
let suma_n1_n2 = numero_3 + numero_4
suma_n1_n2

// Ejercicio 5

let nombreUsuario: String = "Braulio"
let apellidoUsuario: String = "Hernandez"
let mensajeFinal = "Hola \(nombreUsuario) \(apellidoUsuario), ¿cómo estás?"

// Ejercicio 6
var tuplaPersona = (nombre: "Ana", edad: 21, suspendido: false)
tuplaPersona.nombre

// Ejercicio 7
//var setNumeros = Set([1, 2, 3, 4, 4, 2])
var setNumeros: Set<Int> = [1, 2, 3, 4, 4, 2]
setNumeros.insert(5)
setNumeros.remove(1)

// Ejercicio 8
var arregloFruta = ["manzana", "mango", "pera", "piña", "uva"]
arregloFruta.append("naranja")
print(arregloFruta[0])
print(arregloFruta[arregloFruta.count - 1])
// Primer elemento: .first!                 Último elemento: .last

// Ejercicio 9
var edades: [String: Int] = [:]

// Ejercicio 10
/*
    SET: conjunto de datos no ordenado, únicos y hashables
    ARRAY: conjunto de elementos ordenados, del mismo tipo, repetidos e identificados por un índice que comienza desde el 0
    DICCIONARIO: conjunto de elementos no ordenados bajo la convención (key - value), cuya llave debe ser única y no repetible
 */

