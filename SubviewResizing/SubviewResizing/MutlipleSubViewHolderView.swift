//
//  MutlipleSubViewHolderView.swift
//  SubviewResizing
//
//  Created by Bharath R on 01/10/17.
//  Copyright © 2017 Bharath R. All rights reserved.
//

import UIKit

protocol MutlipleSubViewHolderViewDelegate {
    func updatedFrame(withHeight: CGFloat, forViewWithTag: Int)
}

class MutlipleSubViewHolderView: UIView {

    @IBOutlet weak var secondViewHeight: NSLayoutConstraint!
    @IBOutlet weak var thirdViewHeight: NSLayoutConstraint!
    
    var delegate: MutlipleSubViewHolderViewDelegate?
    var isExpanded = true
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    func updateFrames() {
        frame = CGRect(x: 0, y: 0, width: frame.size.width, height: (100 + secondViewHeight.constant + thirdViewHeight.constant))
        delegate?.updatedFrame(withHeight: self.frame.height, forViewWithTag: self.tag)
    }

    @IBAction func buttonPressed(_ sender: Any) {
        secondViewHeight.constant = isExpanded ? 100 : 0
        isExpanded = !isExpanded
        updateFrames()
        
    }
    
}
