//
//  CountOnMeTests.swift
//  CountOnMeTests
//
//  Created by Cédrik Razafimanantsoa on 03/01/2023.
//  Copyright © 2023 Vincent Saluzzo. All rights reserved.
//

import XCTest
@testable import CountOnMe

final class CountOnMeTests: XCTestCase {

    func testAddition() {
      let calculator = Calculator()
        let result = try? calculator.calculate(operation: "2 + 2")
      XCTAssertEqual(result, "4.0")
    }
    
    func testSoustraction() {
      let calculator = Calculator()
        let result = try? calculator.calculate(operation:"2 - 2")
      XCTAssertEqual(result, "0.0")
    }
    
    func testMultiplication() {
      let calculator = Calculator()
        let result = try? calculator.calculate(operation:"3 x 2")
      XCTAssertEqual(result, "6.0")
    }
    
    func testDivision() {
      let calculator = Calculator()
        let result = try? calculator.calculate(operation:"10 / 2")
      XCTAssertEqual(result, "5.0")
    }
    
    func testMultiplicationAndAddition() {
        let calculator = Calculator()
        let result = try? calculator.calculate(operation:"3 x 2 + 7")
        XCTAssertEqual(result, "13.0")
    }
    
    func testDivisionAndSoustraction() {
        let calculator = Calculator()
        let result = try? calculator.calculate(operation:"10 / 2 - 3")
        XCTAssertEqual(result, "2.0")
    }
    
    func testDivisionAndSoustractionResultingInDouble() {
        let calculator = Calculator()
        let result = try! calculator.calculate(operation:"5 / 3 + 2")
        XCTAssertEqual(Double(result)!, 3.6, accuracy: 0.1)
    }
    
    func testDivisionByZero() {
        let calculator = Calculator()
        do {
            _ = try calculator.calculate(operation:"58 / 0")
            XCTFail("Divide by Zero not successful")
        }
        catch(let error as Calculator.CalculatorError) {
            XCTAssertEqual(error, .divideByZero)
        }
        catch {
            XCTFail("Divide by Zero not successful")
        }
    }

    func testMultiplicationAndAddition2() {
        let calculator = Calculator()
        let result = try? calculator.calculate(operation:"7 + 3 x 2")
        XCTAssertEqual(result, "13.0")
    }
    

    func testInvalidOperations() {
        let calculator = Calculator()
        do {
            _ = try calculator.calculate(operation:"7 +")
            XCTFail("Operation shouldn't succeed")
        }
        catch(let error as Calculator.CalculatorError) {
            XCTAssertEqual(error, .invalidOperation)
        }
        catch {
            XCTFail("Divide by Zero not successful")
        }
        do {
            _ = try calculator.calculate(operation:"+ 7")
            XCTFail("Operation shouldn't succeed")
        }
        catch(let error as Calculator.CalculatorError) {
            XCTAssertEqual(error, .invalidOperation)
        }
        catch {
            XCTFail("Divide by Zero not successful")
        }
        do {
            _ = try calculator.calculate(operation:"x 7")
            XCTFail("Operation shouldn't succeed")
        }
        catch(let error as Calculator.CalculatorError) {
            XCTAssertEqual(error, .invalidOperation)
        }
        catch {
            XCTFail("Divide by Zero not successful")
        }
        do {
            _ = try calculator.calculate(operation:"/ 7")
            XCTFail("Operation shouldn't succeed")
        }
        catch(let error as Calculator.CalculatorError) {
            XCTAssertEqual(error, .invalidOperation)
        }
        catch {
            XCTFail("Divide by Zero not successful")
        }
        do {
            _ = try calculator.calculate(operation:"7 x")
            XCTFail("Operation shouldn't succeed")
        }
        catch(let error as Calculator.CalculatorError) {
            XCTAssertEqual(error, .invalidOperation)
        }
        catch {
            XCTFail("Divide by Zero not successful")
        }
        do {
            _ = try calculator.calculate(operation:"7 /")
            XCTFail("Operation shouldn't succeed")
        }
        catch(let error as Calculator.CalculatorError) {
            XCTAssertEqual(error, .invalidOperation)
        }
        catch {
            XCTFail("Divide by Zero not successful")
        }
        do {
            _ = try calculator.calculate(operation:"a / b")
            XCTFail("Operation shouldn't succeed")
        }
        catch(let error as Calculator.CalculatorError) {
            XCTAssertEqual(error, .invalidOperation)
        }
        catch {
            XCTFail("Divide by Zero not successful")
        }
        do {
            _ = try calculator.calculate(operation:"a x b")
            XCTFail("Operation shouldn't succeed")
        }
        catch(let error as Calculator.CalculatorError) {
            XCTAssertEqual(error, .invalidOperation)
        }
        catch {
            XCTFail("Divide by Zero not successful")
        }
        do {
            _ = try calculator.calculate(operation:"a + b")
            XCTFail("Operation shouldn't succeed")
        }
        catch(let error as Calculator.CalculatorError) {
            XCTAssertEqual(error, .invalidOperation)
        }
        catch {
            XCTFail("Divide by Zero not successful")
        }
        do {
            _ = try calculator.calculate(operation:"a - b")
            XCTFail("Operation shouldn't succeed")
        }
        catch(let error as Calculator.CalculatorError) {
            XCTAssertEqual(error, .invalidOperation)
        }
        catch {
            XCTFail("Divide by Zero not successful")
        }
        do {
            _ = try calculator.calculate(operation:"a x")
            XCTFail("Operation shouldn't succeed")
        }
        catch(let error as Calculator.CalculatorError) {
            XCTAssertEqual(error, .invalidOperation)
        }
        catch {
            XCTFail("Divide by Zero not successful")
        }
        do {
            _ = try calculator.calculate(operation:"a /")
            XCTFail("Operation shouldn't succeed")
        }
        catch(let error as Calculator.CalculatorError) {
            XCTAssertEqual(error, .invalidOperation)
        }
        catch {
            XCTFail("Divide by Zero not successful")
        }
        do {
            _ = try calculator.calculate(operation:"2 : 1")
            XCTFail("Operation shouldn't succeed")
        }
        catch(let error as Calculator.CalculatorError) {
            XCTAssertEqual(error, .invalidOperation)
        }
        catch {
            XCTFail("Divide by Zero not successful")
        }
    }


}

