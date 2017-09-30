//
//  ViewController.swift
//  SubviewResizing
//
//  Created by Bharath R on 01/10/17.
//  Copyright © 2017 Bharath R. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var placeholderView: UIView?
    @IBOutlet weak var placeholderViewHeight: NSLayoutConstraint!
    @IBOutlet weak var secondPlaceholderView: UIView!
    @IBOutlet weak var secondPlaceholderViewHeight: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        loadNIBView(inPlaceholder: placeholderView!, withTag: 12)
        loadNIBView(inPlaceholder: secondPlaceholderView!, withTag: 14)
    }
    
    func loadNIBView(inPlaceholder: UIView, withTag: Int) {
        if let testNib = Bundle.main.loadNibNamed("MutlipleSubViewHolderView", owner: self, options: nil)?.first as? MutlipleSubViewHolderView {
            testNib.delegate = self
            testNib.tag = withTag
            inPlaceholder.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: (placeholderView?.frame.height)!)
            inPlaceholder.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            inPlaceholder.addSubview(testNib)
            testNib.updateFrames()
        }
    }

}

extension ViewController: MutlipleSubViewHolderViewDelegate {
    func updatedFrame(withHeight: CGFloat, forViewWithTag: Int) {
        if forViewWithTag == 12 {
            placeholderViewHeight.constant = withHeight
        } else if forViewWithTag == 14 {
            secondPlaceholderViewHeight.constant = withHeight
        } else {
            // Do Nothing
        }
    }
}
