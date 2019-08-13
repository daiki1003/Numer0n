//
//  InputError.swift
//  Numer0n
//
//  Created by Daiki Asahi on 2019/08/12.
//  Copyright © 2019 Daiki Asahi. All rights reserved.
//

import Foundation

enum InputError {
    case WrongDigit
    case Uninterpretable
    case UnfollowedPolicy
    
    func toString() -> String {
        switch self {
        case .WrongDigit: return "\(Answer.digits)桁の整数値を入力してください。"
        case .Uninterpretable: return "数字のみを入力してください。"
        case .UnfollowedPolicy: return "フォーマットが正しくありません。"
        }
    }
}
