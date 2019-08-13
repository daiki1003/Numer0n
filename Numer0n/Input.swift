//
//  Input.swift
//  Numer0n
//
//  Created by Daiki Asahi on 2019/08/09.
//  Copyright © 2019 Daiki Asahi. All rights reserved.
//

import Foundation

class Input {

    var error: InputError? = nil
    var numbers:Array<Int> = []

    init(_ input: String) {

        self.updateError(input)

        if error == nil {
            for numberChar in input {
                self.numbers.append(Int(String(numberChar))!)
            }
        }

    }
    
    private func updateError(_ input: String) {

        if input.count != Answer.digits {

            self.error = .WrongDigit
            return

        }
        
        for character in input {

            if Int(String(character)) == nil {

                self.error = .Uninterpretable
                return

            }

        }
        
        for digit in 0 ..< Answer.digits {
            for nextDigit in digit + 1 ..< Answer.digits {
                if input[digit] == input[nextDigit] {
                    
                    self.error = .UnfollowedPolicy
                    return
                    
                }
            }
        }
    }

    subscript (index: Int) -> Int {
        return self.numbers[index]
    }
}
