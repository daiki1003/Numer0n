//
//  Result.swift
//  Numer0n
//
//  Created by Daiki Asahi on 2019/08/09.
//  Copyright © 2019 Daiki Asahi. All rights reserved.
//

import Foundation

class Result {
    
    var input: Input? = nil {
        didSet {
            self.updateCounts()
        }
    }
    var answer: Answer? = nil {
        didSet {
            self.updateCounts()
        }
    }
    
    var eatCount: Int = 0
    var biteCount: Int = 0
    
    init?(_ input: Input, _ answer: Answer) {

        if input.numbers.count != Answer.digits { return nil }

        self.input = input
        self.answer = answer

        self.updateCounts()
    }
    
    private func updateCounts() {
        
        guard let _ = self.input else { return }
        guard let _ = self.answer else { return }
        
        for digit in 0..<Answer.digits {
            
            if self.updateEatCount(digit: digit) {
                continue
            }
            
            self.updateBiteCount(digit: digit)
        }

    }
    
    @discardableResult
    private func updateEatCount(digit: Int) -> Bool {

        if self.input![digit] == self.answer![digit] {

            self.eatCount += 1
            return true

        }

        return false
    }
    
    @discardableResult
    private func updateBiteCount(digit: Int) -> Bool {
        
        for checkDigit in 0 ..< Answer.digits {

            if checkDigit == digit {
                continue
            }

            if self.input![digit] == self.answer![checkDigit] {

                self.biteCount += 1
                return true

            }

        }

        return false
    }
}
