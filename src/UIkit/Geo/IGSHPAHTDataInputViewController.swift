//
//  IGSHPAHT.swift
//  PreGeo
//
//  Created by Leon ZHANG on 16/05/2016.
//  Copyright © 2016 ZHANGLiangliang. All rights reserved.
//

import UIKit
class IGSHPAHTDataInputViewController: UIViewController, UITextFieldDelegate, UIAlertViewDelegate, UIPopoverPresentationControllerDelegate {
    
    @IBOutlet weak var copVariable: UITextField!
    @IBOutlet weak var heatPumpCoolingVariable: UITextField!
    @IBOutlet weak var heatPumpHeatingVariable: UITextField!
    @IBOutlet weak var energyEfficientVariable: UITextField!
    @IBOutlet weak var meanEarthTempVariable: UITextField!
    @IBOutlet weak var minEnterTempVariable: UITextField!
    @IBOutlet weak var minLeaveTempVariable: UITextField!
    @IBOutlet weak var maxEnterTempVariable: UITextField!
    @IBOutlet weak var maxLeaveTempVariable: UITextField!
    @IBOutlet weak var soilResistanceVariable: UITextField!
    @IBOutlet weak var trenchSpaceMultiVariable: UITextField!
    @IBOutlet weak var pipeDiameterMultiVariable: UITextField!
    @IBOutlet weak var pipeOuterDiameterVariable: UITextField!
    @IBOutlet weak var pipeInnerDiameterVariable: UITextField!
    @IBOutlet weak var pipeThermalConductivityVariable: UITextField!
    @IBOutlet weak var coolingRunningTimeVariable: UITextField!
    @IBOutlet weak var heatingRunningTimeVariable: UITextField!
    @IBOutlet weak var avgPipeDepthVariable: UITextField!
    @IBOutlet weak var surfaceTempAmplitudeVariable: UITextField!
    @IBOutlet weak var soilThermalDiffusivityVariable: UITextField!
    @IBOutlet weak var numberOfTrenchesVariable: UITextField!
    @IBOutlet weak var numberOfPipesInTrenchVariable: UITextField!
    
    
    
    
    @IBOutlet weak var calculateButton: UIButton!
    @IBOutlet weak var showCoPInfoButton: UIButton!
    @IBOutlet weak var showTCDInfoButton: UIButton!
    @IBOutlet weak var showHCDInfoButton: UIButton!
    @IBOutlet weak var showEERDInfoButton: UIButton!
    @IBOutlet weak var showTMInfoButton: UIButton!
    @IBOutlet weak var showEWTminInfoButton: UIButton!
    @IBOutlet weak var showLWTminInfoButton: UIButton!
    @IBOutlet weak var showEWTmaxInfoButton: UIButton!
    @IBOutlet weak var showLWTmaxInfoButton: UIButton!
    @IBOutlet weak var showRsInfoButton: UIButton!
    @IBOutlet weak var showSMInfoButton: UIButton!
    @IBOutlet weak var showPMInfoButton: UIButton!
    @IBOutlet weak var showDPOInfoButton: UIButton!
    @IBOutlet weak var showDpiInfoButton: UIButton!
    @IBOutlet weak var showkpInfoButton: UIButton!
    @IBOutlet weak var showRTCLGInfoButton: UIButton!
    @IBOutlet weak var showRTHTGInfoButton: UIButton!
    @IBOutlet weak var showAvgPipeDepthButton: UIButton!
    @IBOutlet weak var showASButton: UIButton!
    @IBOutlet weak var showAlphaButton: UIButton!
    
    
    @IBAction func showCopInfo(_ sender: UIButton) {
        let popView = CoPViewController(nibName:"CoPView",bundle: nil)
        popView.modalPresentationStyle = .popover
        popView.popoverPresentationController!.delegate = self
        popView.popoverPresentationController?.sourceView = showCoPInfoButton
        popView.preferredContentSize = CGSize(width: 200, height: 73)
        self.present(popView, animated: true, completion: nil)
        popView.popoverPresentationController?.permittedArrowDirections = .up
        
    }
    
    @IBAction func showTCDInfo() {
        
        let popView = TCDViewController(nibName:"TCDView",bundle: nil)
        popView.modalPresentationStyle = .popover
        popView.popoverPresentationController!.delegate = self
        popView.popoverPresentationController?.sourceView = showTCDInfoButton
        popView.preferredContentSize = CGSize(width: 220, height: 94)
        self.present(popView, animated: true, completion: nil)
        popView.popoverPresentationController?.permittedArrowDirections = .up
    }
    
    @IBAction func showHCDInfo() {
        let popView = HCDViewController(nibName:"HCDView",bundle: nil)
        popView.modalPresentationStyle = .popover
        popView.popoverPresentationController!.delegate = self
        popView.popoverPresentationController?.sourceView = showHCDInfoButton
        popView.preferredContentSize = CGSize(width: 220, height: 94)
        self.present(popView, animated: true, completion: nil)
        popView.popoverPresentationController?.permittedArrowDirections = .up
    }
    
    @IBAction func showEERDInfo() {
        let popView = EERDViewController(nibName:"EERDView",bundle: nil)
        popView.modalPresentationStyle = .popover
        popView.popoverPresentationController!.delegate = self
        popView.popoverPresentationController?.sourceView = showEERDInfoButton
        popView.preferredContentSize = CGSize(width: 220, height: 73)
        self.present(popView, animated: true, completion: nil)
        popView.popoverPresentationController?.permittedArrowDirections = .up
    }
    
    @IBAction func showTMInfo() {
        let popView = TMViewController(nibName:"TMView",bundle: nil)
        popView.modalPresentationStyle = .popover
        popView.popoverPresentationController!.delegate = self
        popView.popoverPresentationController?.sourceView = showTMInfoButton
        popView.preferredContentSize = CGSize(width: 220, height: 94)
        self.present(popView, animated: true, completion: nil)
        popView.popoverPresentationController?.permittedArrowDirections = .up    }
    
    @IBAction func showEWTminInfo() {
        let popView = EWTminViewController(nibName:"EWTminView",bundle: nil)
        popView.modalPresentationStyle = .popover
        popView.popoverPresentationController!.delegate = self
        popView.popoverPresentationController?.sourceView = showEWTminInfoButton
        popView.preferredContentSize = CGSize(width: 200, height: 115)
        self.present(popView, animated: true, completion: nil)
        popView.popoverPresentationController?.permittedArrowDirections = .up
    }
    
    @IBAction func showLWTminInfo() {
        let popView = LWTminViewController(nibName:"LWTminView",bundle: nil)
        popView.modalPresentationStyle = .popover
        popView.popoverPresentationController!.delegate = self
        popView.popoverPresentationController?.sourceView = showLWTminInfoButton
        popView.preferredContentSize = CGSize(width: 200, height: 115)
        self.present(popView, animated: true, completion: nil)
        popView.popoverPresentationController?.permittedArrowDirections = .up
    }
    
    @IBAction func showEWTmaxInfo() {
        let popView = EWTmaxViewController(nibName:"EWTmaxView",bundle: nil)
        popView.modalPresentationStyle = .popover
        popView.popoverPresentationController!.delegate = self
        popView.popoverPresentationController?.sourceView = showEWTmaxInfoButton
        popView.preferredContentSize = CGSize(width: 200, height: 115)
        self.present(popView, animated: true, completion: nil)
        popView.popoverPresentationController?.permittedArrowDirections = .up
    }
    
    @IBAction func showLWTmaxInfo() {
        let popView = LWTmaxViewController(nibName:"LWTmaxView",bundle: nil)
        popView.modalPresentationStyle = .popover
        popView.popoverPresentationController!.delegate = self
        popView.popoverPresentationController?.sourceView = showLWTmaxInfoButton
        popView.preferredContentSize = CGSize(width: 200, height: 115)
        self.present(popView, animated: true, completion: nil)
        popView.popoverPresentationController?.permittedArrowDirections = .up
    }
    
    @IBAction func showRsInfo() {
        let popView = RSViewController(nibName:"RSView",bundle: nil)
        popView.modalPresentationStyle = .popover
        popView.popoverPresentationController!.delegate = self
        popView.popoverPresentationController?.sourceView = showRsInfoButton
        popView.preferredContentSize = CGSize(width: 220, height: 52)
        self.present(popView, animated: true, completion: nil)
        popView.popoverPresentationController?.permittedArrowDirections = .up
    }
    
    @IBAction func showSMInfo() {
        let popView = SMViewController(nibName:"SMView",bundle: nil)
        popView.modalPresentationStyle = .popover
        popView.popoverPresentationController!.delegate = self
        popView.popoverPresentationController?.sourceView = showSMInfoButton
        popView.preferredContentSize = CGSize(width: 220, height: 52)
        self.present(popView, animated: true, completion: nil)
        popView.popoverPresentationController?.permittedArrowDirections = .up
    }
    
    @IBAction func showPMInfo() {
        let popView = PMViewController(nibName:"PMView",bundle: nil)
        popView.modalPresentationStyle = .popover
        popView.popoverPresentationController!.delegate = self
        popView.popoverPresentationController?.sourceView = showPMInfoButton
        popView.preferredContentSize = CGSize(width: 220, height: 52)
        self.present(popView, animated: true, completion: nil)
        popView.popoverPresentationController?.permittedArrowDirections = .up
    }
    
    @IBAction func showDPOInfo() {
        let popView = DPOViewController(nibName:"DPOView",bundle: nil)
        popView.modalPresentationStyle = .popover
        popView.popoverPresentationController!.delegate = self
        popView.popoverPresentationController?.sourceView = showDPOInfoButton
        popView.preferredContentSize = CGSize(width: 200 , height: 52)
        self.present(popView, animated: true, completion: nil)
        popView.popoverPresentationController?.permittedArrowDirections = .up
    }
    
    @IBAction func showDpiInfo() {
        let popView = DpiViewController(nibName:"DpiView",bundle: nil)
        popView.modalPresentationStyle = .popover
        popView.popoverPresentationController!.delegate = self
        popView.popoverPresentationController?.sourceView = showDpiInfoButton
        popView.preferredContentSize = CGSize(width: 200, height: 52)
        self.present(popView, animated: true, completion: nil)
        popView.popoverPresentationController?.permittedArrowDirections = .up
    }
    

    
    @IBAction func showkpInfo() {
        let popView = kpViewController(nibName:"kpView",bundle: nil)
        popView.modalPresentationStyle = .popover
        popView.popoverPresentationController!.delegate = self
        popView.popoverPresentationController?.sourceView = showkpInfoButton
        popView.preferredContentSize = CGSize(width: 220, height: 52)
        self.present(popView, animated: true, completion: nil)
        popView.popoverPresentationController?.permittedArrowDirections = .up
    }
    
    @IBAction func showRTCLGInfo() {
        let popView = RTCLGViewController(nibName:"RTCLGView",bundle: nil)
        popView.modalPresentationStyle = .popover
        popView.popoverPresentationController!.delegate = self
        popView.popoverPresentationController?.sourceView = showRTCLGInfoButton
        popView.preferredContentSize = CGSize(width: 220, height: 94)
        self.present(popView, animated: true, completion: nil)
        popView.popoverPresentationController?.permittedArrowDirections = .up
    }
    
    @IBAction func showRTHTGInfo() {
        let popView = RTHTGViewController(nibName:"RTHTGView",bundle: nil)
        popView.modalPresentationStyle = .popover
        popView.popoverPresentationController!.delegate = self
        popView.popoverPresentationController?.sourceView = showRTHTGInfoButton
        popView.preferredContentSize = CGSize(width: 220, height: 94)
        self.present(popView, animated: true, completion: nil)
        popView.popoverPresentationController?.permittedArrowDirections = .up
    }
    
    @IBAction func showAvgPipeDepthInfo(){
        let popView = AVGPipeDepthViewController(nibName:"AVGPipeDepthView",bundle: nil)
        popView.modalPresentationStyle = .popover
        popView.popoverPresentationController!.delegate = self
        popView.popoverPresentationController?.sourceView = showAvgPipeDepthButton
        popView.preferredContentSize = CGSize(width: 190, height: 52)
        self.present(popView, animated: true, completion: nil)
        popView.popoverPresentationController?.permittedArrowDirections = .up
        
    }
    
    @IBAction func showASInfo(){
        let popView = AsViewController(nibName:"ASView",bundle: nil)
        popView.modalPresentationStyle = .popover
        popView.popoverPresentationController!.delegate = self
        popView.popoverPresentationController?.sourceView = showASButton
        popView.preferredContentSize = CGSize(width: 220, height: 94)
        self.present(popView, animated: true, completion: nil)
        popView.popoverPresentationController?.permittedArrowDirections = .up
    }
    
    @IBAction func showAlphaInfo() {
        let popView = AlphaViewController(nibName:"AlphaView",bundle: nil)
        popView.modalPresentationStyle = .popover
        popView.popoverPresentationController!.delegate = self
        popView.popoverPresentationController?.sourceView = showAlphaButton
        popView.preferredContentSize = CGSize(width: 220, height: 52)
        self.present(popView, animated: true, completion: nil)
        popView.popoverPresentationController?.permittedArrowDirections = .up
    }
    // show popup hints when ⓘ is clicked
    
    
    
    
    let HTCalculator = IGSHPAHTCalculation(heatPumpHeatingCapacity: 1
        , heatPumpCoolingCapacity:2
        , coefficientOfPerformance: 3
        , energyEfficientRatio: 4
        , meanEarthTempearture: 5
        , minEnteringWaterTemp: 6
        , minLeavingWaterTemp: 7
        , maxEnteringWaterTemp: 8
        , maxLeavingWaterTemp: 9
        , soilResistance: 10, trenchSpaceMulti: 11, pipeDiameterMulti:12
        , pipeOuterDiameter: 13
        , pipeInnerDiameter: 14
        , pipeThermalConductivity: 15
        , coolingRunningTime: 16
        , heatingRunningTime: 17, avgPipeDepth:18, surfaceTempAmplitude: 19,soilThermalDiffusivity: 20)
    // call the calculation function and set initial value of variables
    
    
    @IBAction func userTappedBackground(_ sender: Any) {
        view.endEditing(true)
    }
    // combined with changing UIView to UIcontrol and setting Touch Down, in order to dismiss the keyboard when users touch other place.
    func textFieldShouldReturn(_textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    @objc func returnTextField(){
        if copVariable .isFirstResponder{
            energyEfficientVariable.becomeFirstResponder()
        }
        else if energyEfficientVariable .isFirstResponder{heatPumpHeatingVariable.becomeFirstResponder()
        }else if heatPumpHeatingVariable.isFirstResponder{heatPumpCoolingVariable.becomeFirstResponder()
        }
        else if heatPumpCoolingVariable .isFirstResponder{
            minEnterTempVariable.becomeFirstResponder()
        }
        else if minEnterTempVariable.isFirstResponder{
            minLeaveTempVariable.becomeFirstResponder()
        }
        else if minLeaveTempVariable .isFirstResponder{
            maxEnterTempVariable.becomeFirstResponder()
        }
        else if maxEnterTempVariable.isFirstResponder{
            maxLeaveTempVariable.becomeFirstResponder()
        }
        else if maxLeaveTempVariable.isFirstResponder{
            coolingRunningTimeVariable.becomeFirstResponder()
        }
        else if coolingRunningTimeVariable.isFirstResponder{
            heatingRunningTimeVariable.becomeFirstResponder()
        }else if heatingRunningTimeVariable.isFirstResponder{meanEarthTempVariable.becomeFirstResponder()
        }else if meanEarthTempVariable.isFirstResponder{surfaceTempAmplitudeVariable.becomeFirstResponder()
        }else if surfaceTempAmplitudeVariable.isFirstResponder{soilResistanceVariable.becomeFirstResponder()
        }
        else if soilResistanceVariable.isFirstResponder{
            soilThermalDiffusivityVariable.becomeFirstResponder()
        }else if soilThermalDiffusivityVariable.isFirstResponder{
            pipeOuterDiameterVariable.becomeFirstResponder()
        }
        else if pipeOuterDiameterVariable.isFirstResponder{
            pipeInnerDiameterVariable.becomeFirstResponder()
        }
        else if pipeInnerDiameterVariable.isFirstResponder{
            pipeThermalConductivityVariable.becomeFirstResponder()
        }
        else if pipeThermalConductivityVariable.isFirstResponder{
            avgPipeDepthVariable.becomeFirstResponder()
        }else if avgPipeDepthVariable.isFirstResponder{trenchSpaceMultiVariable.becomeFirstResponder()
        }
        else if trenchSpaceMultiVariable.isFirstResponder{
            pipeDiameterMultiVariable.becomeFirstResponder()
        }
        else if pipeDiameterMultiVariable.isFirstResponder{
            numberOfTrenchesVariable.becomeFirstResponder()
        }
        else if numberOfTrenchesVariable.isFirstResponder{
            numberOfPipesInTrenchVariable.becomeFirstResponder()
        }
    }
    // method 1 to shift from first textfield to next one, and dismiss the keyboard when users done the last one.
    
    
    
    @objc func donePressed(){
        view.endEditing(true)
    }
    
    func textFieldShouldBeginEditing(_textField: UITextField) -> Bool {
        let keyboardButtonView = UIToolbar()
        keyboardButtonView.sizeToFit()
        // Create a button bar for the number pad
        
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: self, action: #selector(IGSHPAHTDataInputViewController.donePressed) )
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let nextButton = UIBarButtonItem(title: "Next", style: UIBarButtonItem.Style.plain, target: self, action: #selector(IGSHPAHTDataInputViewController.returnTextField) )
        // Setup the buttons to be put in the system.
        
        keyboardButtonView.setItems([doneButton,spaceButton,nextButton], animated: false)
        _textField.inputAccessoryView = keyboardButtonView
        //Put the buttons into the ToolBar and display the tool bar
        return true
    }
    // Add toolbar for decimal pad to have return key
    
    
    @objc func keyboardWillShow(notification:NSNotification){
        let userInfo = notification.userInfo!
        var keyboardFrame:CGRect = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        keyboardFrame = self.view.convert(keyboardFrame, from: nil)
        
        var contentInset:UIEdgeInsets = self.scrollView.contentInset
        contentInset.bottom = keyboardFrame.size.height
        self.scrollView.contentInset = contentInset
    }
    @objc func keyboardWillHide(notification:NSNotification){
        let contentInset:UIEdgeInsets = UIEdgeInsets.zero
        self.scrollView.contentInset = contentInset
    }
    // automatically scroll the textfield to been seen when the keyboards show
    // willShow and willHide Notification should be set in ViewDidLoad
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize = CGSize(width: 600, height: 1200)
        //set up scroll view content size, otherwise it won't scroll!
        //Ps: need a new UIView under scrollView, and make its width identical to superView, then it will not scroll horizontally
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(IGSHPAHTDataInputViewController.keyboardWillShow), name:UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(IGSHPAHTDataInputViewController.keyboardWillHide), name:UIResponder.keyboardWillHideNotification, object: nil)
        
        
        
        calculateButton.backgroundColor = UIColor.clear
        calculateButton.layer.cornerRadius = 5
        calculateButton.layer.borderWidth = 1
        calculateButton.layer.borderColor = UIColor.red.cgColor
        // button settings
    }

    
    
    @IBAction func calculate(_ sender: Any) {
        HTCalculator.heatPumpHeatingCapacity = Double((heatPumpHeatingVariable.text! as NSString).doubleValue)
        HTCalculator.coefficientOfPerformance = Double((copVariable.text! as NSString).doubleValue)
        HTCalculator.heatPumpCoolingCapacity = Double((heatPumpCoolingVariable.text! as NSString).doubleValue)
        HTCalculator.energyEfficientRatio = Double((energyEfficientVariable.text! as NSString).doubleValue)
        HTCalculator.meanEarthTempearture = Double((meanEarthTempVariable.text! as NSString).doubleValue)
        HTCalculator.minEnteringWaterTemp = Double((minEnterTempVariable.text! as NSString).doubleValue)
        HTCalculator.minLeavingWaterTemp = Double((minLeaveTempVariable.text! as NSString).doubleValue)
        HTCalculator.maxEnteringWaterTemp = Double((maxEnterTempVariable.text! as NSString).doubleValue)
        HTCalculator.maxLeavingWaterTemp = Double((maxLeaveTempVariable.text! as NSString).doubleValue)
        HTCalculator.soilResistance = Double((soilResistanceVariable.text! as NSString).doubleValue)
        HTCalculator.trenchSpaceMulti = Double((trenchSpaceMultiVariable.text! as NSString).doubleValue)
        HTCalculator.pipeDiameterMulti = Double((pipeDiameterMultiVariable.text! as NSString).doubleValue)
        HTCalculator.pipeOuterDiameter = Double((pipeOuterDiameterVariable.text! as NSString).doubleValue)
        HTCalculator.pipeInnerDiameter = Double((pipeInnerDiameterVariable.text! as NSString).doubleValue)
        HTCalculator.pipeThermalConductivity = Double((pipeThermalConductivityVariable.text! as NSString).doubleValue)
        HTCalculator.coolingRunningTime = Double((coolingRunningTimeVariable.text! as NSString).doubleValue)
        HTCalculator.heatingRunningTime = Double((heatingRunningTimeVariable.text! as NSString).doubleValue)
        HTCalculator.avgPipeDepth = Double((avgPipeDepthVariable.text! as NSString).doubleValue)
        HTCalculator.surfaceTempAmplitude = Double((surfaceTempAmplitudeVariable.text! as NSString).doubleValue)
        HTCalculator.soilThermalDiffusivity = Double((soilThermalDiffusivityVariable.text! as NSString).doubleValue)
        // input users' data to the calculator and calculate them when users press the calculate button
        
        
        inputIsWrong(textField: copVariable)
        inputIsWrong(textField: heatPumpCoolingVariable)
        inputIsWrong(textField: heatPumpHeatingVariable)
        inputIsWrong(textField: energyEfficientVariable)
        inputIsWrong(textField: meanEarthTempVariable)
        inputIsWrong(textField: minEnterTempVariable)
        inputIsWrong(textField: minLeaveTempVariable)
        inputIsWrong(textField: maxEnterTempVariable)
        inputIsWrong(textField: maxLeaveTempVariable)
        inputIsWrong(textField: soilResistanceVariable)
        inputIsWrong(textField: trenchSpaceMultiVariable)
        inputIsWrong(textField: pipeDiameterMultiVariable)
        inputIsWrong(textField: pipeOuterDiameterVariable)
        inputIsWrong(textField: pipeInnerDiameterVariable)
        inputIsWrong(textField: pipeThermalConductivityVariable)
        inputIsWrong(textField: coolingRunningTimeVariable)
        inputIsWrong(textField: heatingRunningTimeVariable)
        inputIsWrong(textField: avgPipeDepthVariable)
        inputIsWrong(textField: surfaceTempAmplitudeVariable)
        inputIsWrong(textField: soilThermalDiffusivityVariable)
        
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
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
 {
    if segue.identifier == "calculate"{
        let dvc:IGSHPAHTResultViewController = segue.destination as! IGSHPAHTResultViewController;
        dvc.heatPumpHeatingInput = heatPumpHeatingVariable.text!
        dvc.heatPumpCoolingInput = heatPumpCoolingVariable.text!
        dvc.COPInput = copVariable.text!
        dvc.energyEfficientRatioInput = energyEfficientVariable.text!
        dvc.meanEarthTempeartureInput = meanEarthTempVariable.text!
        dvc.minEnteringWaterTempInput = minEnterTempVariable.text!
        dvc.maxEnteringWaterTempInput = maxEnterTempVariable.text!
        dvc.minLeavingWaterTempInput = minLeaveTempVariable.text!
        dvc.maxLeavingWaterTempInput = maxLeaveTempVariable.text!
        dvc.soilResistanceInput = soilResistanceVariable.text!
        dvc.trenchSpaceMultiInput = trenchSpaceMultiVariable.text!
        dvc.pipeDiameterMultiInput = pipeDiameterMultiVariable.text!
        dvc.pipeOuterDiameterInput = pipeOuterDiameterVariable.text!
        dvc.pipeInnerDiameterInput = pipeInnerDiameterVariable.text!
        dvc.pipeThermalConductivityInput = pipeThermalConductivityVariable.text!
        dvc.coolingRunningTimeInput = coolingRunningTimeVariable.text!
        dvc.heatingRunningTimeInput = heatingRunningTimeVariable.text!
        dvc.avgPipeDepthInput = avgPipeDepthVariable.text!
        dvc.surfaceTempAmplitudeInput = surfaceTempAmplitudeVariable.text!
        dvc.soilThermalDiffusivityInput = soilThermalDiffusivityVariable.text!
        dvc.coolingRunFractionResult = String(format: "%0.1f", HTCalculator.coolingRunFraction)
        dvc.heatingRunFractionResult = String(format: "%0.1f", HTCalculator.heatingRunFraction)
        dvc.pipeThermalResistanceResult = String(format: "%0.1f", HTCalculator.pipeThermalResistance)
        dvc.designCoolingEarthTempResult = String(format: "%0.1f", HTCalculator.designCoolingEarthTemp)
        dvc.designHeatingEarthTempResult = String(format: "%0.1f", HTCalculator.designHeatingEarthTemp)
        dvc.coolingBoreholeLengthResult = String(format: "%0.1f", HTCalculator.coolingBoreholeLength)
        dvc.heatingBoreholeLengthResult = String(format: "%0.1f", HTCalculator.heatingBoreholeLength)
        dvc.numberOfTrenchesInput = numberOfTrenchesVariable.text!
        dvc.numberOfPipesInTrenchInput = numberOfPipesInTrenchVariable.text!
    }else if segue.identifier == "appInfo"{
        let dvc: UINavigationController = segue.destination as! UINavigationController
    dvc.popoverPresentationController?.delegate = self
    }
    
    }
    // a link between first view controller (dataInput interface) and second view controller (results interface)
    // used for transfer the results and dataInput from first to second
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle
    {
        return UIModalPresentationStyle.none
    }
    // to make the menu's presentation style as a pop-over
    
    
    /*override func viewWillAppear(animated: Bool) {
     let copDef = NSUserDefaults.standardUserDefaults()
     let theCop = copDef .stringForKey("cop")
     copVariable.text = theCop
     let tcdDef = NSUserDefaults.standardUserDefaults()
     let theTCD = tcdDef .stringForKey("tcd")
     heatPumpCoolingVariable.text = theTCD
     let hcdDef = NSUserDefaults.standardUserDefaults()
     let theHCD = hcdDef .stringForKey("hcd")
     heatPumpHeatingVariable.text = theHCD
     let eerdDef = NSUserDefaults.standardUserDefaults()
     let theEERD = eerdDef .stringForKey("eerd")
     energyEfficientVariable.text = theEERD
     let tmDef = NSUserDefaults.standardUserDefaults()
     let theTM = tmDef .stringForKey("tg")
     meanEarthTempVariable.text = theTM
     let ewtminDef = NSUserDefaults.standardUserDefaults()
     let theEWTmin = ewtminDef .stringForKey("ewtmin")
     minEnterTempVariable.text = theEWTmin
     let lwtminDef = NSUserDefaults.standardUserDefaults()
     let theLWTmin = lwtminDef .stringForKey("lwtmin")
     minLeaveTempVariable.text = theLWTmin
     let ewtmaxDef = NSUserDefaults.standardUserDefaults()
     let theEWTmax = ewtmaxDef .stringForKey("ewtmax")
     maxEnterTempVariable.text = theEWTmax
     let lwtmaxDef = NSUserDefaults.standardUserDefaults()
     let theLWTmax = lwtmaxDef .stringForKey("lwtmax")
     maxLeaveTempVariable.text = theLWTmax
     let kgDef = NSUserDefaults.standardUserDefaults()
     let thekG = kgDef .stringForKey("kg")
     groundThermalConductivityVariable.text = thekG
     let dgoDef = NSUserDefaults.standardUserDefaults()
     let theDGO = dgoDef .stringForKey("dgo")
     groundHeatTransferDiameterVariable.text = theDGO
     let dbDef = NSUserDefaults.standardUserDefaults()
     let theDB = dbDef .stringForKey("db")
     boreholeDiameterVariable.text = theDB
     let dpoDef = NSUserDefaults.standardUserDefaults()
     let theDPO = dpoDef .stringForKey("dpo")
     pipeOuterDiameterVariable.text = theDPO
     let dpiDef = NSUserDefaults.standardUserDefaults()
     let theDpi = dpiDef .stringForKey("dpi")
     pipeInnerDiameterVariable.text = theDpi
     let kgroutDef = NSUserDefaults.standardUserDefaults()
     let thekGrout = kgroutDef .stringForKey("kgrout")
     groutThermalConductivityVariable.text = thekGrout
     let kpDef = NSUserDefaults.standardUserDefaults()
     let theKp = kpDef .stringForKey("kp")
     pipeThermalConductivityVariable.text = theKp
     let rtclgDef = NSUserDefaults.standardUserDefaults()
     let theRTCLG = rtclgDef .stringForKey("rtclg")
     coolingRunningTimeVariable.text = theRTCLG
     let rthtgDef = NSUserDefaults.standardUserDefaults()
     let theRTHTG = rthtgDef .stringForKey("rthtg")
     heatingRunningTimeVariable.text = theRTHTG
     let theD = NSUserDefaults.standardUserDefaults().stringForKey("d")
     avgPipeDepthVariables.text = theD
     let theAS = NSUserDefaults.standardUserDefaults().stringForKey("as")
     soilTempAmplitudeVariables.text = theAS     let theAlpha = NSUserDefaults.standardUserDefaults().stringForKey("alpha")
     soilDiffusivityVariables.text = theAlpha
     }
     
     override func viewWillDisappear(animated: Bool) {
     let copValue = copVariable.text
     NSUserDefaults.standardUserDefaults().setObject(copValue, forKey: "cop")
     let tcdValue = heatPumpCoolingVariable.text
     NSUserDefaults.standardUserDefaults().setObject(tcdValue, forKey: "tcd")
     let hcdValue = heatPumpHeatingVariable.text
     NSUserDefaults.standardUserDefaults().setObject(hcdValue, forKey: "hcd")
     let eerdValue = energyEfficientVariable.text
     NSUserDefaults.standardUserDefaults().setObject(eerdValue, forKey: "eerd")
     let tmValue = meanEarthTempVariable.text
     NSUserDefaults.standardUserDefaults().setObject(tmValue, forKey: "tm")
     let ewtminValue = minEnterTempVariable.text
     NSUserDefaults.standardUserDefaults().setObject(ewtminValue, forKey: "ewtmin")
     let lwtminValue = minLeaveTempVariable.text
     NSUserDefaults.standardUserDefaults().setObject(lwtminValue, forKey: "lwtmin")
     let ewtmaxValue = maxEnterTempVariable.text
     NSUserDefaults.standardUserDefaults().setObject(ewtmaxValue, forKey: "ewtmax")
     let lwtmaxValue = maxLeaveTempVariable.text
     NSUserDefaults.standardUserDefaults().setObject(lwtmaxValue, forKey: "lwtmax")
     let kgValue = groundThermalConductivityVariable.text
     NSUserDefaults.standardUserDefaults().setObject(kgValue, forKey: "kg")
     let dgoValue = groundHeatTransferDiameterVariable.text
     NSUserDefaults.standardUserDefaults().setObject(dgoValue, forKey: "dgo")
     let dbValue = boreholeDiameterVariable.text
     NSUserDefaults.standardUserDefaults().setObject(dbValue, forKey: "db")
     let dpoValue = pipeOuterDiameterVariable.text
     NSUserDefaults.standardUserDefaults().setObject(dpoValue, forKey: "dpo")
     let dpiValue = pipeInnerDiameterVariable.text
     NSUserDefaults.standardUserDefaults().setObject(dpiValue, forKey: "dpi")
     let kgroutValue = groutThermalConductivityVariable.text
     NSUserDefaults.standardUserDefaults().setObject(kgroutValue, forKey: "kgrout")
     let kpValue = pipeThermalConductivityVariable.text
     NSUserDefaults.standardUserDefaults().setObject(kpValue, forKey: "kp")
     let rtclgValue = coolingRunningTimeVariable.text
     NSUserDefaults.standardUserDefaults().setObject(rtclgValue, forKey: "rtclg")
     let rthtgValue = heatingRunningTimeVariable.text
     NSUserDefaults.standardUserDefaults().setObject(rthtgValue, forKey: "rthtg")
     
     let dValue = avgPipeDepthVariable.text
     NSUserDefaults.standardUserDefaults().setObject(dValue, forKey: "d")
     
     let asValue = surfaceTempAmplitudeVariable.text
     NSUserDefaults.standardUserDefaults().setObject(asValue, forKey: "as")
     
     let alphaValue = soilThermalDiffusivityVariable.text
     NSUserDefaults.standardUserDefaults().setObject(alphaValue, forKey: "alpha")
     }
     // viewwillappear/disappear save the input even user left the app*/
    
}
