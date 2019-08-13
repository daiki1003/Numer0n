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
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var resultHistoryScrollView: UIScrollView!

    override func viewDidLoad() {

        super.viewDidLoad()

    }

    /**
     * UITextFieldDelegate
     */
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        guard let input = Input(textField.text!) else {
            return false
        }

        self.inputTextField.resignFirstResponder()
        
        return true;
    }
}

