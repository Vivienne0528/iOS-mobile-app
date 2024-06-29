//
//  resultsViewController.swift
//  Geo
//
//  Created by Leon ZHANG on 22/03/2016.
//  Copyright © 2016 ZHANGLiangliang. All rights reserved.
//

import UIKit

class IGSHPAVBResultsViewController: UIViewController, UIPopoverPresentationControllerDelegate,UIScrollViewDelegate {

    @IBOutlet weak var inputCop: UILabel!
    @IBOutlet weak var inputHeatPumpCooling: UILabel!
    @IBOutlet weak var inputHeatPumpHeating: UILabel!
    @IBOutlet weak var inputEnergyEfficient: UILabel!
    @IBOutlet weak var inputDeepEarthTemp: UILabel!
    @IBOutlet weak var inputMinEnterTemp: UILabel!
    @IBOutlet weak var inputMinLeaveTemp: UILabel!
    @IBOutlet weak var inputMaxEnterTemp: UILabel!
    @IBOutlet weak var inputMaxLeaveTemp: UILabel!
    @IBOutlet weak var inputGroundThermalConductivity: UILabel!
    @IBOutlet weak var inputGroundHeatTransferDiameter: UILabel!
    @IBOutlet weak var inputBoreholeDiameter: UILabel!
    @IBOutlet weak var inputPipeOuterDiameter: UILabel!
    @IBOutlet weak var inputPipeInnerDiameter: UILabel!
    @IBOutlet weak var inputGroutThermalConductivity: UILabel!
    @IBOutlet weak var inputPipeThermalConductivity: UILabel!
    @IBOutlet weak var inputCoolingRunningTime: UILabel!
    @IBOutlet weak var inputHeatingRunningTime: UILabel!
    
    @IBOutlet weak var resultBoreholeThermalResistance: UILabel!
    @IBOutlet weak var resultCoolingRunFraction:UILabel!
    @IBOutlet weak var resultHeatingRunFraction: UILabel!
    @IBOutlet weak var resultBoreholeShapeFactor: UILabel!
    @IBOutlet weak var resultGroundThermalResistance: UILabel!
    @IBOutlet weak var resultPipeWallThermalResistance:UILabel!
    @IBOutlet weak var resultGroutThermalResistance: UILabel!
    @IBOutlet weak var resultCoolingBoreholeLength: UILabel!
    @IBOutlet weak var resultHeatingBoreholeLength: UILabel!
    @IBOutlet weak var numberOfBoreholes: UILabel!
    @IBOutlet weak var minimumBorehole: UILabel!
    
    var heatPumpHeatingInput:String = "HC(D)"
    var heatPumpCoolingInput:String = "TC(D)"
    var COPInput:String = "COP(D)"
    var energyEfficientRatioInput:String = "EER(D)"
    var deepEarthTempeartureInput:String = "T(G)"
    var minEnteringWaterTempInput:String = "EWT(min)"
    var minLeavingWaterTempInput:String = "LWT(min)"
    var maxEnteringWaterTempInput:String = "EWT(max)"
    var maxLeavingWaterTempInput:String = "LWT(max)"
    var groundThermalConductivityInput:String = "k(G)"
    var groundHeatTransferDiameterInput:String = "D(G,O)"
    var boreholeDiameterInput:String = "D(B)"
    var pipeOuterDiameterInput:String = "D(P,O)"
    var pipeInnerDiameterInput:String = "D(p,i)"
    var groutThermalConductivityInput:String = "k(Grout)"
    var pipeThermalConductivityInput:String = "k(P)"
    var coolingRunningTimeInput:String = "RT(CLG)"
    var heatingRunningTimeInput:String = "RT(HTG)"
    var boreholeThermalResistanceResult: String = "R(B)"
    var coolingRunFractionResult: String = "F(C)"
    var heatingRunFractionResult: String = "F(H)"
    var boreholeShapeFactorResult: String = "S(B)"
    var groundThermalResistanceResult: String = "R(G)"
    var pipeWallThermalResistanceResult:String = "R(PP)"
    var groutThermalResistanceResult: String = "R(Grout)"
    var coolingBoreholeLengthResult: String = "L(C.T)"
    var heatingBoreholeLengthResult: String = "L(H.T)"
    var numberOfBoreholesInput: String = "Number of Boreholes"
    var minimumBoreholeInput: String = "Minimum Borehole Length"
    // initialize input data in second view controller(IGSHPAResultsViewController)
   
    @IBOutlet weak var scrollView: UIScrollView!

    @IBOutlet weak var VBConfigurationImage: UIImageView!
    
    @IBOutlet weak var boreholeLength: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize = CGSize(width: 600, height: 1200)
        
        VBConfigurationImage.image = UIImage(named: "IGSHPAVB1.jpg")
        
        
        var totalBoreholeLength: Double
        if coolingBoreholeLengthResult > heatingBoreholeLengthResult{
            totalBoreholeLength = Double(coolingBoreholeLengthResult)!
        }else{
            totalBoreholeLength = Double(heatingBoreholeLengthResult)!
        }
        if numberOfBoreholesInput.isEmpty == true{
            var no:Double = 1
            var length: Double = 90
            while(totalBoreholeLength / no) > 90{
            no += 1
            length = totalBoreholeLength / no
            length = ceil(length)
            }
            numberOfBoreholes.text = "Number of Boreholes: \(Int(no))"
            minimumBorehole.text = "Minimum Borehole Length: \(length) m"
            boreholeLength.text = "Minimum Borehole Length: \(length) m ✕ \(Int(no)) Boreholes"} else {
            numberOfBoreholes.text = "Number of Boreholes: \(numberOfBoreholesInput)"
            let no = Int(numberOfBoreholesInput)!
            let length:Int = (Int(totalBoreholeLength) / no)
            boreholeLength.text = "Minimum Borehole Length: \(length) m ✕ \(no) Boreholes"
            
        }
        
        
        inputHeatPumpHeating.text = "HC(D): \(heatPumpHeatingInput) kW"
        inputHeatPumpCooling.text = "TC(D): \(heatPumpCoolingInput) kW"
        inputCop.text = "COP(D): \(COPInput)"
        inputEnergyEfficient.text = "EER(D): \(energyEfficientRatioInput)"
        inputDeepEarthTemp.text = "T(G): \(deepEarthTempeartureInput) ℃"
        inputMinEnterTemp.text = "EWT(min): \(minEnteringWaterTempInput) ℃"
        inputMinLeaveTemp.text = "LWT(min): \(minLeavingWaterTempInput) ℃"
        inputMaxEnterTemp.text = "EWT(max): \(maxEnteringWaterTempInput) ℃"
        inputMaxLeaveTemp.text = "LWT(max): \(maxLeavingWaterTempInput) ℃"
        inputGroundThermalConductivity.text = "k(G): \(groundThermalConductivityInput) W/m ℃"
        inputGroundHeatTransferDiameter.text = "D(G,O): \(groundHeatTransferDiameterInput) m"
        inputBoreholeDiameter.text = "D(B): \(boreholeDiameterInput) m"
        inputPipeOuterDiameter.text = "D(P,O): \(pipeOuterDiameterInput) m"
        inputPipeInnerDiameter.text = "D(p,i): \(pipeInnerDiameterInput) m"
        inputGroutThermalConductivity.text = "k(Grout): \(groutThermalConductivityInput) W/m ℃"
        inputPipeThermalConductivity.text = "k(P): \(pipeThermalConductivityInput) W/m ℃"
        inputCoolingRunningTime.text = "RT(CLG): \(coolingRunningTimeInput) hr"
        inputHeatingRunningTime.text = "RT(HTG): \(heatingRunningTimeInput ) hr"
        resultBoreholeThermalResistance.text = "R(B): \(boreholeThermalResistanceResult) m ℃/W"
        resultCoolingRunFraction.text = "F(C): \(coolingRunFractionResult)"
        resultHeatingRunFraction.text = "F(H): \(heatingRunFractionResult)"
        resultBoreholeShapeFactor.text = "S(B): \(boreholeShapeFactorResult)"
        resultGroundThermalResistance.text = "R(G): \(groundThermalResistanceResult) m ℃/W"
        resultPipeWallThermalResistance.text = "R(PP): \(pipeWallThermalResistanceResult) m ℃/W"
        resultGroutThermalResistance.text = "R(Grout): \(groutThermalResistanceResult) m ℃/W"
        resultCoolingBoreholeLength.text = "L(C.T): \(coolingBoreholeLengthResult) m"
        resultHeatingBoreholeLength.text = "L(H.T): \(heatingBoreholeLengthResult) m"
            // receive the data from first view controller(IGSHPADataInputViewController)
        
        let cop = inputCop.text!
        let TCD = inputHeatPumpCooling.text!
        let HCD = inputHeatPumpHeating.text!
        let EERD = inputEnergyEfficient.text!
        let TG = inputDeepEarthTemp.text!
        let EWTmin = inputMinEnterTemp.text!
        let LWTmin = inputMinLeaveTemp.text!
        let EWTmax = inputMaxEnterTemp.text!
        let LWTmax = inputMaxLeaveTemp.text!
        let kG = inputGroundThermalConductivity.text!
        let DGO = inputGroundHeatTransferDiameter.text!
        let DB = inputBoreholeDiameter.text!
        let DPO = inputPipeOuterDiameter.text!
        let Dpi = inputPipeInnerDiameter.text!
        let kGrout = inputGroutThermalConductivity.text!
        let kp = inputPipeThermalConductivity.text!
        let RTCLG = inputCoolingRunningTime.text!
        let RTGTH = inputHeatingRunningTime.text!
        let RB = resultBoreholeThermalResistance.text!
        let FC = resultCoolingRunFraction.text!
        let FH = resultHeatingRunFraction.text!
        let SB = resultBoreholeShapeFactor.text!
        let RG = resultGroundThermalResistance.text!
        let RPP = resultPipeWallThermalResistance.text!
        let RGrout = resultGroutThermalResistance.text!
        let LCT = resultCoolingBoreholeLength.text!
        let LHT = resultHeatingBoreholeLength.text!


        
        
        let saveValues = NSMutableString()
        saveValues.append(cop)
        saveValues.append("\n")
        saveValues.append(TCD)
        saveValues.append("\n")
        saveValues.append(HCD)
        saveValues.append("\n")
        saveValues.append(EERD)
        saveValues.append("\n")
        saveValues.append(TG)
        saveValues.append("\n")
        saveValues.append(EWTmin)
        saveValues.append("\n")
        saveValues.append(LWTmin)
        saveValues.append("\n")
        saveValues.append(EWTmax)
        saveValues.append("\n")
        saveValues.append(LWTmax)
        saveValues.append("\n")
        saveValues.append(kG)
        saveValues.append("\n")
        saveValues.append(DGO)
        saveValues.append("\n")
        saveValues.append(DB)
        saveValues.append("\n")
        saveValues.append(DPO)
        saveValues.append("\n")
        saveValues.append(Dpi)
        saveValues.append("\n")
        saveValues.append(kGrout)
        saveValues.append("\n")
        saveValues.append(kp)
        saveValues.append("\n")
        saveValues.append(RTCLG)
        saveValues.append("\n")
        saveValues.append(RTGTH)
        saveValues.append("\n")
        saveValues.append(RB)
        saveValues.append("\n")
        saveValues.append(FC)
        saveValues.append("\n")
        saveValues.append(FH)
        saveValues.append("\n")
        saveValues.append(SB)
        saveValues.append("\n")
        saveValues.append(RG)
        saveValues.append("\n")
        saveValues.append(RPP)
        saveValues.append("\n")
        saveValues.append(RGrout)
        saveValues.append("\n")
        saveValues.append(LCT)
        saveValues.append("\n")
        saveValues.append(LHT)
        
        print(saveValues)
        
        UserDefaults.standard.set(saveValues, forKey: "saveVBValues")
 
    }
    
    @IBAction func saveAndEmail(_ sender: Any) {
        self.performSegue(withIdentifier: "saveAndEmail", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "saveAndEmail"{
            let informationMenu: UIViewController = segue.destination
            if let menu = informationMenu.popoverPresentationController{
                menu.delegate = self
            }
        }else if segue.identifier == "resultsInfo"{
            let dvc: IGSHPAResultsInfoViewController = segue.destination as! IGSHPAResultsInfoViewController
            dvc.popoverPresentationController?.delegate = self
        }
    }
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle
    {
        return UIModalPresentationStyle.none
    }
    // to make the menu's presentation style as a pop-over
    

    
    
}
