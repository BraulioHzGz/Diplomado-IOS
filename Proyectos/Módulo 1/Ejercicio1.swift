// MARK: Ejercicio 1

enum Operation {
    case addition
    case subtract
    case multiply
    case division
}

func operation(_ operationExpected: Operation, numbers: [Int]){
    var value = 0
    
    switch(operationExpected){
        case .addition: value = numbers.reduce(0, +)
        case .subtract: value = numbers.reduce(0, -)
        case .multiply: value = numbers.reduce(1, *)
        case .division:
            if numbers.contains(0) {
                print("error: division by zero")
                return
            } else {
                value = numbers.reduce(1, /)
            }
    }
    print(value)
}

operation(.addition, numbers: [1, 2, 3, 4])
operation(.division, numbers: [20, 5, 0])

// Command control espacio
