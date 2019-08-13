//
//  ViewController.swift
//  Numer0n
//
//  Created by Daiki Asahi on 2019/08/09.
//  Copyright © 2019 Daiki Asahi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var resultHistoryScrollView: UIScrollView!
    
    var answer: Answer = Answer()

    override func viewDidLoad() {

        super.viewDidLoad()

    }
    
    func setInput(_ input: Input) {

        if let result = Result(input, self.answer) {
            self.setResult(result)
        }

    }

    func setResult(_ result: Result) {

        if result.isCorrect() {
            self.resultLabel.text = "正解！"
        }
        else {
            self.resultLabel.text = "\(result.eatCount)Eat \(result.biteCount)Bite";
        }

    }

    /**
     * UITextFieldDelegate
     */
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        self.resultLabel.text = ""
        self.errorLabel.text = ""

        let input: Input = Input(textField.text!)
        if let error = input.error {

            self.errorLabel.text = error.toString()
            return false

        }

        self.inputTextField.resignFirstResponder()
        self.setInput(input)

        return true;
    }
}

