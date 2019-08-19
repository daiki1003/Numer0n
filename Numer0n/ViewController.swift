//
//  ViewController.swift
//  Numer0n
//
//  Created by Daiki Asahi on 2019/08/09.
//  Copyright © 2019 Daiki Asahi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UITableViewDataSource {

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var resultHistoryTableView: UITableView!
    @IBOutlet weak var retryButton: UIButton!
    
    var answer: Answer = Answer()
    var results: Array<Result> = [] {
        didSet {
            self.resultHistoryTableView.reloadData()
        }
    }

    override func viewDidLoad() {

        super.viewDidLoad()

    }
    
    func setInput(_ input: Input) {

        guard let result = Result(input, self.answer) else {
            return
        }

        self.addResult(result)

    }

    func addResult(_ result: Result) {

        if result.isCorrect() {
            self.resultLabel.text = "正解！"
        }
        else {
            self.resultLabel.text = "\(result.eatCount)Eat \(result.biteCount)Bite";
        }
        self.results.insert(result, at: 0)
        self.setIsCorrect(result.isCorrect())

    }
    
    func setIsCorrect(_ isCorrect: Bool) {
        self.retryButton.isHidden = !isCorrect
    }

    @IBAction func tapButton(_ sender: Any) {
        
        if (sender as! UIButton) == self.retryButton {
            self.retry()
        }

    }
    
    func retry() {
        self.answer = Answer()
        self.retryButton.isHidden = true
        self.results.removeAll()
        self.resultLabel.text = ""
        self.errorLabel.text = ""
    }
    
    /**
     * UITextFieldDelegate
     */
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        let inputStr: String = textField.text!
        textField.text = ""

        self.resultLabel.text = ""
        self.errorLabel.text = ""

        let input: Input = Input(inputStr, self.answer.policy)
        if let error = input.error {

            self.errorLabel.text = error.toString()
            return false

        }

        self.inputTextField.resignFirstResponder()
        self.setInput(input)

        return true;
    }
    
    /**
     * UITableViewDataSource
     */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return ResultView(self.results[indexPath.row])
    }
}

