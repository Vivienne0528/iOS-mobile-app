//
//  InformationMenuViewController.swift
//  Geo
//
//  Created by Leon ZHANG on 25/04/2016.
//  Copyright © 2016 ZHANGLiangliang. All rights reserved.
//

import UIKit
class AppInformationMenuViewController: UIViewController{
    override func viewWillAppear(_ animated: Bool) {
        self.preferredContentSize = CGSize(width: 200, height: 130)
    }
    var presentInfo = String()
    
    @IBAction func developerInformation(_ sender: Any) {
        presentInfo = "developerInformation"
    }
    

    @IBAction func abouTheApp(_ sender: Any) {
        presentInfo = "aboutTheApp"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "aboutTheApp" || segue.identifier == "developerInformation"{
        let dvc: appInfoDetailViewController = segue.destination as! appInfoDetailViewController
        dvc.whichInfoDetail = presentInfo
        }
    }
    
}
