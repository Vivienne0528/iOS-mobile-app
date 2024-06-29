//
//  MethodViewController.swift
//  Geo
//
//  Created by Leon ZHANG on 25/04/2016.
//  Copyright © 2016 ZHANGLiangliang. All rights reserved.
//

import UIKit

class MethodViewController: UIViewController,UIPopoverPresentationControllerDelegate {
    
    @IBAction func showInformation(sender:AnyObject){
        self.performSegue(withIdentifier: "methodInformation", sender: self)
    }
    // 1.link ⓘ button to informationMenuVC, choose segue to be present as popover
    // 2. set the identifier of segue
    // 3. when ⓘ is pressed, VC will perform popover segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "methodInformation"{
            let informationMenu: UINavigationController = segue.destination as! UINavigationController
            if let menu = informationMenu.popoverPresentationController{
                menu.delegate = self
            }
        } else if segue.identifier == "IGSHPAInfo" {
            let informationMenu: InfoViewController = segue.destination as! InfoViewController
            if let menu = informationMenu.popoverPresentationController
            {
                menu.delegate = self
            }
            informationMenu.whichInfo = "IGSHPA"
            informationMenu.popoverPresentationController?.permittedArrowDirections = .up
        } else if segue.identifier == "ASHRAEInfo"{
            let informationMenu: InfoViewController = segue.destination as! InfoViewController
            if let menu = informationMenu.popoverPresentationController
            {
                menu.delegate = self
            }
            informationMenu.whichInfo = "ASHRAE"
            informationMenu.popoverPresentationController?.permittedArrowDirections = .down
        }
    }
    // create segue to connect information menu
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle
    {
        return UIModalPresentationStyle.none
    }
    // to make the menu's presentation style as a pop-over

    @IBOutlet weak var IGSHPA: UIButton!
    @IBOutlet weak var ASHRAE: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        IGSHPA.backgroundColor = UIColor.clear
        IGSHPA.layer.cornerRadius = 5
        IGSHPA.layer.borderWidth = 1
        IGSHPA.layer.borderColor = UIColor.red.cgColor
        
        ASHRAE.backgroundColor = UIColor.clear
        ASHRAE.layer.cornerRadius = 5
        ASHRAE.layer.borderWidth = 1
        ASHRAE.layer.borderColor = UIColor.red.cgColor
        
        self.navigationItem.setHidesBackButton(true, animated:true)
        
    }
    


    



    
}
