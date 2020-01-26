import UIKit
import Foundation
class Calculator {


    // MARK: - Constants
    enum Operation {
        case equals
        case constant(value: Double)
        case unary(function: (Double) -> Double)
        case binary(function: (Double, Double) -> Double)
     }
    
    var map: [String : Operation] = [
        "/" : .binary {$0 / $1},
        "-" : .binary { $0 - $1 },
        "+" : .binary { $0 + $1 },
        "*" : .binary { $0 * $1},
        "=" : .equals,
        "%" : .unary {$0/100},
        "root" : .unary{sqrt($0)},
        "x^y" : .binary{pow($0 , $1)},
        "pi" : .constant (value: Double.pi),
        "x!" : .unary(function: factorial(n:)),
        "rand": .constant(value: Double.random(in: 0..<1))
        
        ]
    // MARK: - Function AC
    func clear(){
        result = 0
        reminder = 0
        lastBinaryOperation = nil
    }
    // MARK: - Function Factorial
  static  func factorial(n:Double) ->Double{
        if (n<=1){
            return 1
        }
        return n * factorial(n: n-1)
        
    }
 
    // MARK: - Variables
    public var result: Double = 0
    var lastBinaryOperation: ((Double, Double) -> Double)?
    public  var reminder: Double = 0
    
    // MARK: - Methods
    func setOperand(number: Double) {
        result = number
    }
    
    func executeOperation(symbol: String) {
        guard let operation = map[symbol] else {
            print("ERROR: no such symbol in map")
            return
        }
        
        switch operation {
       
        case .constant(let value):
           result=value
        case .unary(let function):
            result = function(result)
           
        case .binary(let function):
            if lastBinaryOperation != nil {
                executeOperation(symbol: "=")
            }
            lastBinaryOperation = function
            reminder = result
            
        case .equals:
            if let lastOperation = lastBinaryOperation {
                result = lastOperation(reminder, result)
                  reminder = 0
                lastBinaryOperation = nil
              
            }
            
        
    }
}
}
