//: [Previous](@previous)

func filterOptionals(_ texts: [String?]) -> [String] {
    var result: [String] = []
    
    for text in texts {
        if let text = text {
            result.append(text)
        }
    }
    
    if result.isEmpty {
        print("All values are empty")
        return []
    }
    
    return result
}

let texts: [String?] = ["Hello", nil, "World"]
print(filterOptionals(texts))

let texts2: [String?] = ["Hello", nil, "World", nil, nil, "in", "Swift", nil, "!"]
print(filterOptionals(texts2))

let textsNil: [String?] = [nil, nil, nil]
print(filterOptionals(textsNil))

//: [Next](@next)
