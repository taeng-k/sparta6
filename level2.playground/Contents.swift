//import UIKit

//var greeting = "Hello, playground"

//level 2 remainder 추가


var firstNumber = 19
var secondNumber = 7
class Calculator {
    
    enum Operator {
        case add
        case subtract
        case multiply
        case divide
        case remainder
    }
    
    func calculate(op: Operator, firstNumber: Double, secondNumber: Double) -> Double {
        
        switch op {
        case .add:
            return firstNumber + secondNumber
        case .subtract:
            return firstNumber - secondNumber
        case .multiply:
            return firstNumber * secondNumber
        case .divide:
            if secondNumber == 0 {
                return 0
            }
            return firstNumber / secondNumber
        case .remainder:
            return firstNumber.truncatingRemainder(dividingBy: secondNumber)
        }
       
    }
}
let calculator = Calculator()
let addResult = firstNumber + secondNumber
let subtractResult = firstNumber - secondNumber
let multiplyResult = firstNumber * secondNumber
let divideResult = firstNumber / secondNumber
let remainderResult = firstNumber % secondNumber

print("addResult : \(addResult)")
print("subtractResult : \(subtractResult)")
print("multiplyResult : \(multiplyResult)")
print("divideResult : \(divideResult)")
print("remainderResult : \(remainderResult)")
