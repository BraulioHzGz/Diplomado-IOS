//: [Previous](@previous)

let filterNil: ([String?]) -> String = { texts in
    // reduce([], +)
    // .joined(" ") : no jaló
    texts.map{ $0 ?? "" }.filter{ !$0.isEmpty }.reduce(""){text, str in text.isEmpty ? str : text + " " + str}
}

let someStrings: [String?] = ["This", "is", nil, "not", nil, "a", "drill", nil, "!"]
print(filterNil(someStrings))

//: [Next](@next)
