//
//  IGSHPASystemSettingViewController.swift
//  Geo
//
//  Created by Leon ZHANG on 5/05/2016.
//  Copyright © 2016 ZHANGLiangliang. All rights reserved.
//

import UIKit
class IGSHPASystemSettingViewController:UIViewController,UIPopoverPresentationControllerDelegate {
    
    @IBOutlet weak var verticallyBored: UIButton!
    @IBOutlet weak var horizontallyBored: UIButton!
    @IBOutlet weak var horizontallyTrenched: UIButton!
    
    @IBOutlet weak var menu: UIBarButtonItem!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        verticallyBored.backgroundColor = UIColor.clear
        verticallyBored.layer.cornerRadius = 5
        verticallyBored.layer.borderWidth = 1
        verticallyBored.layer.borderColor = UIColor.red.cgColor
        
        horizontallyBored.backgroundColor = UIColor.clear
        horizontallyBored.layer.cornerRadius = 5
        horizontallyBored.layer.borderWidth = 1
        horizontallyBored.layer.borderColor = UIColor.red.cgColor
        
        horizontallyTrenched.backgroundColor = UIColor.clear
        horizontallyTrenched.layer.cornerRadius = 5
        horizontallyTrenched.layer.borderWidth = 1
        horizontallyTrenched.layer.borderColor = UIColor.red.cgColor
    }
    

    
    var presentDetail = String()
    @IBAction func IGSHPAVB(_ sender: Any) {
        presentDetail = "IGSHPAVB"
    }
    
    @IBAction func IGSHPAHB(_ sender: Any) {
        presentDetail = "IGSHPAHB"
    }
    
    @IBAction func IGSHPAHT(_ sender: Any) {
        presentDetail = "IGSHPAHT"
    }
    

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "appInfo"{
            let informationMenu: UINavigationController = segue.destination as! UINavigationController
            if let menu = informationMenu.popoverPresentationController
            {
                menu.delegate = self
            }
        }else if segue.identifier == "IGSHPAVB" || segue.identifier == "IGSHPAHB" || segue.identifier == "IGSHPAHT"{
            let dvc: IGSHPASettingDetailViewController = segue.destination as! IGSHPASettingDetailViewController
            dvc.whichDetail = presentDetail
            dvc.popoverPresentationController?.delegate = self
        }
        
    }
    // create segue to connect menu
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle
    {
        return UIModalPresentationStyle.none
    }
    // to make the menu's presentation style as a pop-over

    
}
