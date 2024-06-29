//
//  ASHRAEDataInputViewController.swift
//  Geo
//
//  Created by Leon ZHANG on 12/04/2016.
//  Copyright © 2016 ZHANGLiangliang. All rights reserved.
//

import UIKit
class ASHRAEDataInputViewController: UIViewController, UITextFieldDelegate,UIAlertViewDelegate, UIPopoverPresentationControllerDelegate{
    @IBOutlet weak var ASHRAEDataInputScrollView: UIScrollView!
    
    @IBAction func dimissKeyboard(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBOutlet weak var loopInnerRadiusVariable: UITextField!
    @IBOutlet weak var loopOuterRadiusVariable: UITextField!
    @IBOutlet weak var boreholeRadiusVariable: UITextField!
    @IBOutlet weak var groundThermalConductivityVariable: UITextField!
    @IBOutlet weak var groutThermalConductivityVariable: UITextField!
    @IBOutlet weak var ULoopPipeThermalConductivityVariable: UITextField!
    @IBOutlet weak var centreDistanceBetweenPipesVariable: UITextField!
    @IBOutlet weak var internalConvectionCoefficientVariable: UITextField!
    @IBOutlet weak var groundThermalDiffusivityVariable: UITextField!
    @IBOutlet weak var enteringWaterTempVariable: UITextField!
    @IBOutlet weak var massFlowRateVariable: UITextField!
    @IBOutlet weak var GHEThermalCapacityVariable: UITextField!
    @IBOutlet weak var distanceBetweenBoreholesVariable: UITextField!
    @IBOutlet weak var numberOfBoreholesVariable: UITextField!
    @IBOutlet weak var geoAspectRatioVariable: UITextField!
    @IBOutlet weak var undisturbedGroundTempVariable: UITextField!
    @IBOutlet weak var yearAvgGroundLoadVariable: UITextField!
    @IBOutlet weak var monthGroundLoadVariable: UITextField!
    @IBOutlet weak var hourGroundLoadVariable: UITextField!
    
    @IBOutlet weak var showrpinInfoButton: UIButton!
    @IBOutlet weak var showrpextInfoButton: UIButton!
    @IBOutlet weak var showrBoreInfoButton: UIButton!
    @IBOutlet weak var showkGInfoButton: UIButton!
    @IBOutlet weak var showkGroutInfoButton: UIButton!
    @IBOutlet weak var showkPipeInfoButton: UIButton!
    @IBOutlet weak var showLuInfoButton: UIButton!
    @IBOutlet weak var showhconvInfoButton: UIButton!
    @IBOutlet weak var showAlphaInfoButton: UIButton!
    @IBOutlet weak var showTinHPInfoButton: UIButton!
    @IBOutlet weak var showmflsInfoButton: UIButton!
    @IBOutlet weak var showCpInfoButton: UIButton!
    @IBOutlet weak var showBInfoButton: UIButton!
    @IBOutlet weak var showHInfoButton: UIButton!
    @IBOutlet weak var showNBInfoButton: UIButton!
    @IBOutlet weak var showAInfoButton: UIButton!
    @IBOutlet weak var showTgInfoButton: UIButton!
    @IBOutlet weak var showqyInfoButton: UIButton!
    @IBOutlet weak var showqmButton: UIButton!
    @IBOutlet weak var showqhButton: UIButton!
    
    
    @IBAction func showrpinInfo(_ sender: UIButton) {
        let popView = rpinViewController(nibName:"rpinView",bundle: nil)
        popView.modalPresentationStyle = .popover
        popView.popoverPresentationController!.delegate = self
        popView.popoverPresentationController?.sourceView = showrpinInfoButton
        popView.preferredContentSize = CGSize(width: 220, height: 52)
        self.present(popView, animated: true, completion: nil)
        popView.popoverPresentationController?.permittedArrowDirections = .up
    }
    
    @IBAction func showrpextInfo() {
        
        let popView = rpextViewController(nibName:"rpextView",bundle: nil)
        popView.modalPresentationStyle = .popover
        popView.popoverPresentationController!.delegate = self
        popView.popoverPresentationController?.sourceView = showrpextInfoButton
        popView.preferredContentSize = CGSize(width: 220, height: 52)
        self.present(popView, animated: true, completion: nil)
        popView.popoverPresentationController?.permittedArrowDirections = .up
    }
    
    @IBAction func showrBoreInfo() {
        let popView = rBoreViewController(nibName:"rBoreView",bundle: nil)
        popView.modalPresentationStyle = .popover
        popView.popoverPresentationController!.delegate = self
        popView.popoverPresentationController?.sourceView = showrBoreInfoButton
        popView.preferredContentSize = CGSize(width: 220, height: 52)
        self.present(popView, animated: true, completion: nil)
        popView.popoverPresentationController?.permittedArrowDirections = .up
    }
    
    @IBAction func showkGInfo() {
        let popView = kGViewController(nibName:"kGView",bundle: nil)
        popView.modalPresentationStyle = .popover
        popView.popoverPresentationController!.delegate = self
        popView.popoverPresentationController?.sourceView = showkGInfoButton
        popView.preferredContentSize = CGSize(width: 245, height: 73)
        self.present(popView, animated: true, completion: nil)
        popView.popoverPresentationController?.permittedArrowDirections = .up
    }
    
    @IBAction func showkGroutInfo() {
        let popView = kGroutViewController(nibName:"kGroutView",bundle: nil)
        popView.modalPresentationStyle = .popover
        popView.popoverPresentationController!.delegate = self
        popView.popoverPresentationController?.sourceView = showkGroutInfoButton
        popView.preferredContentSize = CGSize(width: 230, height: 52)
        self.present(popView, animated: true, completion: nil)
        popView.popoverPresentationController?.permittedArrowDirections = .up    }
    
    @IBAction func showkPipeInfo() {
        let popView = kpViewController(nibName:"kpView",bundle: nil)
        popView.modalPresentationStyle = .popover
        popView.popoverPresentationController!.delegate = self
        popView.popoverPresentationController?.sourceView = showkPipeInfoButton
        popView.preferredContentSize = CGSize(width: 220, height: 52)
        self.present(popView, animated: true, completion: nil)
        popView.popoverPresentationController?.permittedArrowDirections = .up
    }
    
    @IBAction func showLuInfo() {
        let popView = LuViewController(nibName:"LuView",bundle: nil)
        popView.modalPresentationStyle = .popover
        popView.popoverPresentationController!.delegate = self
        popView.popoverPresentationController?.sourceView = showLuInfoButton
        popView.preferredContentSize = CGSize(width: 220, height: 73)
        self.present(popView, animated: true, completion: nil)
        popView.popoverPresentationController?.permittedArrowDirections = .up
    }
    
    @IBAction func showhconveInfo() {
        let popView = hconvViewController(nibName:"hconvView",bundle: nil)
        popView.modalPresentationStyle = .popover
        popView.popoverPresentationController!.delegate = self
        popView.popoverPresentationController?.sourceView = showhconvInfoButton
        popView.preferredContentSize = CGSize(width: 190, height: 73)
        self.present(popView, animated: true, completion: nil)
        popView.popoverPresentationController?.permittedArrowDirections = .down
    }
    
    @IBAction func showAlphaInfo() {
        let popView = AlphaViewController(nibName:"AlphaView",bundle: nil)
        popView.modalPresentationStyle = .popover
        popView.popoverPresentationController!.delegate = self
        popView.popoverPresentationController?.sourceView = showAlphaInfoButton
        popView.preferredContentSize = CGSize(width: 220, height: 52)
        self.present(popView, animated: true, completion: nil)
        popView.popoverPresentationController?.permittedArrowDirections = .up
    }
    
    @IBAction func showTinHPInfo() {
        let popView = TinHPViewController(nibName:"TinHPView",bundle: nil)
        popView.modalPresentationStyle = .popover
        popView.popoverPresentationController!.delegate = self
        popView.popoverPresentationController?.sourceView = showTinHPInfoButton
        popView.preferredContentSize = CGSize(width: 220, height: 73)
        self.present(popView, animated: true, completion: nil)
        popView.popoverPresentationController?.permittedArrowDirections = .up
    }
    
    @IBAction func showmflsInfo() {
        let popView = mflsViewController(nibName:"mflsView",bundle: nil)
        popView.modalPresentationStyle = .popover
        popView.popoverPresentationController!.delegate = self
        popView.popoverPresentationController?.sourceView = showmflsInfoButton
        popView.preferredContentSize = CGSize(width: 220, height: 94)
        self.present(popView, animated: true, completion: nil)
        popView.popoverPresentationController?.permittedArrowDirections = .up
    }
    
    @IBAction func showCpInfo() {
        let popView = CpViewController(nibName:"CpView",bundle: nil)
        popView.modalPresentationStyle = .popover
        popView.popoverPresentationController!.delegate = self
        popView.popoverPresentationController?.sourceView = showCpInfoButton
        popView.preferredContentSize = CGSize(width: 250, height: 94)
        self.present(popView, animated: true, completion: nil)
        popView.popoverPresentationController?.permittedArrowDirections = .up
    }
    
    @IBAction func showBInfo() {
        let popView = BViewController(nibName:"BView",bundle: nil)
        popView.modalPresentationStyle = .popover
        popView.popoverPresentationController!.delegate = self
        popView.popoverPresentationController?.sourceView = showBInfoButton
        popView.preferredContentSize = CGSize(width: 180, height: 73)
        self.present(popView, animated: true, completion: nil)
        popView.popoverPresentationController?.permittedArrowDirections = .up
    }
    
    
    
    
    @IBAction func showNBInfo() {
        let popView = NBViewController(nibName:"NBView",bundle: nil)
        popView.modalPresentationStyle = .popover
        popView.popoverPresentationController!.delegate = self
        popView.popoverPresentationController?.sourceView = showNBInfoButton
        popView.preferredContentSize = CGSize(width: 220, height: 52)
        self.present(popView, animated: true, completion: nil)
        popView.popoverPresentationController?.permittedArrowDirections = .up
    }
    
    @IBAction func showAInfo() {
        let popView = AViewController(nibName:"AView",bundle: nil)
        popView.modalPresentationStyle = .popover
        popView.popoverPresentationController!.delegate = self
        popView.popoverPresentationController?.sourceView = showAInfoButton
        popView.preferredContentSize = CGSize(width: 180, height: 73)
        self.present(popView, animated: true, completion: nil)
        popView.popoverPresentationController?.permittedArrowDirections = .up
    }
    
    @IBAction func showTgInfo() {
        let popView = T_gViewController(nibName:"T_gView",bundle: nil)
        popView.modalPresentationStyle = .popover
        popView.popoverPresentationController!.delegate = self
        popView.popoverPresentationController?.sourceView = showTgInfoButton
        popView.preferredContentSize = CGSize(width: 195, height: 73)
        self.present(popView, animated: true, completion: nil)
        popView.popoverPresentationController?.permittedArrowDirections = .up
    }
    
    @IBAction func showqyInfo(){
        let popView = qyViewController(nibName:"qyView",bundle: nil)
        popView.modalPresentationStyle = .popover
        popView.popoverPresentationController!.delegate = self
        popView.popoverPresentationController?.sourceView = showqyInfoButton
        popView.preferredContentSize = CGSize(width: 210, height: 73)
        self.present(popView, animated: true, completion: nil)
        popView.popoverPresentationController?.permittedArrowDirections = .up
        
    }
    @IBAction func showqmInfo(){
        let popView = qmViewController(nibName:"qmView",bundle: nil)
        popView.modalPresentationStyle = .popover
        popView.popoverPresentationController!.delegate = self
        popView.popoverPresentationController?.sourceView = showqmButton
        popView.preferredContentSize = CGSize(width: 190, height: 52)
        self.present(popView, animated: true, completion: nil)
        popView.popoverPresentationController?.permittedArrowDirections = .up
        
    }
    @IBAction func showqhInfo(){
        let popView = qhViewController(nibName:"qhView",bundle: nil)
        popView.modalPresentationStyle = .popover
        popView.popoverPresentationController!.delegate = self
        popView.popoverPresentationController?.sourceView = showqhButton
        popView.preferredContentSize = CGSize(width: 235, height: 52)
        self.present(popView, animated: true, completion: nil)
        popView.popoverPresentationController?.permittedArrowDirections = .up
        
    }
    // show popup hints when ⓘ is clicked
    
    
    let ASHRAECalculator = ASHRAECalculation(loopInnerRadius: 1
        , loopOuterRadius: 2
        , boreholeRadius: 3
        , groundThermalConductivity: 4
        , groutThermalConductivity: 5
        , ULoopPipeThermalConductivity: 6
        , centreDistanceBetweenPipes: 7
        , internalConvectionCoefficient: 8
        , groundThermalDiffusivity: 9
        , enteringWaterTemp: 10
        , massFlowRate: 11
        , GHEThermalCapacity: 12
        , distanceBetweenBoreholes: 13
        , numberOfBoreholes: 14
        , geoAspectRatio: 15
        , undisturbedGroundTemp: 16
        , yearAvgGroundLoad: 17
        , monthGroundLoad: 18
        , hourGroundLoad: 19)
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle
    {
        return UIModalPresentationStyle.none
    }
    // to make the menu's presentation style as a pop-over
    
 
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
 
    @objc func returnTextField (){
        if GHEThermalCapacityVariable.isFirstResponder{enteringWaterTempVariable.becomeFirstResponder()
        }else if enteringWaterTempVariable.isFirstResponder{
            massFlowRateVariable.becomeFirstResponder()
        }else if massFlowRateVariable.isFirstResponder{
            groundThermalDiffusivityVariable.becomeFirstResponder()
        }else if groundThermalDiffusivityVariable.isFirstResponder{
            groundThermalConductivityVariable.becomeFirstResponder()
        }else if groundThermalConductivityVariable.isFirstResponder{
            undisturbedGroundTempVariable.becomeFirstResponder()
        }else if undisturbedGroundTempVariable.isFirstResponder{
            yearAvgGroundLoadVariable.becomeFirstResponder()
        }else if yearAvgGroundLoadVariable.isFirstResponder{
            monthGroundLoadVariable.becomeFirstResponder()
        }else if monthGroundLoadVariable.isFirstResponder{
            hourGroundLoadVariable.becomeFirstResponder()
        }else if hourGroundLoadVariable.isFirstResponder{
            distanceBetweenBoreholesVariable.becomeFirstResponder()
        }else if distanceBetweenBoreholesVariable.isFirstResponder{
            numberOfBoreholesVariable.becomeFirstResponder()
        }else if numberOfBoreholesVariable.isFirstResponder{
            geoAspectRatioVariable.becomeFirstResponder()
        }else if geoAspectRatioVariable.isFirstResponder{
            boreholeRadiusVariable.becomeFirstResponder()
        }else if boreholeRadiusVariable.isFirstResponder{
            groutThermalConductivityVariable.becomeFirstResponder()
        }else if groutThermalConductivityVariable.isFirstResponder{
            centreDistanceBetweenPipesVariable.becomeFirstResponder()
        }else if centreDistanceBetweenPipesVariable.isFirstResponder{
            loopInnerRadiusVariable.becomeFirstResponder()
        } else if  loopInnerRadiusVariable.isFirstResponder{
            loopOuterRadiusVariable.becomeFirstResponder()
        } else if loopOuterRadiusVariable.isFirstResponder{
            ULoopPipeThermalConductivityVariable.becomeFirstResponder()
        }else if ULoopPipeThermalConductivityVariable.isFirstResponder{
            
            internalConvectionCoefficientVariable.becomeFirstResponder()
        }else if internalConvectionCoefficientVariable.isFirstResponder{
            
            
        }
    }


    
    @objc func donePressed(){
        view.endEditing(true)
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        let keyboardButtonView = UIToolbar()
        keyboardButtonView.sizeToFit()
        // Create a button bar for the number pad
        
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: self, action: #selector(ASHRAEDataInputViewController.donePressed) )
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let nextButton = UIBarButtonItem(title: "Next", style: UIBarButtonItem.Style.plain, target: self, action: #selector(ASHRAEDataInputViewController.returnTextField) )
        // Setup the buttons to be put in the system.
        
        keyboardButtonView.setItems([doneButton,spaceButton,nextButton], animated: false)
        textField.inputAccessoryView = keyboardButtonView
        //Put the buttons into the ToolBar and display the tool bar
        return true
    }
    // Add toolbar for decimal pad to have return key

    
    @objc func keyboardWillShow(notification:NSNotification){
        var userInfo = notification.userInfo!
        var keyboardFrame:CGRect = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        keyboardFrame = self.view.convert(keyboardFrame, from: nil)
        
        var contentInset:UIEdgeInsets = self.ASHRAEDataInputScrollView.contentInset
        contentInset.bottom = keyboardFrame.size.height
        self.ASHRAEDataInputScrollView.contentInset = contentInset
    }
    @objc func keyboardWillHide(notification:NSNotification){
        let contentInset:UIEdgeInsets = UIEdgeInsets.zero
        self.ASHRAEDataInputScrollView.contentInset = contentInset
    }
    // automatically scroll the textfield to been seen when the keyboards show
    // willShow and willHide Notification should be set in ViewDidLoad
    
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        ASHRAEDataInputScrollView.contentSize = CGSize(width: 600, height: 800)
        //set up scroll view content size, otherwise it won't scroll!
        //Ps: need a new UIView under scrollView, and make its width identical to superView, then it will not scroll horizontally
        
        NotificationCenter.default.addObserver(self, selector: #selector(ASHRAEDataInputViewController.keyboardWillShow), name:UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ASHRAEDataInputViewController.keyboardWillHide), name:UIResponder.keyboardWillHideNotification, object: nil)
        // setup willShow and willHide notification
        
        calculateButton.backgroundColor = UIColor.clear
        calculateButton.layer.cornerRadius = 5
        calculateButton.layer.borderWidth = 1
        calculateButton.layer.borderColor = UIColor.red.cgColor
        // button settings
    }
    
    @IBOutlet weak var calculateButton: UIButton!
    
    
    @IBAction func ASHRAECalculate(_ sender: UIButton) {
        ASHRAECalculator.loopInnerRadius = Double((loopInnerRadiusVariable.text! as NSString).doubleValue)
        ASHRAECalculator.loopOuterRadius = Double((loopOuterRadiusVariable.text! as NSString).doubleValue)
        ASHRAECalculator.boreholeRadius = Double((boreholeRadiusVariable.text! as NSString).doubleValue)
        ASHRAECalculator.groundThermalConductivity = Double((groundThermalConductivityVariable.text! as NSString).doubleValue)
        ASHRAECalculator.groutThermalConductivity = Double((groutThermalConductivityVariable.text! as NSString).doubleValue)
        ASHRAECalculator.ULoopPipeThermalConductivity = Double((ULoopPipeThermalConductivityVariable.text! as NSString).doubleValue)
        ASHRAECalculator.centreDistanceBetweenPipes = Double((centreDistanceBetweenPipesVariable.text! as NSString).doubleValue)
        ASHRAECalculator.internalConvectionCoefficient = Double((internalConvectionCoefficientVariable.text! as NSString).doubleValue)
        ASHRAECalculator.groundThermalDiffusivity = Double((groundThermalDiffusivityVariable.text! as NSString).doubleValue)
        ASHRAECalculator.enteringWaterTemp = Double((enteringWaterTempVariable.text! as NSString).doubleValue)
        ASHRAECalculator.massFlowRate = Double((massFlowRateVariable.text! as NSString).doubleValue)
        ASHRAECalculator.GHEThermalCapacity = Double((GHEThermalCapacityVariable.text! as NSString).doubleValue)
        ASHRAECalculator.distanceBetweenBoreholes = Double((distanceBetweenBoreholesVariable.text! as NSString).doubleValue)
        ASHRAECalculator.numberOfBoreholes = Double((numberOfBoreholesVariable.text! as NSString).doubleValue)
        ASHRAECalculator.geoAspectRatio = Double((geoAspectRatioVariable.text! as NSString).doubleValue)
        ASHRAECalculator.undisturbedGroundTemp = Double((undisturbedGroundTempVariable.text! as NSString).doubleValue)
        ASHRAECalculator.yearAvgGroundLoad = Double((yearAvgGroundLoadVariable.text! as NSString).doubleValue)
        ASHRAECalculator.monthGroundLoad = Double((monthGroundLoadVariable.text! as NSString).doubleValue)
        ASHRAECalculator.hourGroundLoad = Double((hourGroundLoadVariable.text! as NSString).doubleValue)
        // input users' data to the calculator and calculate them when users press the calculate button
        
        inputIsWrong(textField: loopInnerRadiusVariable)
        inputIsWrong(textField: loopOuterRadiusVariable)
        inputIsWrong(textField: boreholeRadiusVariable)
        inputIsWrong(textField: groundThermalConductivityVariable)
        inputIsWrong(textField: groutThermalConductivityVariable)
        inputIsWrong(textField: ULoopPipeThermalConductivityVariable)
        inputIsWrong(textField: centreDistanceBetweenPipesVariable)
        inputIsWrong(textField: internalConvectionCoefficientVariable)
        inputIsWrong(textField: groundThermalDiffusivityVariable)
        inputIsWrong(textField: enteringWaterTempVariable)
        inputIsWrong(textField: massFlowRateVariable)
        inputIsWrong(textField: GHEThermalCapacityVariable)
        inputIsWrong(textField: undisturbedGroundTempVariable)
        inputIsWrong(textField: yearAvgGroundLoadVariable)
        inputIsWrong(textField: monthGroundLoadVariable)
        inputIsWrong(textField: hourGroundLoadVariable)
        inputIsWrong(textField: numberOfBoreholesVariable)
        // check if input is not 0 or empty
    }

    var alert : UIAlertController?
    func showAlter (){
        alert = UIAlertController(title: "Error", message: "Input cannot be 0 or empty", preferredStyle: .alert)
        
        let OK = UIAlertAction(title: "OK", style: .default, handler: { (action: UIAlertAction!) in
            print("Handle Ok logic here")
        })
        alert!.addAction(OK)
        self.present(alert!, animated: true, completion: nil)
    }
    func inputIsWrong(textField: UITextField){
        if textField.text == "0" || textField.text == ""{
            showAlter()
        }
    }
    // create alert when input is wrong
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let inputText = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        let reget = try! NSRegularExpression(pattern: "\\..{5,}", options: [])
        let matches = reget.matches(in: inputText, options:[], range:NSMakeRange(0, inputText.count))
        guard matches.count == 0 else { return false }
        // controll max 2 fractional digits
        
        if textField.text == "0"{
            if string == "0" || string == "1" || string == "2" || string == "3" || string == "4" || string == "5" || string == "6" || string == "7" || string == "8" || string == "9"{
                return false
            }else{
                return true
            }
        }
        // no number directly after 0
        
        if textField.text == ""{
            if string == "." {
                return false
            }
        }
        // no decimal for first digit
        
        if textField.text != ""{
            if string == "-"{
                return false
            }
        }
        // only allow - as first character
        
        switch string {
        case "0","1","2","3","4","5","6","7","8","9","-":
            return true
        case ".":
            let array = textField.text?.map { String($0) }
            var decimalCount = 0
            for character in array! {
                if character == "." {
                    decimalCount += 1
                }
            }
            if decimalCount == 1 {
                return false
            } else {
                return true
            }
        default:
            let array = string.map { String($0) }
            if array.count == 0 {
                return true
            }
            return false
        }
    }
    // constrain that the textfield can only input numbers

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ASHRAECalculate"{
            let dvc:ASHRAEResultsViewController = segue.destination as! ASHRAEResultsViewController;
        dvc.loopInnerRadiusInput = loopInnerRadiusVariable.text!
        dvc.loopOuterRadiusInput = loopOuterRadiusVariable.text!
        dvc.boreholeRadiusInput = boreholeRadiusVariable.text!
        dvc.groundThermalConductivityInput = groundThermalConductivityVariable.text!
        dvc.groutThermalConductivityInput = groutThermalConductivityVariable.text!
        dvc.ULoopPipeThermalConductivityInput = ULoopPipeThermalConductivityVariable.text!
        dvc.centreDistanceBetweenPipesInput = centreDistanceBetweenPipesVariable.text!
        dvc.internalConvectionCoefficientInput = internalConvectionCoefficientVariable.text!
        dvc.groundThermalDiffusivityInput = groundThermalDiffusivityVariable.text!
        dvc.enteringWaterTempInput = enteringWaterTempVariable.text!
        dvc.massFlowRateInput = massFlowRateVariable.text!
        dvc.GHEThermalCapacityInput = GHEThermalCapacityVariable.text!
        dvc.distanceBetweenBoreholesInput = distanceBetweenBoreholesVariable.text!
        dvc.numberOfBoreholesInput = numberOfBoreholesVariable.text!
        dvc.geoAspectRatioInput = geoAspectRatioVariable.text!
        dvc.undisturbedGroundTempInput = undisturbedGroundTempVariable.text!
        dvc.yearAvgGroundLoadInput = yearAvgGroundLoadVariable.text!
        dvc.monthGroundLoadInput = monthGroundLoadVariable.text!
        dvc.hourGroundLoadInput = hourGroundLoadVariable.text!
        dvc.outletWaterTempCoolingResult = String(format: "%0.1f", ASHRAECalculator.outletWaterTempCooling)
        dvc.outletWaterTempHeatingResult = String(format: "%0.1f", ASHRAECalculator.outletWaterTempHeating)
        dvc.meanWaterTempCoolingResult = String(format: "%0.1f", ASHRAECalculator.meanWaterTempCooling)
        dvc.meanWaterTempHeatingResult = String(format: "%0.1f", ASHRAECalculator.meanWaterTempHeating)
        dvc.dimensionlessTimeResult = String(format: "%0.1f", ASHRAECalculator.dimensionlessTime)
        dvc.correlationFuncResult = String(format: "%0.1f", ASHRAECalculator.correlationFunc)
        dvc.tempPenaltyCoolingResult = String(format: "%0.1f", ASHRAECalculator.tempPenaltyCooling)
        dvc.tempPenaltyHeatingResult = String(format: "%0.1f", ASHRAECalculator.tempPenaltyHeating)
        dvc.tenyearResistanceResult = String(format: "%0.1f", ASHRAECalculator.tenyearResistance)
        dvc.onemonthResistanceResult = String(format: "%0.1f", ASHRAECalculator.onemonthResistance)
        dvc.sixhourResistanceResult = String(format: "%0.1f", ASHRAECalculator.sixhourResistance)
        dvc.innerPipeConvectionResistanceResult = String(format: "%0.1f", ASHRAECalculator.innerPipeConvectionResistance)
        dvc.pipeConvectionResistanceResult = String(format: "%0.1f", ASHRAECalculator.pipeConvectionResistance)
        dvc.groutResistanceResult = String(format: "%0.1f", ASHRAECalculator.groutResistance)
        dvc.boreholeResistanceResult = String(format: "%0.1f", ASHRAECalculator.boreholeResistance)
        dvc.undisturbedCoolingLengthResult = String(format: "%0.1f", ASHRAECalculator.undisturbedCoolingLength)
        dvc.undisturbedHeatingLengthResult = String(format: "%0.1f", ASHRAECalculator.undisturbedHeatingLength)
        dvc.totalCoolingBoreholeLengthResult = String(format: "%0.1f", ASHRAECalculator.totalCoolingBoreholeLength)
        dvc.totalHeatingBoreholeLengthResult = String(format: "%0.1f", ASHRAECalculator.totalHeatingBoreholeLength)
        }else if segue.identifier == "appInfo"{
            let dvc: UINavigationController = segue.destination as! UINavigationController
            dvc.popoverPresentationController?.delegate = self
        }
    }
    // a link between first view controller (dataInput interface) and second view controller (results interface)
    // used for transfer the results and dataInput from first to second
    
    /*override func viewWillAppear(animated: Bool) {
        let rpinDef = NSUserDefaults.standardUserDefaults()
        let theRpin = rpinDef .stringForKey("rpin")
        loopInnerRadiusVariable.text = theRpin
        let rpextDef = NSUserDefaults.standardUserDefaults()
        let theRpext = rpextDef .stringForKey("rpext")
        loopOuterRadiusVariable.text = theRpext
        let rbDef = NSUserDefaults.standardUserDefaults()
        let theRb = rbDef .stringForKey("rb")
        boreholeRadiusVariable.text = theRb
        let kgDef = NSUserDefaults.standardUserDefaults()
        let thekG = kgDef .stringForKey("kg")
        groundThermalConductivityVariable.text = thekG
        let kgroutDef = NSUserDefaults.standardUserDefaults()
        let thekGrout = kgroutDef.stringForKey("kgrout")
        groutThermalConductivityVariable.text = thekGrout
        let kpDef = NSUserDefaults.standardUserDefaults()
        let theKp = kpDef .stringForKey("kp")
        ULoopPipeThermalConductivityVariable.text = theKp
        let LuDef = NSUserDefaults.standardUserDefaults()
        let theLu = LuDef .stringForKey("Lu")
        centreDistanceBetweenPipesVariable.text = theLu
        let hconvDef = NSUserDefaults.standardUserDefaults()
        let theHconv = hconvDef .stringForKey("hconv")
        internalConvectionCoefficientVariable.text = theHconv
        let alphaDef = NSUserDefaults.standardUserDefaults()
        let theAlpha = alphaDef .stringForKey("alpha")
        groundThermalDiffusivityVariable.text = theAlpha
        let TinHPDef = NSUserDefaults.standardUserDefaults()
        let theTinHP = TinHPDef .stringForKey("TinHP")
        enteringWaterTempVariable.text = theTinHP
        let mflsDef = NSUserDefaults.standardUserDefaults()
        let theMfls = mflsDef .stringForKey("mfls")
        massFlowRateVariable.text = theMfls
        let CpDef = NSUserDefaults.standardUserDefaults()
        let theCp = CpDef .stringForKey("Cp")
        GHEThermalCapacityVariable.text = theCp
        let BDef = NSUserDefaults.standardUserDefaults()
        let theB = BDef .stringForKey("B")
        distanceBetweenBoreholesVariable.text = theB
        let NBDef = NSUserDefaults.standardUserDefaults()
        let theNB = NBDef .stringForKey("NB")
        numberOfBoreholesVariable.text = theNB
        let ADef = NSUserDefaults.standardUserDefaults()
        let theA = ADef .stringForKey("A")
        geoAspectRatioVariable.text = theA
        let TgDef = NSUserDefaults.standardUserDefaults()
        let theTg = TgDef .stringForKey("Tg")
        undisturbedGroundTempVariable.text = theTg
        let qyDef = NSUserDefaults.standardUserDefaults()
        let theQy = qyDef .stringForKey("qy")
    yearAvgGroundLoadVariable.text = theQy
        let qmDef = NSUserDefaults.standardUserDefaults()
        let theQm = qmDef .stringForKey("qm")
        monthGroundLoadVariable.text = theQm
        let qhDef = NSUserDefaults.standardUserDefaults()
        let theQh = qhDef .stringForKey("qh")
        hourGroundLoadVariable.text = theQh
    }
    
    override func viewWillDisappear(animated: Bool) {
        let rpinValue = loopInnerRadiusVariable.text
        NSUserDefaults.standardUserDefaults().setObject(rpinValue, forKey: "rpin")
        let rpextValue = loopOuterRadiusVariable.text
        NSUserDefaults.standardUserDefaults().setObject(rpextValue, forKey: "rpext")
        let rbValue = boreholeRadiusVariable.text
            NSUserDefaults.standardUserDefaults().setObject(rbValue, forKey: "rb")
        let kgValue = groundThermalConductivityVariable.text
        NSUserDefaults.standardUserDefaults().setObject(kgValue, forKey: "kg")
        let kgroutValue = groutThermalConductivityVariable.text
        NSUserDefaults.standardUserDefaults().setObject(kgroutValue, forKey: "kgrout")
        let kpValue = ULoopPipeThermalConductivityVariable.text
        NSUserDefaults.standardUserDefaults().setObject(kpValue, forKey: "kp")
        let LuValue = centreDistanceBetweenPipesVariable.text
        NSUserDefaults.standardUserDefaults().setObject(LuValue, forKey: "Lu")
        let hconvValue = internalConvectionCoefficientVariable.text
        NSUserDefaults.standardUserDefaults().setObject(hconvValue, forKey: "hconv")
        let alphaValue = groundThermalDiffusivityVariable.text
        NSUserDefaults.standardUserDefaults().setObject(alphaValue, forKey: "alpha")
        let TinHPValue = enteringWaterTempVariable.text
        NSUserDefaults.standardUserDefaults().setObject(TinHPValue, forKey: "TinHP")
        let mflsValue =  massFlowRateVariable.text
        NSUserDefaults.standardUserDefaults().setObject(mflsValue, forKey: "mfls")
        let CpValue = GHEThermalCapacityVariable.text
        NSUserDefaults.standardUserDefaults().setObject(CpValue, forKey: "Cp")
        let BValue = distanceBetweenBoreholesVariable.text
        NSUserDefaults.standardUserDefaults().setObject(BValue, forKey: "B")
        let NBValue = numberOfBoreholesVariable.text
        NSUserDefaults.standardUserDefaults().setObject(NBValue, forKey: "NB")
        let AValue = geoAspectRatioVariable.text
        NSUserDefaults.standardUserDefaults().setObject(AValue, forKey: "A")
        let TgValue = undisturbedGroundTempVariable.text
        NSUserDefaults.standardUserDefaults().setObject(TgValue, forKey: "Tg")
        let qyValue = yearAvgGroundLoadVariable.text
        NSUserDefaults.standardUserDefaults().setObject(qyValue, forKey: "qy")
        let qmValue = monthGroundLoadVariable.text
        NSUserDefaults.standardUserDefaults().setObject(qmValue, forKey: "qm")
        let qhValue = hourGroundLoadVariable.text
        NSUserDefaults.standardUserDefaults().setObject(qhValue, forKey: "qh")
 
    }
    // viewwillappear/disappear save the input even user left the app*/
    

}
