//
//  TableViewCell.swift
//  headerSection
//
//  Created by Philippe Machetto on 22/09/2017.
//  Copyright © 2017 Philippe Machetto. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell, FirstResponderControlDelegate {

    @IBOutlet weak var aLabel: UILabel!
    @IBOutlet weak var control: FirstResponderControl!
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    override func awakeFromNib() {
        control.backgroundColor = .blue
        aLabel.text = "test"
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: "cell")

        control.addTarget(control, action: #selector(becomeFirstResponder), for: .touchUpInside)
        control.delegate = self

    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func firstResponderControlHasText(_ control: FirstResponderControl) -> Bool {
        if let isEmpty = aLabel
            .text?.isEmpty {
            return isEmpty
        }
        return false
    }
    
    func firstResponderControlDidDeleteBackwards(_ control: FirstResponderControl) {
        if let text = aLabel.text, !text.isEmpty{
            aLabel.text = text.substring(to: text.index(before: text.endIndex))
        }
    }
    
    func firstResponderControl(_ control: FirstResponderControl, didReceiveText text: String) {
        aLabel.text?.append(text)
    }
}
