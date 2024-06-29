//
//  checkBoxControl.swift
//  Geo
//
//  Created by Leon ZHANG on 10/05/2016.
//  Copyright © 2016 ZHANGLiangliang. All rights reserved.
//

import UIKit

class checkBoxControl: UIButton {
        // Images
        let checkedImage = UIImage(named: "checked_checkbox")! as UIImage
        let uncheckedImage = UIImage(named: "unchecked_checkbox")! as UIImage
        
        // Bool property
        var isChecked: Bool = false {
            didSet{
                if isChecked == true {
                    self.setImage(checkedImage, for: [])
                } else {
                    self.setImage(uncheckedImage, for: [])
                }
            }
        }
        
        override func awakeFromNib() {
            self.addTarget(self, action: #selector(checkBoxControl.buttonClicked), for: UIControl.Event.touchUpInside)
            self.isChecked = false
        }
        
    @objc func buttonClicked(sender: UIButton) {
            if sender == self {
                if isChecked == true {
                    isChecked = false
                } else {
                    isChecked = true
                }
            }
        }
    }
