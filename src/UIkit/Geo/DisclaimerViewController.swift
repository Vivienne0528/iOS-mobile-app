//
//  DisclaimerViewController.swift
//  Geo
//
//  Created by Leon ZHANG on 10/05/2016.
//  Copyright © 2016 ZHANGLiangliang. All rights reserved.
//

import UIKit
class DisclaimerViewController: UIViewController, UIAlertViewDelegate{
    
    @IBOutlet weak var Start: UIButton!
    
    @IBOutlet weak var checkBox: checkBoxControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Start.backgroundColor = UIColor.clear
        Start.layer.cornerRadius = 5
        Start.layer.borderWidth = 1
        Start.layer.borderColor = UIColor.red.cgColor

    }
    
    @IBAction func start(_ sender: Any) {
        if checkBox.isChecked == false {
            showAlter()
        } else{
            let storyBoard =  UIStoryboard(name: "Main",bundle: nil)
            let methodVC: UINavigationController = storyBoard.instantiateViewController(withIdentifier: "SubMainNavigationController") as! UINavigationController
            self.present(methodVC, animated: true, completion: nil)
            let bool = checkBox.isChecked
            UserDefaults.standard.set(bool, forKey: "termAccepted")
            UserDefaults.standard.synchronize()
        }
    }
    
    var alert : UIAlertController?
    func showAlter (){
        alert = UIAlertController(title: "Cannot proceed", message: "Terms and conditions must be accepted to proceed", preferredStyle: .alert)
        
        let OK = UIAlertAction(title: "OK", style: .default, handler: { (action: UIAlertAction!) in
            print("Handle Ok logic here")
        })
        alert!.addAction(OK)
        DispatchQueue.main.async {
            if self.view.window!.rootViewController?.presentedViewController != nil
            {
                self.view.window!.rootViewController?.presentedViewController!.present(self.alert!, animated: true){}
            }
            else
            {
                self.view.window!.rootViewController!.present(self.alert!, animated: true){}
            }
        }
    }


}
