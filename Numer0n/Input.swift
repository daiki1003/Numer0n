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
        
        if input.count != 4 { return nil }
        
        for numberChar in input {
            self.numbers.append(Int(String(numberChar))!)
        }
    }
}
