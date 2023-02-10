//
//  Calculus.swift
//  CountOnMe
//
//  Created by Cédrik Razafimanantsoa on 04/01/2023.
//  Copyright © 2023 Vincent Saluzzo. All rights reserved.
//

import Foundation

 

class Calculator {
    enum CalculatorError : Error {
        case invalidOperation
        case divideByZero
        
    }
    
    func calculate(operation: String) throws -> String {
        
        
        var operationsToReduce = operation.split(separator: " ").map { "\($0)" }
        var result: Double = 0

        
        while operationsToReduce.count > 1 {

            var operandIndex: Int
            
            // Looking for multiply sign
            if  let multiplyIndex = operationsToReduce.firstIndex(of: "x") {
                operandIndex = multiplyIndex
            }
            // Looking for divide sign
            else if let divideIndex = operationsToReduce.firstIndex(of: "/") {
                operandIndex = divideIndex
            }
            
            else if let additionIndex = operationsToReduce.firstIndex(of: "+") {
                operandIndex = additionIndex
            }
            
            else if let soustractionIndex = operationsToReduce.firstIndex(of: "-") {
                operandIndex = soustractionIndex
            }
            else {
                guard operationsToReduce.count == 1 else{
                    throw CalculatorError.invalidOperation
                }
                result = Double(operationsToReduce.first!)!
                return String(result)
            }

            // Assign value to left and right, check if both indexes are in the array, check if both are integers
            let leftIndex = Int(operandIndex - 1)
            let rightIndex = Int(operandIndex + 1)
            
            guard leftIndex >= 0 && rightIndex < operationsToReduce.count else {
                throw CalculatorError.invalidOperation
            }
            guard
                let left = Double(operationsToReduce[leftIndex]),
                let right = Double(operationsToReduce[rightIndex]) else {
                throw CalculatorError.invalidOperation
            }
           
            // Collecting operand type and depending on it which calculus should be made
            let operand = operationsToReduce[operandIndex]
            
            switch operand {
            case "x": result = left * right
            case "/":
                guard right != 0 else {
                    throw CalculatorError.divideByZero
                }
                result = left / right
            case "+": result = left + right
            case "-": result = left - right
            default: break
            }
            
            // Dropping numbers from operationsToReduce and inserting result at left index
            operationsToReduce.remove(at: operandIndex + 1)
            operationsToReduce.remove(at: operandIndex)
            operationsToReduce.remove(at: operandIndex - 1)
            operationsToReduce.insert("\(result)", at: operandIndex - 1)
            
            
        }
        return String(result)
    }

}
 // manage error
