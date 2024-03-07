import UIKit

class Calculator {
    var addOperation: AddOperation
    var substractOperation: SubstractOperation
    var multiplyOperation: MultiplyOperation
    var divideOperation: DivideOperation
    
    init(addOperation: AddOperation, substractOperation: SubstractOperation, multiplyOperation: MultiplyOperation, divideOperation: DivideOperation) {
        self.addOperation = addOperation
        self.substractOperation = substractOperation
        self.multiplyOperation = multiplyOperation
        self.divideOperation = divideOperation

func calculate(operator:String, firstNumber: Double, secondNumber: Double ) -> Double {

             class AddOperation {
             func add(firstNumber: Double, secondNumber: Double) -> Double {
             firstNumber + secondNumber
             }
             }
             class SubtractOperation {
             func subtract(firstNumber: Double, secondNumber: Double) -> Double {
             firstNumber - secondNumber
             }
             }
             class MultiplyOperation {
             func multiply(firstNumber: Double, secondNumber: Double) -> Double {
             firstNumber * secondNumber
             }
             }
             class DivideOperation {
             func divide(firstNumber: Double, secondNumber: Double ) -> Double {
             firstNumber / secondNumber
             }
             }
    }

    let calculator = Calculate()
    let addResult = firstNumber + secondNumber
    let subtractResult = firstNumber - secondNumber
    let multiplyResult = firstNumber * secondNumber
    let divideResult = firstNumber / secondNumber

    print("addResult: \(addResult)")
    print("subtractResult: \(subtractResult)")
    print("multiplyResult: \(multiplyResult)")
    print("divideResult: \(divideResult)")
