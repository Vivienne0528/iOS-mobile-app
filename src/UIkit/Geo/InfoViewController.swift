//
//  InfoViewController.swift
//  Geothermal
//
//  Created by Leon ZHANG on 25/05/2016.
//  Copyright © 2016 ZHANGLiangliang. All rights reserved.
//

import UIKit
class InfoViewController: UIViewController {
    var whichInfo = String()
    
    @IBOutlet weak var information: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.preferredContentSize = CGSize(width: 300, height: 50)
        
        switch whichInfo {
        case "IGSHPA":
            information.text = "The International Ground Source Heat Pump Association (IGSHPA) provides pre-design calculation methods for vertically bored, horizontally bored and horizontally trenched systems. Their methods are based on the assumption that the ground, from which heat is exchanged, has a constant temperature at certain depths below the surface."
        case "ASHRAE":
            information.text = "The American Society of Heating, Refrigerating and Air-Conditioning Engineers (ASHRAE) method used in this iOS application has been recast by Philippe et al. (2010) and is used for vertical systems. This method is derived from the assumption that heat transfer in the ground only occurs by conduction and that moisture evaporation or underground water movement is not significant."
        default:
            break
        }
    }
}
