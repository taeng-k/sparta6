//import UIKit

//var greeting = "Hello, playground"

//level 1


var firstNumber = 7
var secondNumber = 2
class Calculator {
    
    enum Operator {
        case add
        case subtract
        case multiply
        case divide
    }
    
    func calculate(Op: Operator, firstNumber: Double, secondNumber: Double) -> Double {
        
        switch Op {
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
        }
       
    }
}
let calculator = Calculator()
let addResult = firstNumber + secondNumber
let subtractResult = firstNumber - secondNumber
let multiplyResult = firstNumber * secondNumber
let divideResult = firstNumber / secondNumber

print("addResult : \(addResult)")
print("subtractResult : \(subtractResult)")
print("multiplyResult : \(multiplyResult)")
print("divideResult : \(divideResult)")

