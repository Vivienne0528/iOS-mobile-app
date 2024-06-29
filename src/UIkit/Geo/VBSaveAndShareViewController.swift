//
//  ParameterInfoViewController.swift
//  Geo
//
//  Created by Leon ZHANG on 7/05/2016.
//  Copyright © 2016 ZHANGLiangliang. All rights reserved.
//

import UIKit
import MessageUI
class VBSaveAndShareViewController: UIViewController, MFMailComposeViewControllerDelegate, UIAlertViewDelegate{

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
        let mailString = UserDefaults.standard.string(forKey: "saveVBValues")
        
        
        // Converting it to NSData.
        let data = mailString!.data(using: String.Encoding.utf8, allowLossyConversion: false)
        
        let currentDateTime = NSDate()
        
        // initialize the date formatter and set the style
        let formatter = DateFormatter()
        
        formatter.timeStyle = DateFormatter.Style.medium
        formatter.dateStyle = DateFormatter.Style.medium
        let time = formatter.string(from: currentDateTime as Date)
        
        let emailViewController = configuredMailComposeViewController()
        if MFMailComposeViewController.canSendMail() {
            self.present(emailViewController, animated: true, completion: nil)
            //Attaching the .CSV file to the email.
            emailViewController.addAttachmentData(data!, mimeType: "text/csv", fileName: "IGSHPAVB Results\(time).csv")
        }else{
            self.showMailErrorAlert()
        }
        
    }
    
    func configuredMailComposeViewController() -> MFMailComposeViewController {
        let emailController = MFMailComposeViewController()
        emailController.mailComposeDelegate = self
        emailController.setSubject("CSV File")
        emailController.setMessageBody("", isHTML: false)

        return emailController
    }

    func showMailErrorAlert(){
        let mailErrorAlert = UIAlertController(title: "Cannot send email",message: "Your device could not send email. Please check the Email configuration and try agian.",preferredStyle: .alert)
        let OK = UIAlertAction(title: "OK", style: .default, handler: { (action: UIAlertAction!) in
            print("Handle Ok logic here")
        })
        mailErrorAlert.addAction(OK)
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
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
