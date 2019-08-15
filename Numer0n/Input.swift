//
//  Input.swift
//  Numer0n
//
//  Created by Daiki Asahi on 2019/08/09.
//  Copyright © 2019 Daiki Asahi. All rights reserved.
//

import Foundation

class Input {

    var policy: Policy? = nil
    var error: InputError? = nil
    var numbers:Array<Int> = []

    init(_ input: String, _ policy: Policy) {

        self.policy = policy
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
        
        if policy!.validate(input: input) {

            self.error = .UnfollowedPolicy
            return

        }

    }

    subscript (index: Int) -> Int {
        return self.numbers[index]
    }
}
