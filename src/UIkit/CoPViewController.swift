//
//  CoPViewController.swift
//  Geo
//
//  Created by Leon ZHANG on 14/05/2016.
//  Copyright © 2016 ZHANGLiangliang. All rights reserved.
//

import UIKit
class CoPViewController: UIViewController {
    /*@IBOutlet weak var copValue: UIButton!
    

    var Cop = String()
 
    @IBAction func sendCopValue(sender: AnyObject) {
 
    }
    
    
   /* override func viewDidLoad() {
        super.viewDidLoad()

            NSUserDefaults.standardUserDefaults().setObject(copValue.titleLabel?.text, forKey:"cop");
            //if iOS8 before need:
            NSUserDefaults.standardUserDefaults().synchronize();
        
    }*/
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let dvc: IGSHPAVerticallyBoredDataInputViewController = segue.destinationViewController as! IGSHPAVerticallyBoredDataInputViewController
        dvc.CopValue = (copValue.titleLabel?.text)!
    }*/
}
