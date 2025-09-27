//: [Previous](@previous)

import Foundation

struct Primes {
    
    func isPrime(_ number: Int) -> Bool {
        if number <= 1 { return false }
        if number == 2 { return true }
        
        /*
            Si un número N tiene un divisor A tal que A > sqrt(N), entonces debe existir otro B tal que:
            B < sqrt(N) y A * B = N
         */
        
        let limit = Int(sqrt(Double(number)))
        for idx in 2..<limit+1 {
            if number % idx == 0 {
                return false
            }
        }
        
        return true;
    }
    
    func calculate(upTo: Int) -> [Int] {
        var result = [Int]()
        
        for number in 2..<upTo {
            if isPrime(number) {
                result.append(number)
            }
        }
        
        return result
    }
}

var PrimeCalculator = Primes()
print(PrimeCalculator.calculate(upTo: 85))
//: [Next](@next)
