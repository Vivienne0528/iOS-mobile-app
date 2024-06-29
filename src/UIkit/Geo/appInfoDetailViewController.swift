//
//  appInfoDetailViewController.swift
//  Geothermal
//
//  Created by Leon ZHANG on 25/05/2016.
//  Copyright © 2016 ZHANGLiangliang. All rights reserved.
//

import UIKit
class appInfoDetailViewController: UIViewController {
    var whichInfoDetail = String()
    
    @IBOutlet weak var information: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        switch whichInfoDetail {
        case "developerInformation":
            information.text = "The Developers of this application were Master students completing their research project at The University of Melbourne."
            self.preferredContentSize = CGSize(width: 250, height: 100)
            self.navigationItem.title = "Developer Information"
            case "aboutTheApp":
            information.text = "Version 1.0. \nDeveloped by The University of Melbourne.\nThis mobile application is intended to be used as a tool to support contractors during the pre-design phase of GHE systems. This application and its results are not intended to replace current software and(or) hand calculations used in the pre-design process."
            self.preferredContentSize = CGSize(width: 250, height: 200)
            self.navigationItem.title = "About The App"
        default:
            break
        }
    }
}
