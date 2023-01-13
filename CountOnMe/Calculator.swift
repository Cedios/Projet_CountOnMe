//
//  Calculus.swift
//  CountOnMe
//
//  Created by Cédrik Razafimanantsoa on 04/01/2023.
//  Copyright © 2023 Vincent Saluzzo. All rights reserved.
//

import Foundation


class Calculator {

    func calculate(operation: String) -> Int {
         /// logique de calcul & remplacer operationsToReduce par le paramètre
        /// var elements: [String] {
     
        var operationsToReduce = operation.split(separator: " ").map { "\($0)" }
        let result: Int
        
        while operationsToReduce.count > 1 {
            
            if operationsToReduce.contains("x") {
                
                let operand = String(operationsToReduce.firstIndex(of: "x")!)
                let left = Int(exactly: operationsToReduce.index(before: operationsToReduce.firstIndex(of: "x")!))!
                let right = Int(exactly: operationsToReduce.index(after: operationsToReduce.firstIndex(of: "x")!))!
                
                let result: Int
                result = left * right
                operationsToReduce = Array(operationsToReduce.drop([operationsToReduce.firstIndex(of: "x")]))
                operationsToReduce.insert("\(result)", at: 0)
                
            }
            
            else if operationsToReduce.contains("/") {
                let operand = String(operationsToReduce.firstIndex(of: "/")!)
                let left = Int(exactly: operationsToReduce.index(before: operationsToReduce.firstIndex(of: "/")!))!
                let right = Int(exactly: operationsToReduce.index(after: operationsToReduce.firstIndex(of: "/")!))!
                result = left / right
                
                // operationsToReduce = Array(operationsToReduce.drop)
                // operationsToReduce.insert("\(result)", at: 0)
                
            }
            
            else {
                
                let left = Int(operationsToReduce[0])!
                let operand = operationsToReduce[1]
                let right = Int(operationsToReduce[2])!
                
                let result: Int
                switch operand {
                case "+": result = left + right
                case "-": result = left - right
                default: fatalError("Unknown operator !")
                }
                
                operationsToReduce = Array(operationsToReduce.dropFirst(3))
                operationsToReduce.insert("\(result)", at: 0)
            }
            // indexof to use to drop proper elements
            // add result of multiply and divide at the beginning of table then process with the remaining calculus
            
            result = Int(operationsToReduce.first!)!
        }
        return result
    }
}
