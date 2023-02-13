//
//  ViewController.swift
//  SimpleCalc
//
//  Created by Vincent Saluzzo on 29/03/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import UIKit        

class ViewController: UIViewController {
    @IBOutlet weak var textView: UITextView!
    @IBOutlet var numberButtons: [UIButton]!
    
    
    var expressionHaveResult: Bool {
        return textView.text.firstIndex(of: "=") != nil
    }
    
    // View Life cycles
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // View actions
    @IBAction func tappedCancelButton(_ sender: UIButton) {
        textView.text = ""
    }
    
    @IBAction func tappedNumberButton(_ sender: UIButton) {
        guard let numberText = sender.title(for: .normal) else {
            return
        }
        
        if expressionHaveResult {
            textView.text = ""
        }
        
        textView.text.append(numberText)
    }
    
    @IBAction func tappedAdditionButton(_ sender: UIButton) {
        textView.text.append(" + ")
    }
    
    @IBAction func tappedSubstractionButton(_ sender: UIButton) {
        textView.text.append(" - ")
    }
    
    @IBAction func tappedMultiplicationButton(_ sender: UIButton) {
        textView.text.append(" x ")
    }
    
    @IBAction func tappedDivisionButton(_ sender: UIButton) {
        textView.text.append(" / ")
    }
    
    @IBAction func tappedEqualButton(_ sender: UIButton) {

        let calculator = Calculator()
        do {
            let result = try calculator.calculate(operation: textView.text)
            textView.text = result
            
        }
        catch(let error as Calculator.CalculatorError){
            switch error {
            case .divideByZero:
                let alertVC = UIAlertController(title: "Zéro!", message: "Division par zéro interdite !", preferredStyle: .alert)
                alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                self.present(alertVC, animated: true, completion: nil)
            case .invalidOperation:
                let alertVC = UIAlertController(title: "Zéro!", message: "Opération incorrecte !", preferredStyle: .alert)
                alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                self.present(alertVC, animated: true, completion: nil)
            }
        }
        catch {
        }
    }
    
}
