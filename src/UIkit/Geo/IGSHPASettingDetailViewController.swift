//
//  IGSHPAVBSettingInfoViewController.swift
//  Geo
//
//  Created by Leon ZHANG on 12/05/2016.
//  Copyright © 2016 ZHANGLiangliang. All rights reserved.
//

import UIKit
class IGSHPASettingDetailViewController: UIViewController {
    var whichDetail = String()
    let IGSHPAVBImage = UIImage(named:"IGSHPAVB.jpg")! as UIImage
    let IGSHPAHBImage = UIImage(named:"IGSHPAHB.jpg")! as UIImage
    let IGSHPAHTImage = UIImage(named:"IGSHPAHT.jpg")! as UIImage
    
    let explainLabel = UILabel ()
    let imageRefLabel = UILabel ()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switch  whichDetail {
        case "IGSHPAVB":
            let imageView = UIImageView(image: IGSHPAVBImage)
            imageView.frame = CGRect(x: 10, y: 283, width: 255, height: 170)
            view.addSubview(imageView)
            self.preferredContentSize = CGSize(width: 275, height: 480)
            
            explainLabel.text = "Vertically bored systems are commonly used in both residential and commercial buildings as this configuration requires minimal land to be available to install. However, this system can be significantly expensive as a result of the cost of drilling and therefore both vertical and horizontal systems should be considered to determine the most viable configuration."
            explainLabel.frame = CGRect (x: 10,y: 10, width: 255, height: 273)
            explainLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
            explainLabel.numberOfLines = 13
            view.addSubview(explainLabel)
        case"IGSHPAHB":
            let imageView = UIImageView(image: IGSHPAHBImage)
            imageView.frame = CGRect(x: 10, y: 262, width: 255, height: 170)
            view.addSubview(imageView)
            self.preferredContentSize = CGSize(width: 275, height: 460)
            self.navigationItem.title = "Horizontally - Bored"
            explainLabel.text = "Horizontally bored systems are a common configuration for properties that have large areas of earth to utilize. The benefit of using this configuration is that extensive excavation is not required. Depending on the property, the cost of damaging and replacing what currently occupies the land can exceed the cost of the drilling, making this an optimal setup."
            explainLabel.frame = CGRect (x: 10,y: 10, width: 255, height: 252)
            explainLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
            explainLabel.numberOfLines = 12
            view.addSubview(explainLabel)
        default:
            let imageView = UIImageView(image: IGSHPAHTImage)
            imageView.frame = CGRect(x: 10, y: 262, width: 255, height: 170)
            view.addSubview(imageView)
            self.preferredContentSize = CGSize(width: 275, height: 460)
            self.navigationItem.title = "Horizontally - Trenched"
            explainLabel.text = "Horizontally trenched systems are typically the cheapest installation of the three systems because no drilling is required. However, these systems require large areas of available land to excavate in order to be installed and even when enough land is available, the cost of removing and replacing what is currently there can in itself be significantly expensive."
            explainLabel.frame = CGRect (x: 10,y: 10, width: 255, height: 252)
            explainLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
            explainLabel.numberOfLines = 12
            view.addSubview(explainLabel)
        }
    }
    
}
