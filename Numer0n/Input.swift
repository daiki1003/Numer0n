//
//  Input.swift
//  Numer0n
//
//  Created by Daiki Asahi on 2019/08/09.
//  Copyright © 2019 Daiki Asahi. All rights reserved.
//

import Foundation

class Input {

    var numbers:Array<Int> = []

    init?(_ input: String) {
        
        if !self.validate(input) { return nil }

        for numberChar in input {
            self.numbers.append(Int(String(numberChar))!)
        }
    }
    
    // 入力値のバリデーション
    private func validate(_ input: String) -> Bool {
        
        if input.count != Answer.digits { return false }

        for digit in 0 ..< Answer.digits {
            for nextDigit in digit + 1 ..< Answer.digits {
                if input[digit] == input[nextDigit] { return false }
            }
        }
        
        return true
    }
}
