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
            // update eatCount, biteCount
        }
    }
    
    var eatCount: Int = 0
    var biteCount: Int = 0
    
    init?(_ input: Input) {

        if input.numbers.count != 4 { return nil }

        self.input = input
    }
}
