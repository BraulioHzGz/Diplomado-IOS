//: [Previous](@previous)

func multiply(number: Int, limit: Int) -> [String]{
    var result: [String] = []
    for i in 1...limit {
        result.append("\(number) * \(i) = \(number * i)")
    }
    return result
}

print(multiply(number: 7, limit: 15))

//: [Next](@next)
