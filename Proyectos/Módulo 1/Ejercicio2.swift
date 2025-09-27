//: [Previous](@previous)

func checkNumbers(_ intNumbers: [Int]) -> Dictionary<String, Int>{
    var positives = 0
    var negatives = 0
    var zeros = 0
    
    for element in intNumbers{
        if(element > 0){ positives += 1 }
        else if(element == 0){ zeros += 1 }
        else { negatives += 1 }
    }
    return ["positives": positives, "negatives": negatives, "zeros": zeros]
}

print(checkNumbers([-3, 0, 2, 5, -1]))

//: [Next](@next)
