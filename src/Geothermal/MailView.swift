//
//  MailView.swift
//  SendMailApp
//
//  Created by Hoayuan He on 15.05.2023.
//

import MessageUI
import SwiftUI

struct MailView: UIViewControllerRepresentable {
    var content: String
    var to: String
    var subject: String
    var image1: UIImage?
    var image2: UIImage?
    var image3: UIImage?
    
    typealias UIViewControllerType = MFMailComposeViewController
    
    func updateUIViewController(_ uiViewController: MFMailComposeViewController, context: Context) {}

    func makeUIViewController(context: Context) -> MFMailComposeViewController {
        if MFMailComposeViewController.canSendMail() {
            let view = MFMailComposeViewController()
            view.mailComposeDelegate = context.coordinator
            view.setToRecipients([to])
            view.setSubject(subject)
            view.setMessageBody(content, isHTML: false)
            
            if let image = image1, let imageData = image.jpegData(compressionQuality: 1.0) {
                view.addAttachmentData(imageData, mimeType: "image/jpeg", fileName: "image1.jpeg")
            }

            if let image = image2, let imageData = image.jpegData(compressionQuality: 1.0) {
                view.addAttachmentData(imageData, mimeType: "image/jpeg", fileName: "image2.jpeg")
            }

            if let image = image3, let imageData = image.jpegData(compressionQuality: 1.0) {
                view.addAttachmentData(imageData, mimeType: "image/jpeg", fileName: "image3.jpeg")
            }
            return view
        } else {
            return MFMailComposeViewController()
        }
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
    class Coordinator: NSObject, MFMailComposeViewControllerDelegate {
        var parent: MailView
        
        init(_ parent: MailView) {
            self.parent = parent
        }
        
        func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
            controller.dismiss(animated: true)
        }
    }
}
