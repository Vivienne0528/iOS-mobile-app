//
//  ViewController.swift
//  PreGeo
///Users/Leon/Downloads/Geothermal v1.1/Geo/IGSHPAHTDataInputViewController.swift
//  Created by Leon ZHANG on 15/03/2016.
//  Copyright © 2016 ZHANGLiangliang. All rights reserved.
//

import UIKit

class IGSHPAVerticallyBoredDataInputViewController: UIViewController, UITextFieldDelegate, UIAlertViewDelegate, UIPopoverPresentationControllerDelegate {
    
    @IBOutlet weak var copVariable: UITextField!
    @IBOutlet weak var heatPumpCoolingVariable: UITextField!
    @IBOutlet weak var heatPumpHeatingVariable: UITextField!
    @IBOutlet weak var energyEfficientVariable: UITextField!
    @IBOutlet weak var deepEarthTempVariable: UITextField!
    @IBOutlet weak var minEnterTempVariable: UITextField!
    @IBOutlet weak var minLeaveTempVariable: UITextField!
    @IBOutlet weak var maxEnterTempVariable: UITextField!
    @IBOutlet weak var maxLeaveTempVariable: UITextField!
    @IBOutlet weak var groundThermalConductivityVariable: UITextField!
    @IBOutlet weak var groundHeatTransferDiameterVariable: UITextField!
    @IBOutlet weak var boreholeDiameterVariable: UITextField!
    @IBOutlet weak var pipeOuterDiameterVariable: UITextField!
    @IBOutlet weak var pipeInnerDiameterVariable: UITextField!
    @IBOutlet weak var groutThermalConductivityVariable: UITextField!
    @IBOutlet weak var pipeThermalConductivityVariable: UITextField!
    @IBOutlet weak var coolingRunningTimeVariable: UITextField!
    @IBOutlet weak var heatingRunningTimeVariable: UITextField!
    @IBOutlet weak var numberOfBoreholesVariable: UITextField!


    
    @IBOutlet weak var calculateButton: UIButton!
    
    @IBOutlet weak var showCoPInfoButton: UIButton!
    
    @IBOutlet weak var showTCDInfoButton: UIButton!
    
    @IBOutlet weak var showHCDInfoButton: UIButton!
    
    @IBOutlet weak var showEERDInfoButton: UIButton!
    
    @IBOutlet weak var showTGInfoButton: UIButton!
    
    @IBOutlet weak var showEWTminInfoButton: UIButton!
    
    @IBOutlet weak var showLWTminInfoButton: UIButton!
    
    @IBOutlet weak var showEWTmaxInfoButton: UIButton!
    
    @IBOutlet weak var showLWTmaxInfoButton: UIButton!
    
    @IBOutlet weak var showkGInfoButton: UIButton!
    
    @IBOutlet weak var showDGOInfoButton: UIButton!
    
    @IBOutlet weak var showDBInfoButton: UIButton!
    
    @IBOutlet weak var showDPOInfoButton: UIButton!
    
    @IBOutlet weak var showDpiInfoButton: UIButton!
    
    @IBOutlet weak var showkGroutInfoButton: UIButton!
    
    @IBOutlet weak var showkpInfoButton: UIButton!
    
    @IBOutlet weak var showRTCLGInfoButton: UIButton!
    
    @IBOutlet weak var showRTHTGInfoButton: UIButton!


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
    
    @IBAction func showTGInfo() {
        let popView = TGViewController(nibName:"TGView",bundle: nil)
        popView.modalPresentationStyle = .popover
        popView.popoverPresentationController!.delegate = self
        popView.popoverPresentationController?.sourceView = showTGInfoButton
        popView.preferredContentSize = CGSize(width: 220, height: 73)
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
    
    @IBAction func showkGInfo() {
        let popView = kGViewController(nibName:"kGView",bundle: nil)
        popView.modalPresentationStyle = .popover
        popView.popoverPresentationController!.delegate = self
        popView.popoverPresentationController?.sourceView = showkGInfoButton
        popView.preferredContentSize = CGSize(width: 245, height: 73)
        self.present(popView, animated: true, completion: nil)
        popView.popoverPresentationController?.permittedArrowDirections = .up
    }
    
    @IBAction func showDGOInfo() {
        let popView = DGOViewController(nibName:"DGOView",bundle: nil)
        popView.modalPresentationStyle = .popover
        popView.popoverPresentationController!.delegate = self
        popView.popoverPresentationController?.sourceView = showDGOInfoButton
        popView.preferredContentSize = CGSize(width: 215, height: 94)
        self.present(popView, animated: true, completion: nil)
        popView.popoverPresentationController?.permittedArrowDirections = .up
    }
    
    @IBAction func showDBInfo() {
        let popView = DBViewController(nibName:"DBView",bundle: nil)
        popView.modalPresentationStyle = .popover
        popView.popoverPresentationController!.delegate = self
        popView.popoverPresentationController?.sourceView = showDBInfoButton
        popView.preferredContentSize = CGSize(width: 200, height: 52)
        self.present(popView, animated: true, completion: nil)
        popView.popoverPresentationController?.permittedArrowDirections = .up
    }
    
    @IBAction func showDPOInfo() {
        let popView = DPOViewController(nibName:"DPOView",bundle: nil)
        popView.modalPresentationStyle = .popover
        popView.popoverPresentationController!.delegate = self
        popView.popoverPresentationController?.sourceView = showDPOInfoButton
        popView.preferredContentSize = CGSize(width: 200, height: 52)
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
    
    @IBAction func showkGroutInfo() {
        let popView = kGroutViewController(nibName:"kGroutView",bundle: nil)
        popView.modalPresentationStyle = .popover
        popView.popoverPresentationController!.delegate = self
        popView.popoverPresentationController?.sourceView = showkGroutInfoButton
        popView.preferredContentSize = CGSize(width: 230, height: 52)
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
        popView.preferredContentSize = CGSize(width: 200, height: 94)
        self.present(popView, animated: true, completion: nil)
        popView.popoverPresentationController?.permittedArrowDirections = .up
    }
    
    @IBAction func showRTHTGInfo() {
        let popView = RTHTGViewController(nibName:"RTHTGView",bundle: nil)
        popView.modalPresentationStyle = .popover
        popView.popoverPresentationController!.delegate = self
        popView.popoverPresentationController?.sourceView = showRTHTGInfoButton
        popView.preferredContentSize = CGSize(width: 200, height: 94)
        self.present(popView, animated: true, completion: nil)
        popView.popoverPresentationController?.permittedArrowDirections = .up
    }
    
    // show popup hints when ⓘ is clicked

        
    
    
    let verticallyBoredCalculator = IGSHPAVerticallyBoredCalculation(heatPumpHeatingCapacity: 1
        , heatPumpCoolingCapacity:2
        , coefficientOfPerformance: 3
        , energyEfficientRatio: 4
        , deepEarthTempearture: 5
        , minEnteringWaterTemp: 6
        , minLeavingWaterTemp: 7
        , maxEnteringWaterTemp: 8
        , maxLeavingWaterTemp: 9
        , groundThermalConductivity: 10
        , groudHeatTransferDiameter: 11
        , boreholeDiameter: 12
        , pipeOuterDiameter: 13
        , pipeInnerDiameter: 14
        , groutThermalConductivity: 15
        , pipeThermalConductivity: 16
        , coolingRunningTime: 17
        , heatingRunningTime: 18)
    // call the calculation function and set initial value of variables

    
    
    @IBAction func userTappedBackground(_ sender: Any) {
        view.endEditing(true)
    }
    // combined with changing UIView to UIcontrol and setting Touch Down, in order to dismiss the keyboard when users touch other place.
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
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
       }else if heatingRunningTimeVariable.isFirstResponder{
        groundThermalConductivityVariable.becomeFirstResponder()
        }
       else if groundThermalConductivityVariable.isFirstResponder{
        deepEarthTempVariable.becomeFirstResponder()}else if deepEarthTempVariable.isFirstResponder{
         groundHeatTransferDiameterVariable.becomeFirstResponder()
        }
       else if groundHeatTransferDiameterVariable.isFirstResponder{
        boreholeDiameterVariable.becomeFirstResponder()
        }
       else if boreholeDiameterVariable.isFirstResponder{
        pipeOuterDiameterVariable.becomeFirstResponder()
        }
       else if pipeOuterDiameterVariable.isFirstResponder{
        pipeInnerDiameterVariable.becomeFirstResponder()
        }
       else if pipeInnerDiameterVariable.isFirstResponder{
        groutThermalConductivityVariable.becomeFirstResponder()
        }
       else if groutThermalConductivityVariable.isFirstResponder{
        pipeThermalConductivityVariable.becomeFirstResponder()
        }
       else if pipeThermalConductivityVariable.isFirstResponder{
        numberOfBoreholesVariable.becomeFirstResponder()
        }
    }
    // method 1 to shift from first textfield to next one, and dismiss the keyboard when users done the last one.

    
    
    @objc func donePressed(){
        view.endEditing(true)
    }

    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        let keyboardButtonView = UIToolbar()
        keyboardButtonView.sizeToFit()
        // Create a button bar for the number pad
        
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: self, action: #selector(IGSHPAVerticallyBoredDataInputViewController.donePressed) )
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let nextButton = UIBarButtonItem(title: "Next", style: UIBarButtonItem.Style.plain, target: self, action: #selector(IGSHPAVerticallyBoredDataInputViewController.returnTextField) )
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

        
        NotificationCenter.default.addObserver(self, selector: #selector(IGSHPAVerticallyBoredDataInputViewController.keyboardWillShow), name:UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(IGSHPAVerticallyBoredDataInputViewController.keyboardWillHide), name:UIResponder.keyboardWillHideNotification, object: nil)
        
        
        
        calculateButton.backgroundColor = UIColor.clear
        calculateButton.layer.cornerRadius = 5
        calculateButton.layer.borderWidth = 1
        calculateButton.layer.borderColor = UIColor.red.cgColor
        // button settings
        
 

       /* copVariable.text = NSUserDefaults.standardUserDefaults().objectForKey("cop") as? String
        //get the copValue from NSUserDefaults*/
        

        
            }
    /*override func viewDidAppear(animated: Bool) {

        copVariable.text = CopValue
    }*/


    
    @IBAction func calculate(_ sender: AnyObject) {
        verticallyBoredCalculator.heatPumpHeatingCapacity = Double((heatPumpHeatingVariable.text! as NSString).doubleValue)
        verticallyBoredCalculator.coefficientOfPerformance = Double((copVariable.text! as NSString).doubleValue)
        verticallyBoredCalculator.heatPumpCoolingCapacity = Double((heatPumpCoolingVariable.text! as NSString).doubleValue)
        verticallyBoredCalculator.energyEfficientRatio = Double((energyEfficientVariable.text! as NSString).doubleValue)
        verticallyBoredCalculator.deepEarthTempearture = Double((deepEarthTempVariable.text! as NSString).doubleValue)
        verticallyBoredCalculator.minEnteringWaterTemp = Double((minEnterTempVariable.text! as NSString).doubleValue)
        verticallyBoredCalculator.minLeavingWaterTemp = Double((minLeaveTempVariable.text! as NSString).doubleValue)
        verticallyBoredCalculator.maxEnteringWaterTemp = Double((maxEnterTempVariable.text! as NSString).doubleValue)
        verticallyBoredCalculator.maxLeavingWaterTemp = Double((maxLeaveTempVariable.text! as NSString).doubleValue)
        verticallyBoredCalculator.groundThermalConductivity = Double((groundThermalConductivityVariable.text! as NSString).doubleValue)
        verticallyBoredCalculator.groundHeatTransferDiameter = Double((groundHeatTransferDiameterVariable.text! as NSString).doubleValue)
        verticallyBoredCalculator.boreholeDiameter = Double((boreholeDiameterVariable.text! as NSString).doubleValue)
        verticallyBoredCalculator.pipeOuterDiameter = Double((pipeOuterDiameterVariable.text! as NSString).doubleValue)
        verticallyBoredCalculator.pipeInnerDiameter = Double((pipeInnerDiameterVariable.text! as NSString).doubleValue)
        verticallyBoredCalculator.groutThermalConductivity = Double((groutThermalConductivityVariable.text! as NSString).doubleValue)
        verticallyBoredCalculator.pipeThermalConductivity = Double((pipeThermalConductivityVariable.text! as NSString).doubleValue)
        verticallyBoredCalculator.coolingRunningTime = Double((coolingRunningTimeVariable.text! as NSString).doubleValue)
        verticallyBoredCalculator.heatingRunningTime = Double((heatingRunningTimeVariable.text! as NSString).doubleValue)
        // input users' data to the calculator and calculate them when users press the calculate button
        
        
        inputIsWrong(textField: copVariable)
        inputIsWrong(textField: heatPumpCoolingVariable)
        inputIsWrong(textField: heatPumpHeatingVariable)
        inputIsWrong(textField: energyEfficientVariable)
        inputIsWrong(textField: deepEarthTempVariable)
        inputIsWrong(textField: minEnterTempVariable)
        inputIsWrong(textField: minLeaveTempVariable)
        inputIsWrong(textField: maxEnterTempVariable)
        inputIsWrong(textField: maxLeaveTempVariable)
        inputIsWrong(textField: groundThermalConductivityVariable)
        inputIsWrong(textField: groundHeatTransferDiameterVariable)
        inputIsWrong(textField: boreholeDiameterVariable)
        inputIsWrong(textField: pipeOuterDiameterVariable)
        inputIsWrong(textField: pipeInnerDiameterVariable)
        inputIsWrong(textField: groutThermalConductivityVariable)
        inputIsWrong(textField: pipeThermalConductivityVariable)
        inputIsWrong(textField: coolingRunningTimeVariable)
        inputIsWrong(textField: heatingRunningTimeVariable)
        
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
if segue.identifier == "calculate"{
    let dvc:IGSHPAVBResultsViewController = segue.destination as! IGSHPAVBResultsViewController;
        dvc.heatPumpHeatingInput = heatPumpHeatingVariable.text!
        dvc.heatPumpCoolingInput = heatPumpCoolingVariable.text!
        dvc.COPInput = copVariable.text!
        dvc.energyEfficientRatioInput = energyEfficientVariable.text!
        dvc.deepEarthTempeartureInput = deepEarthTempVariable.text!
        dvc.minEnteringWaterTempInput = minEnterTempVariable.text!
        dvc.maxEnteringWaterTempInput = maxEnterTempVariable.text!
        dvc.minLeavingWaterTempInput = minLeaveTempVariable.text!
        dvc.maxLeavingWaterTempInput = maxLeaveTempVariable.text!
        dvc.groundThermalConductivityInput = groundThermalConductivityVariable.text!
        dvc.groundHeatTransferDiameterInput = groundHeatTransferDiameterVariable.text!
        dvc.boreholeDiameterInput = boreholeDiameterVariable.text!
        dvc.pipeOuterDiameterInput = pipeOuterDiameterVariable.text!
        dvc.pipeInnerDiameterInput = pipeInnerDiameterVariable.text!
        dvc.groutThermalConductivityInput = groutThermalConductivityVariable.text!
        dvc.pipeThermalConductivityInput = pipeThermalConductivityVariable.text!
        dvc.coolingRunningTimeInput = coolingRunningTimeVariable.text!
        dvc.heatingRunningTimeInput = heatingRunningTimeVariable.text!
        dvc.boreholeThermalResistanceResult = String(format: "%0.1f", verticallyBoredCalculator.boreholeThermalResistance)
        dvc.coolingRunFractionResult = String(format: "%0.1f", verticallyBoredCalculator.coolingRunFraction)
        dvc.heatingRunFractionResult = String(format: "%0.1f", verticallyBoredCalculator.heatingRunFraction)
        dvc.boreholeShapeFactorResult = String(format: "%0.1f", verticallyBoredCalculator.boreholeShapeFactor)
        dvc.groundThermalResistanceResult = String(format: "%0.1f", verticallyBoredCalculator.groundThermalResistance)
        dvc.pipeWallThermalResistanceResult = String(format: "%0.1f", verticallyBoredCalculator.pipeWallThermalResistance)
        dvc.groutThermalResistanceResult = String(format: "%0.1f", verticallyBoredCalculator.groutThermalResistance)
        dvc.coolingBoreholeLengthResult = String(format: "%0.1f", verticallyBoredCalculator.coolingBoreholeLength)
        dvc.heatingBoreholeLengthResult = String(format: "%0.1f", verticallyBoredCalculator.heatingBoreholeLength)
    dvc.numberOfBoreholesInput = numberOfBoreholesVariable.text!
} else if segue.identifier == "appInfo"{
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
    
    
    override func viewWillAppear(_ animated: Bool) {
        let copDef = UserDefaults.standard
        let theCop = copDef .string(forKey: "cop")
        copVariable.text = theCop
        let tcdDef = UserDefaults.standard
        let theTCD = tcdDef .string(forKey: "tcd")
        heatPumpCoolingVariable.text = theTCD
        let hcdDef = UserDefaults.standard
        let theHCD = hcdDef .string(forKey: "hcd")
        heatPumpHeatingVariable.text = theHCD
        let eerdDef = UserDefaults.standard
        let theEERD = eerdDef .string(forKey: "eerd")
        energyEfficientVariable.text = theEERD
        let tgDef = UserDefaults.standard
        let theTG = tgDef .string(forKey: "tg")
        deepEarthTempVariable.text = theTG
        let ewtminDef = UserDefaults.standard
        let theEWTmin = ewtminDef .string(forKey: "ewtmin")
        minEnterTempVariable.text = theEWTmin
        let lwtminDef = UserDefaults.standard
        let theLWTmin = lwtminDef .string(forKey: "lwtmin")
        minLeaveTempVariable.text = theLWTmin
        let ewtmaxDef = UserDefaults.standard
        let theEWTmax = ewtmaxDef .string(forKey: "ewtmax")
        maxEnterTempVariable.text = theEWTmax
        let lwtmaxDef = UserDefaults.standard
        let theLWTmax = lwtmaxDef .string(forKey: "lwtmax")
        maxLeaveTempVariable.text = theLWTmax
        let kgDef = UserDefaults.standard
        let thekG = kgDef .string(forKey: "kg")
        groundThermalConductivityVariable.text = thekG
        let dgoDef = UserDefaults.standard
        let theDGO = dgoDef .string(forKey: "dgo")
        groundHeatTransferDiameterVariable.text = theDGO
        let dbDef = UserDefaults.standard
        let theDB = dbDef .string(forKey: "db")
        boreholeDiameterVariable.text = theDB
        let dpoDef = UserDefaults.standard
        let theDPO = dpoDef .string(forKey: "dpo")
        pipeOuterDiameterVariable.text = theDPO
        let dpiDef = UserDefaults.standard
        let theDpi = dpiDef .string(forKey: "dpi")
        pipeInnerDiameterVariable.text = theDpi
        let kgroutDef = UserDefaults.standard
        let thekGrout = kgroutDef .string(forKey: "kgrout")
        groutThermalConductivityVariable.text = thekGrout
        let kpDef = UserDefaults.standard
        let theKp = kpDef .string(forKey: "kp")
        pipeThermalConductivityVariable.text = theKp
        let rtclgDef = UserDefaults.standard
        let theRTCLG = rtclgDef .string(forKey: "rtclg")
        coolingRunningTimeVariable.text = theRTCLG
        let rthtgDef = UserDefaults.standard
        let theRTHTG = rthtgDef .string(forKey: "rthtg")
        heatingRunningTimeVariable.text = theRTHTG
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        let copValue = copVariable.text
        UserDefaults.standard.set(copValue, forKey: "cop")
        let tcdValue = heatPumpCoolingVariable.text
        UserDefaults.standard.set(tcdValue, forKey: "tcd")
        let hcdValue = heatPumpHeatingVariable.text
        UserDefaults.standard.set(hcdValue, forKey: "hcd")
        let eerdValue = energyEfficientVariable.text
        UserDefaults.standard.set(eerdValue, forKey: "eerd")
        let tgValue = deepEarthTempVariable.text
        UserDefaults.standard.set(tgValue, forKey: "tg")
        let ewtminValue = minEnterTempVariable.text
        UserDefaults.standard.set(ewtminValue, forKey: "ewtmin")
        let lwtminValue = minLeaveTempVariable.text
        UserDefaults.standard.set(lwtminValue, forKey: "lwtmin")
        let ewtmaxValue = maxEnterTempVariable.text
        UserDefaults.standard.set(ewtmaxValue, forKey: "ewtmax")
        let lwtmaxValue = maxLeaveTempVariable.text
        UserDefaults.standard.set(lwtmaxValue, forKey: "lwtmax")
        let kgValue = groundThermalConductivityVariable.text
        UserDefaults.standard.set(kgValue, forKey: "kg")
        let dgoValue = groundHeatTransferDiameterVariable.text
        UserDefaults.standard.set(dgoValue, forKey: "dgo")
        let dbValue = boreholeDiameterVariable.text
        UserDefaults.standard.set(dbValue, forKey: "db")
        let dpoValue = pipeOuterDiameterVariable.text
        UserDefaults.standard.set(dpoValue, forKey: "dpo")
        let dpiValue = pipeInnerDiameterVariable.text
        UserDefaults.standard.set(dpiValue, forKey: "dpi")
        let kgroutValue = groutThermalConductivityVariable.text
        UserDefaults.standard.set(kgroutValue, forKey: "kgrout")
        let kpValue = pipeThermalConductivityVariable.text
        UserDefaults.standard.set(kpValue, forKey: "kp")
        let rtclgValue = coolingRunningTimeVariable.text
        UserDefaults.standard.set(rtclgValue, forKey: "rtclg")
        let rthtgValue = heatingRunningTimeVariable.text
        UserDefaults.standard.set(rthtgValue, forKey: "rthtg")
    }
    // viewwillappear/disappear save the input even user left the app*/

}





