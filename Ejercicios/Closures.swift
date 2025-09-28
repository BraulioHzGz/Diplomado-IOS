import UIKit

// MARK: Ejercicio 1
func operation(firstNumber: Int, secondNumber: Int, using option: (Int, Int) -> Int) {
    print(option(firstNumber, secondNumber))
}

operation(firstNumber: 10, secondNumber: 10, using: *)


// MARK: Ejercicio 2
print("\n---------- EJERCICIO 2 ----------")
func numberComparation(_ n1: Int, _ n2: Int, using comparator: (Int, Int) -> Bool) {
    print(comparator(n1, n2))
}

numberComparation(5, 10, using: <)


// MARK: Ejercicio 3
print("\n---------- EJERCICIO 3 ----------")
func concatString(text: [String], using concatenator: ([String]) -> String) -> String {
    return concatenator(text)
}

let concatenator : ([String]) -> String = { (text: [String]) -> String in
    var finalString : String = ""
    
    for i in 0..<text.count {
        i != text.count - 1 ? finalString.append("\(text[i]) ") : finalString.append("\(text[i])")
    }
    return finalString
}

print(concatString(text: ["Hola", "guerrero", "ordinario", "perdido", "en", "el", "tiempo"], using: concatenator))


// MARK: Ejercicio 4
print("\n---------- EJERCICIO 4 ----------")
func stringComparator(firstString: String, secondString: String, using comparatorOfString: (String, String) -> Bool){
    print(comparatorOfString(firstString, secondString))
}

stringComparator(firstString: "Hola", secondString: "hola"){ $0 == $1 }
stringComparator(firstString: "Swift", secondString: "Swift"){ $0 == $1 }
stringComparator(firstString: "Esta es una cadena", secondString: "Esta es otra cadena"){ $0.count > $1.count }
stringComparator(firstString: "Esta es una cadena", secondString: "Esta es otra cadena"){ $0.count < $1.count }
stringComparator(firstString: "Estoy programando desde Swift", secondString: "Swift"){ $0.contains($1) }
stringComparator(firstString: "Estoy programando desde Swift", secondString: "Java"){ $0.contains($1) }


// MARK: Ejercicio 5
print("\n---------- EJERCICIO 5 ----------")
func transformText(text: String, using transformer: (String) -> String) -> String {
    return transformer(text)
}

print(transformText(text: "Hola mundo desde Swift"){ $0.lowercased() })
print(transformText(text: "Hola mundo desde Swift"){ $0.uppercased() })
print(transformText(text: "Hola mundo desde Swift"){ String($0.reversed()) })
print(transformText(text: "Hola mundo desde Swift"){ String($0.reversed()).capitalized })


// MARK: Ejercicio 6
print("\n---------- EJERCICIO 6 ----------")
func filterNumbers(_ numbers: [Int], _ conditional: (Int) -> Bool) -> [Int] {
    var finalResult: [Int] = []
    
    for idx in 0..<numbers.count {
        if(conditional(numbers[idx])){ finalResult.append(numbers[idx]) }
    }
    
    return finalResult
}

let numbers = [-2, -5, 3, 0, 1, 6, -2, 8, -3, 9, 3]
print(filterNumbers(numbers){ $0 > 0 })
print(filterNumbers(numbers){ $0 < 0 })
print(filterNumbers(numbers){ $0 == 10 })
print(filterNumbers(numbers){ $0 % 2 == 0 })
print(filterNumbers(numbers){ $0 * 3 > 10 })


// MARK: Ejercicio 7
print("\n---------- EJERCICIO 7 ----------")
func modifyArray(_ numbers: [Int], using transformer: (Int) -> Int) -> [Int] {
    return numbers.map(transformer)
}

print(modifyArray(numbers){ $0 * 2 })
print(modifyArray(numbers){ $0 - 1 })
print(modifyArray(numbers){ $0 % 3 })


// MARK: Ejercicio 8
print("\n---------- EJERCICIO 8 ----------")
func findElementInArray(_ numbers: [Int], target: Int, conditionalClosure: (Int, Int) -> Bool) -> Bool {
    for idx in 0..<numbers.count {
        if conditionalClosure(numbers[idx], target){
            return true
        }
    }
    return false
}

print(findElementInArray(numbers, target: 20){$0 == $1})
print(findElementInArray(numbers, target: 0){$0 == $1})
print(findElementInArray(numbers, target: -7){$0 == $1})
print(findElementInArray(numbers, target: -3){$0 == $1})


// MARK: Ejercicio 9
print("\n---------- EJERCICIO 9 ----------")

// Método de ordenamiento seleccionado: SELECTION SORT
func selectionSort(_ floatArray: [Int], using modeOfComparation: (Int, Int) -> Bool) -> [Int] {
    var array = floatArray
    var n = array.count
    
    for i in 0..<n-1 {
        var min_idx = i
        for j in i+1..<n {
            if(modeOfComparation(array[j], array[min_idx])){
                min_idx = j
            }
        }
        array.swapAt(i, min_idx)
    }
    
    return array
}

func sortArray(numbers: [Int], using modeOfComparation: (Int, Int) -> Bool) {
    print(selectionSort(numbers, using: modeOfComparation))
}

let firstArray = [1, 5, 6, 2, 8, 10, 3]

sortArray(numbers: firstArray){$0 < $1}
sortArray(numbers: firstArray){$0 > $1}
sortArray(numbers: numbers){$0 < $1}
sortArray(numbers: numbers){$0 > $1}
