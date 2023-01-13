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

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}

class Test {
    func testAddition() {
      let calculator = Calculator()
      let result = calculator.calculate(operation: "2+2")
      XCTAssertEqual("\(result)", "4")
    }
    
    func testSoustraction() {
      let calculator = Calculator()
        let result = calculator.calculate(operation:"2-2")
      XCTAssertEqual("\(result)", "0")
    }
    
    func testMultiplication() {
      let calculator = Calculator()
        let result = calculator.calculate(operation:"3*2")
      XCTAssertEqual("\(result)", "6")
    }
    
    func testDivision() {
      let calculator = Calculator()
        let result = calculator.calculate(operation:"10/2")
      XCTAssertEqual("\(result)", "5")
    }
    
    func testMultiplicationAndAddition() {
        let calculator = Calculator()
        let result = calculator.calculate(operation:"3*2+7")
        XCTAssertEqual("\(result)", "13")
    }
    
    func testDivisionAndSoustraction() {
        let calculator = Calculator()
        let result = calculator.calculate(operation:"10/2-3")
        XCTAssertEqual("\(result)", "2")
    }
    
    func testDivisionByZero() {
        let calculator = Calculator()
        let result = calculator.calculate(operation:"58/0")
        XCTAssertEqual("\(result)", "Erreur ! Division par 0 impossible.")
    }
    
}
