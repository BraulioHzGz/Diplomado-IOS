//: [Previous](@previous)

import Foundation
import XCTest

class ArithmeticExpresionTests: XCTestCase {
    func test_ShouldAddtwoNumbers() {
        
        //MARK: Given
        let expression = ArithmeticExpression.add(.digit(2), .digit(3))
        
        //MARK: When
        let result = try! ArithmeticExpression.evaluate(expression)
        
        //MARK: Then
        XCTAssertEqual(result, 5)
    }
    
    func test_ShouldThrowErrorWhenDividiByZero() {
        let expression = ArithmeticExpression.divide(.digit(8), .digit(0))
        let expression2 = ArithmeticExpression.divide(.digit(8), .add(.digit(-2), .digit(2)))
        XCTAssertThrowsError(try ArithmeticExpression.evaluate(expression))
        XCTAssertThrowsError(try ArithmeticExpression.evaluate(expression2))
    }
}

//MARK: 'indirect' quiere decir que es recursivo
indirect enum ArithmeticExpression {
    case digit(Double)
    case add(_ lfh: ArithmeticExpression, _ rfh: ArithmeticExpression)
    case divide(_ lfh: ArithmeticExpression, _ rfh: ArithmeticExpression)
    
    static func evaluate(_ expression: ArithmeticExpression) throws -> Double {
        switch expression {
            case let .digit(value): return value
            case let .add(left, right): return try! evaluate(left) + evaluate(right)
            case let .divide(left, right):
                guard let right = try? evaluate(right), right != 0.0 else {
                    throw NSError()
                }
                return try evaluate(left) / right
        }
    }
}

ArithmeticExpresionTests.defaultTestSuite.run()
//: [Next](@next)
