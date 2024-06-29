//
//  HBSaveAndShareViewController.swift
//  PreGeo
//
//  Created by Leon ZHANG on 15/05/2016.
//  Copyright © 2016 ZHANGLiangliang. All rights reserved.
//

import UIKit
import MessageUI
class  HBSaveAndShareViewController: UIViewController , MFMailComposeViewControllerDelegate, UIAlertViewDelegate{
    
    override func viewDidAppear(_ animated: Bool) {
        self.preferredContentSize = CGSize(width: 180, height: 42)
    }
    @IBOutlet weak var emailButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func sendEmail(_ sender: UIButton) {
        let mailString = UserDefaults.standard.string(forKey: "saveHBValues")
        if let mailString = UserDefaults.standard.string(forKey: "saveHBValues"){
            print(mailString)
        }
        
        
        // Converting it to NSData.
        let data = mailString!.data(using: String.Encoding.utf8, allowLossyConversion: false)
        
        let emailViewController = configuredMailComposeViewController()
        if MFMailComposeViewController.canSendMail() {
            self.present(emailViewController, animated: true, completion: nil)
            //Attaching the .CSV file to the email.
            emailViewController.addAttachmentData(data!, mimeType: "text/csv", fileName: "IGSHPAHB Results.csv")
        }else{
            self.showMailErrorAlert()
        }
    }
    
    func configuredMailComposeViewController() -> MFMailComposeViewController {
        let emailController = MFMailComposeViewController()
        emailController.mailComposeDelegate = self
        emailController.setSubject("CSV File")
        emailController.setMessageBody("", isHTML: false)
        
        /*// */
        
        return emailController
    }
    
    func showMailErrorAlert(){
        let mailErrorAlert = UIAlertController(title: "Cannot send email",message: "Your device could not send email. Please check the Email configuration and try agian.",preferredStyle: .alert)
        let OK = UIAlertAction(title: "OK", style: .default, handler: { (action: UIAlertAction!) in
            print("Handle Ok logic here")
        })
        mailErrorAlert.addAction(OK)
    }
    
    func mailComposeController(_controller: MFMailComposeViewController, didFinishWithResult result: MFMailComposeResult, error: NSError?) {
        switch  result {
        case .cancelled:
            print("Cancelled mail")
        case .sent:
            print("Sent mail")
        default:
            break
        }
        self.dismiss(animated: true, completion: nil)
    }
    
}
