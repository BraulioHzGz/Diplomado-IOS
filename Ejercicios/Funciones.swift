import UIKit

//MARK: Ejercicio 1 – Factorial
func Factorial(n: Int) -> Int {
    guard n >= 0 else { return 0 }
    if n == 0 || n == 1 { return 1 }
    return (1...n).reduce(1, *)
}

//Factorial(n: 5)


// MARK: Ejercicio 2 – Números primos
func esPrimo(n: Int) -> Bool {
    if(n % 2 == 0){ return false }
    return true
}

func primosHasta(n: Int) -> [Int] {
    var primos: [Int] = []
    for i in 2...n {
        if esPrimo(n: i) { primos.append(i) }
    }
    return primos
}


// MARK: Ejercicio 3 – Palíndromo con frases
func esFrasePalindromo(frase: String) -> Bool {
    var fraseReversada: String = ""
    for caracter in frase.lowercased() {
        fraseReversada.append(caracter)
    }
    if(fraseReversada == frase.lowercased()){ return true }
    return false
}

//esFrasePalindromo(frase: "Anita lava la tina")


// MARK: Ejercicio 4 – Conteo de vocales
func conteoVocales(frase: String) -> [Character: Int] {
    var vocales: [Character: Int] = [:]
    for caracter in frase.lowercased() {
        if(caracter == "a" || caracter == "e" || caracter == "i" || caracter == "o" || caracter == "u"){
            vocales[caracter, default: 0] += 1
        }
    }
    return vocales
}

print(conteoVocales(frase: "Hola Amigos de youtube, cómo quisiera cambiar"))


// MARK: Ejercicio 5 – Ordenar lista de números (algoritmo propio)
func swap(a: inout Int, b: inout Int){
    var temp: Int = b
    b = a % b
    a = temp
}

func selectionSort(_ array: [Int]) -> [Int]{
    var n = array.count
    var aux1: Int = 0
    var aux2: Int = 0
    
    for i in 0..<n-1{
        var min_idx = i
        for j in i+1..<n{
            if(array[j] < array[min_idx]){
                min_idx = j
            }
        }
        aux1 = array[i]
        aux2 = array[min_idx]
        swap(a: &aux1, b: &aux2)
    }
    
    return array
}


// MARK: Ejercicio 6 - Función de Fibonacci
func fibonacci(n: Int) -> Int {
    guard n >= 0 else { return 0 }
    if n < 2 { return n }
    return fibonacci(n: n - 1) + fibonacci(n: n - 2)
}


// MARK: Ejercicio 7 - Suma de digitos
func sumaDigitos(numero: Int) -> Int {
    var suma: Int = 0
    var num: Int = abs(numero)
    while num != 0 {
        let digito: Int = num % 10
        suma += digito
        num /= 10
    }
    return suma
}


// MARK: Ejercicio 8 - MCD
func mcd(a: Int, b: Int) -> Int {
    var a: Int = abs(a)
    var b: Int = abs(b)
    while b != 0 {
        let temp: Int = b
        b = a % b
        a = temp
    }
    return a
}


// MARK: Ejercicio 9 - Número perfecto
func esPerfecto(numero: Int) -> Bool {
    var divisores: [Int] = []
    var sumaDivisores = 0
    
    if esPrimo(n: numero) {
        return true
    } else {
        if(numero % 2 == 0){
            for i in stride(from: 0, to: numero, by: 2) {
                if(numero % i == 0 && i != numero){
                    divisores.append(i)
                }
            }
        } else {
            for i in stride(from: 1, to: numero, by: 2) {
                if(numero % i == 0 && i != numero){
                    divisores.append(i)
                }
            }
        }
    }
    
    for i in divisores{
        sumaDivisores += divisores[i]
    }
    
    if(sumaDivisores == numero){ return true }
    return false;
}


// MARK: Ejercicio 10 - Conversor de bases
func convertirABase(_ numero: Int, base: Int) -> String {
    switch base {
        case 2:
        case 8:
        case 10: return String(numero)
        case 16:
        default: return String(numero)
    }
}



