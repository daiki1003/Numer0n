//
//  ResultView.swift
//  Numer0n
//
//  Created by Daiki Asahi on 2019/08/12.
//  Copyright © 2019 Daiki Asahi. All rights reserved.
//

import Foundation
import UIKit

class ResultView : UITableViewCell {
    
    @IBOutlet weak var inputLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    var result: Result? {
        didSet {
            self.updateView()
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.loadNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.loadNib()
    }

    convenience init(_ result: Result) {

        self.init()
        self.result = result

        self.updateView()
    }

    func updateView() {

        for digit in 0 ..< result!.input!.numbers.count {
            self.inputLabel.text?.append(String(result!.input!.numbers[digit]))
        }
        self.resultLabel.text = "\(result!.eatCount)Eat \(result!.biteCount)Bite"

    }

    func loadNib()  {

        if let view = Bundle.main.loadNibNamed(String(describing: type(of: self)), owner: self, options: nil)?.first as? UIView {
            view.frame = self.bounds
            self.addSubview(view)
        }
    }

}
