//
//  String+Subscript.swift
//  Numer0n
//
//  Created by Daiki Asahi on 2019/08/12.
//  Copyright © 2019 Daiki Asahi. All rights reserved.
//

import Foundation

extension String {
    subscript(index: Int) -> String {
        return String(self[self.index(self.startIndex, offsetBy: index)])
    }
}
