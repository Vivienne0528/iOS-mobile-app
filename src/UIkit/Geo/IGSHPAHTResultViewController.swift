//
//  IGSHPAHTResultViewController.swift
//  PreGeo
//
//  Created by Leon ZHANG on 16/05/2016.
//  Copyright © 2016 ZHANGLiangliang. All rights reserved.
//

import UIKit
class IGSHPAHTResultViewController: UIViewController , UIPopoverPresentationControllerDelegate, UIScrollViewDelegate {
    
    @IBOutlet weak var inputCop: UILabel!
    @IBOutlet weak var inputHeatPumpCooling: UILabel!
    @IBOutlet weak var inputHeatPumpHeating: UILabel!
    @IBOutlet weak var inputEnergyEfficient: UILabel!
    @IBOutlet weak var inputMeanEarthTemp: UILabel!
    @IBOutlet weak var inputMinEnterTemp: UILabel!
    @IBOutlet weak var inputMinLeaveTemp: UILabel!
    @IBOutlet weak var inputMaxEnterTemp: UILabel!
    @IBOutlet weak var inputMaxLeaveTemp: UILabel!
    @IBOutlet weak var inputSoilResistance: UILabel!
    @IBOutlet weak var inputTrenchSpaceMulti: UILabel!
    @IBOutlet weak var inputPipeDiameterMulti: UILabel!
    @IBOutlet weak var inputPipeOuterDiameter: UILabel!
    @IBOutlet weak var inputPipeInnerDiameter: UILabel!
    @IBOutlet weak var inputPipeThermalConductivity: UILabel!
    @IBOutlet weak var inputCoolingRunningTime: UILabel!
    @IBOutlet weak var inputHeatingRunningTime: UILabel!
    @IBOutlet weak var inputAvgPipeDepth: UILabel!
    @IBOutlet weak var inputSurfaceTempAmplitude: UILabel!
    @IBOutlet weak var inputSoilThermalDiffusivity:UILabel!
    
    @IBOutlet weak var resultCoolingRunFraction:UILabel!
    @IBOutlet weak var resultHeatingRunFraction: UILabel!
    @IBOutlet weak var resultPipeThermalResistance:UILabel!

    @IBOutlet weak var resultDesignCoolingEarthTemp: UILabel!
    @IBOutlet weak var resultDesignHeatingEarthTemp: UILabel!
    @IBOutlet weak var resultCoolingBoreholeLength: UILabel!
    @IBOutlet weak var resultHeatingBoreholeLength: UILabel!
    @IBOutlet weak var numberOfTrenches: UILabel!
    @IBOutlet weak var numberOfPipesInTrench: UILabel!
    @IBOutlet weak var minimumTrench: UILabel!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    var heatPumpHeatingInput:String = "TC(D)"
    var heatPumpCoolingInput:String = "HC(D)"
    var COPInput:String = "COP(D)"
    var energyEfficientRatioInput:String = "EER(D)"
    var meanEarthTempeartureInput:String = "T(M)"
    var minEnteringWaterTempInput:String = "EWT(min)"
    var minLeavingWaterTempInput:String = "LWT(min)"
    var maxEnteringWaterTempInput:String = "EWT(max)"
    var maxLeavingWaterTempInput:String = "LWT(max)"
    var soilResistanceInput:String = "R(s)"
    var trenchSpaceMultiInput:String = "S(M)"
    var pipeDiameterMultiInput:String = "P(M)"
    var pipeOuterDiameterInput:String = "D(P,O)"
    var pipeInnerDiameterInput:String = "D(p,i)"
    var pipeThermalConductivityInput:String = "k(P)"
    var coolingRunningTimeInput:String = "RT(CLG)"
    var heatingRunningTimeInput:String = "RT(HTG)"
    var avgPipeDepthInput:String = "d"
    var surfaceTempAmplitudeInput: String = "AS"
    var soilThermalDiffusivityInput: String = "ɑ"
    var coolingRunFractionResult: String = "F(C)"
    var heatingRunFractionResult: String = "F(H)"
    var pipeThermalResistanceResult:String = "R(P)"
    var designCoolingEarthTempResult: String = "T(S,H)"
    var designHeatingEarthTempResult:String = "T(S,L)"
    var coolingBoreholeLengthResult: String = "L(C.T)"
    var heatingBoreholeLengthResult: String = "L(H.T)"
    var numberOfTrenchesInput: String = "Number of Trenches"
    var numberOfPipesInTrenchInput: String = "Number of Pipes in Trench"
    var minimumTrenchInput: String = "Minimum Trench Length"
    // initialize input data in second view controller(IGSHPAResultsViewController)
    
    @IBOutlet weak var boreholeLength: UILabel!
    @IBOutlet weak var HTConfigurationImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize = CGSize(width: 600, height: 5000)
        
        HTConfigurationImage.image = UIImage(named: "IGSHPAHT1.jpg")
        var totalBoreholeLength: Double
        if coolingBoreholeLengthResult > heatingBoreholeLengthResult{
            totalBoreholeLength = Double(coolingBoreholeLengthResult)!
        }else{
            totalBoreholeLength = Double(heatingBoreholeLengthResult)!
        }
        if numberOfTrenchesInput.isEmpty == true{
            var noT:Double = 1
            var noP:Double = 1
            var length: Double = 90
            if numberOfPipesInTrenchInput.isEmpty == true{
            while(totalBoreholeLength / (noT * noP)) > 90{
                if noT < 5{
                    noT += 1}else{
                    noP += 1
                }
                length = totalBoreholeLength / (noT * noP)
                length = ceil(length)
            }
            numberOfTrenches.text = "Number of Trenches: \(Int(noT))"
            minimumTrench.text = "Minimum Trench Length: \(length) m"
            numberOfPipesInTrench.text = "Number of Pipes in Each Trench: \(Int(noP))"
                boreholeLength.text = "Minimum Trench Length: \(length) m ✕ \(Int(noP)) Pipes in \(Int(noT)) Trenches"
            }else{
                noP = Double(numberOfPipesInTrenchInput)!
          numberOfPipesInTrench.text = "Number of Pipes in Each Trench: \(Int(noP))"
                while(totalBoreholeLength / (noT * noP)) > 90{
                    noT += 1
                    length = totalBoreholeLength / (noT * noP)
                    length = ceil(length)
                }
             numberOfTrenches.text = "Number of Trenches: \(Int(noT))"
             minimumTrench.text = "Minimum Trench Length: \(length) m"
                boreholeLength.text = "Minimum Trench Length: \(length) m ✕ \(Int(noP)) Pipes in \(Int(noT)) Trenches"
            }
            }else {
            let noT = Double(numberOfTrenchesInput)!
            if numberOfPipesInTrenchInput.isEmpty == true{
                var noP:Double = 1
                var length: Double = 90
                while(totalBoreholeLength / (noT * noP)) > 90{
                    noP += 1
                    length = totalBoreholeLength / (noT * noP)
                    length = ceil(length)
                }
                numberOfTrenches.text = "Number of Trenches: \(Int(noT))"
                minimumTrench.text = "Minimum Trench Length: \(length) m"
                numberOfPipesInTrench.text = "Number of Pipes in Each Trench: \(Int(noP))"
                boreholeLength.text = "Minimum Trench Length: \(length) m ✕ \(Int(noP)) Pipes in \(Int(noT)) Trenches"
            }else{
               let noP = Double(numberOfPipesInTrenchInput)!
                numberOfPipesInTrench.text = "Number of Pipes in Each Trench: \(Int(noP))"
                var length = totalBoreholeLength / (noT * noP)
                length = ceil(length)
                
                numberOfTrenches.text = "Number of Trenches: \(Int(noT))"
                minimumTrench.text = "Minimum Trench Length: \(length) m"
                boreholeLength.text = "Minimum Trench Length: \(length) m ✕ \(Int(noP)) Pipes in \(Int(noT)) Trenches"
            }
        }

        
        
        inputHeatPumpHeating.text = "TC(D): \(heatPumpCoolingInput) kW"
        inputHeatPumpCooling.text = "HC(D): \(heatPumpHeatingInput) kW"
        inputCop.text = "COP(D): \(COPInput)"
        inputEnergyEfficient.text = "EER(D): \(energyEfficientRatioInput)"
        inputMeanEarthTemp.text = "T(M): \(meanEarthTempeartureInput) ℃"
        inputMinEnterTemp.text = "EWT(min): \(minEnteringWaterTempInput) ℃"
        inputMinLeaveTemp.text = "LWT(min): \(minLeavingWaterTempInput) ℃"
        inputMaxEnterTemp.text = "EWT(max): \(maxEnteringWaterTempInput) ℃"
        inputMaxLeaveTemp.text = "LWT(max): \(maxLeavingWaterTempInput) ℃"
        inputSoilResistance.text = "R(s): \(soilResistanceInput) m ℃/W"
        inputTrenchSpaceMulti.text = "S(M): \(trenchSpaceMultiInput)"
        inputPipeDiameterMulti.text = "P(M): \(pipeDiameterMultiInput)"
        inputPipeOuterDiameter.text = "D(P,O): \(pipeOuterDiameterInput) m"
        inputPipeInnerDiameter.text = "D(p,i): \(pipeInnerDiameterInput) m"
        inputPipeThermalConductivity.text = "k(P): \(pipeThermalConductivityInput) W/m ℃"
        inputCoolingRunningTime.text = "RT(CLG): \(coolingRunningTimeInput) hr"
        inputHeatingRunningTime.text = "RT(HTG): \(heatingRunningTimeInput ) hr"
        inputAvgPipeDepth.text = "d: \(avgPipeDepthInput) m"
        inputSoilThermalDiffusivity.text = "ɑ: \(soilThermalDiffusivityInput) m²/day"
        inputSurfaceTempAmplitude.text = "AS: \(surfaceTempAmplitudeInput) ℃"
        resultCoolingRunFraction.text = "F(C): \(coolingRunFractionResult)"
        resultHeatingRunFraction.text = "F(H): \(heatingRunFractionResult)"
        resultPipeThermalResistance.text = "R(P): \(pipeThermalResistanceResult) m ℃/W"
        resultDesignCoolingEarthTemp.text = "T(S,H): \(designCoolingEarthTempResult) ℃"
        resultDesignHeatingEarthTemp.text = "T(S,L): \(designHeatingEarthTempResult) ℃"
        resultCoolingBoreholeLength.text = "L(C.P): \(coolingBoreholeLengthResult) m"
        resultHeatingBoreholeLength.text = "L(H.P): \(heatingBoreholeLengthResult) m"
        // receive the data from first view controller(IGSHPADataInputViewController)
        
        let cop = inputCop.text!
        let TCD = inputHeatPumpCooling.text!
        let HCD = inputHeatPumpHeating.text!
        let EERD = inputEnergyEfficient.text!
        let TM = inputMeanEarthTemp.text!
        let EWTmin = inputMinEnterTemp.text!
        let LWTmin = inputMinLeaveTemp.text!
        let EWTmax = inputMaxEnterTemp.text!
        let LWTmax = inputMaxLeaveTemp.text!
        let Rs = inputSoilResistance.text!
        let SM = inputTrenchSpaceMulti.text!
        let PM = inputPipeDiameterMulti.text!
        let DPO = inputPipeOuterDiameter.text!
        let Dpi = inputPipeInnerDiameter.text!
        let kp = inputPipeThermalConductivity.text!
        let RTCLG = inputCoolingRunningTime.text!
        let RTGTH = inputHeatingRunningTime.text!
        let d = inputAvgPipeDepth.text!
        let AS = inputSurfaceTempAmplitude.text!
        let alpha = inputSoilThermalDiffusivity.text!
        let FC = resultCoolingRunFraction.text!
        let FH = resultHeatingRunFraction.text!
        let RP = resultPipeThermalResistance.text!
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
        saveValues.append(TM)
        saveValues.append("\n")
        saveValues.append(EWTmin)
        saveValues.append("\n")
        saveValues.append(LWTmin)
        saveValues.append("\n")
        saveValues.append(EWTmax)
        saveValues.append("\n")
        saveValues.append(LWTmax)
        saveValues.append("\n")
        saveValues.append(Rs)
        saveValues.append("\n")
        saveValues.append(SM)
        saveValues.append("\n")
        saveValues.append(PM)
        saveValues.append("\n")
        saveValues.append(DPO)
        saveValues.append("\n")
        saveValues.append(Dpi)
        saveValues.append("\n")
        saveValues.append(kp)
        saveValues.append("\n")
        saveValues.append(RTCLG)
        saveValues.append("\n")
        saveValues.append(RTGTH)
        saveValues.append("\n")
        saveValues.append(FC)
        saveValues.append("\n")
        saveValues.append(FH)
        saveValues.append("\n")
        saveValues.append(RP)
        saveValues.append("\n")
        saveValues.append(LCT)
        saveValues.append("\n")
        saveValues.append(LHT)
        saveValues.append("\n")
        saveValues.append(d)
        saveValues.append("\n")
        saveValues.append(AS)
        saveValues.append("\n")
        saveValues.append(alpha)
        
        
        UserDefaults.standard.set(saveValues, forKey: "saveHTValues")
        
    }
    
    @IBAction func saveAndEmail(_ sender: Any) {
        self.performSegue(withIdentifier: "HTsaveAndEmail", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "HTsaveAndEmail"{
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
