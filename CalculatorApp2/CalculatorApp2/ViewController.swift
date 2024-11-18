//
//  ViewController.swift
//  CalculatorApp2
//
//  Created by t2023-m0072 on 11/18/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func clickNumberButton(_ sender: UIButton) {
        if let title = sender.titleLabel?.text {
            label.text?.first == "0" ? label.text = title : label.text?.append(title)
        }
    }
    @IBAction func clickEqualButton(_ sender: UIButton) {
        if let result = calculate(expression: label.text ?? "0") {
            label.text = String(result)
        }
        else { label.text = "잘못된 수식 입력입니다." }
    }
    
    @IBAction func clickACButton(_ sender: Any) {
        label.text = "0"
    }
    
    func calculate(expression: String) -> Int? {
        let expression = NSExpression(format: expression)
        if let result = expression.expressionValue(with: nil, context: nil) as? Int {
            return result
        } else {
            return nil
        }
    }
    
}
