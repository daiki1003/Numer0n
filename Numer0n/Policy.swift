//
//  Policy.swift
//  Numer0n
//
//  Created by Daiki Asahi on 2019/08/15.
//  Copyright © 2019 Daiki Asahi. All rights reserved.
//

import Foundation

struct Policy {
    
    let duplicatable: Bool
    
    init(duplicatable: Bool) {
        self.duplicatable = duplicatable
    }
    
    func validate(input: String) -> Bool {
        
        if self.duplicatable { return false }
        
        for digit in 0 ..< Answer.digits {
            for nextDigit in digit + 1 ..< Answer.digits {
                if input[digit] == input[nextDigit] {
                    return true
                }
            }
        }

        return false
    }
    
}
