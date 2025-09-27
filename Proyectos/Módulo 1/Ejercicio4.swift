//: [Previous](@previous)

enum PasswordStrength {
    case weak
    case medium
    case strong
    case notValidPassword
}

func checkPassword(_ password: String) -> PasswordStrength {
    guard (!password.isEmpty && password.count >= 6) else {
        return .notValidPassword
    }
    
    var containsCapital: Bool = false
    var containsNumber: Bool = false
    var containsPoint: Bool = false
    var containsSpecialCharacter: Bool = false
    
    for char in password {
        if let valor = char.unicodeScalars.first?.value {
            //asciiArray.append(valor)
            switch(valor){
                case 65...90: containsCapital = true
                case 48...57: containsNumber = true
                case 46: containsPoint = true
                case 33...45, 47, 58...64, 91...96: containsSpecialCharacter = true
                default: break
            }
        }
    }
    
    if(password.count == 6){
        if(containsCapital){
            if(containsNumber){
                if(containsPoint){
                    if(containsSpecialCharacter){
                        return .strong
                    } else {
                        return .strong
                    }
                } else {
                    return .medium
                }
            } else {
                return .weak
            }
            return .weak
        }
    } else {
        if(containsCapital){
            if(containsNumber){
                if(containsPoint){
                    if(containsSpecialCharacter){
                        return .strong
                    } else {
                        return .strong
                    }
                } else {
                    return .medium
                }
            } else {
                return .weak
            }
        }
    }
    return .weak
}

print(checkPassword("Pass123"))
print(checkPassword("Pass123."))
print(checkPassword("Strong#Pass1."))
print(checkPassword("Hola12"))

//: [Next](@next)
