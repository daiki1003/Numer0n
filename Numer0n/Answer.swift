//
//  Answer.swift
//  Numer0n
//
//  Created by Daiki Asahi on 2019/08/09.
//  Copyright © 2019 Daiki Asahi. All rights reserved.
//

import Foundation

class Answer {

    static var digits: Int = 4

    var numbers: Array<Int> = []

    init() {
        self.generateNumbers()
    }

    // 正解の生成
    private func generateNumbers() {
        for _ in 0 ..< Answer.digits {
            self.numbers.append(self.generateNumber())
        }
    }

    // 一桁分の正解の生成
    private func generateNumber() -> Int {

        let numberCandidate: Int = Int.random(in: 0 ..< 10)
        for number in self.numbers {
            if number == numberCandidate { return self.generateNumber() }
        }

        return numberCandidate

    }
}
