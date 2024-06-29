//
//  ASHRAEResultsViewController.swift
//  Geo
//
//  Created by Leon ZHANG on 14/04/2016.
//  Copyright © 2016 ZHANGLiangliang. All rights reserved.
//

import UIKit
class ASHRAEResultsViewController: UIViewController, UIPopoverPresentationControllerDelegate, UIScrollViewDelegate{
    
    @IBOutlet weak var inputLoopInnerRadius: UILabel!

    @IBOutlet weak var inputLoopOuterRadius: UILabel!
    @IBOutlet weak var inputBoreholeRadius: UILabel!
    @IBOutlet weak var inputGroundThermalConductivity: UILabel!
    @IBOutlet weak var inputGroutThermalConductivity: UILabel!
    @IBOutlet weak var inputULoopPipeThermalConductivity: UILabel!
    @IBOutlet weak var inputCentreDistanceBetweenPipes: UILabel!
    @IBOutlet weak var inputInternalConvectionCoefficient: UILabel!
    @IBOutlet weak var inputGroundThermalDiffusivity: UILabel!
    @IBOutlet weak var inputEnteringWaterTemp: UILabel!
    @IBOutlet weak var inputMassFlowRate: UILabel!
    @IBOutlet weak var inputGHEThermalCapacity: UILabel!
    @IBOutlet weak var inputDistanceBetweenBoreholes: UILabel!
    @IBOutlet weak var inputNumberOfBoreholes: UILabel!
    @IBOutlet weak var inputGeoAspectRatio: UILabel!
    @IBOutlet weak var inputUndisturbedGroundTemp: UILabel!
    @IBOutlet weak var inputYearAvgGroundLoad: UILabel!
    @IBOutlet weak var inputMonthGroundLoad: UILabel!
    @IBOutlet weak var inputHourGroundLoad: UILabel!
    @IBOutlet weak var resultOutletWaterTempCooling: UILabel!
    @IBOutlet weak var resultOutletWaterTempHeating: UILabel!
    @IBOutlet weak var resultMeanWaterTempCooling: UILabel!
    @IBOutlet weak var resultMeanWaterTempHeating: UILabel!
    @IBOutlet weak var resultDimensionlessTime: UILabel!
    @IBOutlet weak var resultCorrelationFunc: UILabel!
    @IBOutlet weak var resultTempPenaltyCooling: UILabel!
    @IBOutlet weak var resultTempPenaltyHeating: UILabel!
    @IBOutlet weak var resultTenyearResistance: UILabel!
    @IBOutlet weak var resultOnemonthResistance: UILabel!
    @IBOutlet weak var resultSixhourResistance: UILabel!
    @IBOutlet weak var resultInnerPipeConvectionResistance: UILabel!
    @IBOutlet weak var resultPipeConvectionResistance: UILabel!
    @IBOutlet weak var resultGroutResistance: UILabel!
    @IBOutlet weak var resultBoreholeResistance: UILabel!
    @IBOutlet weak var resultUndisturbedCoolingLength: UILabel!
    @IBOutlet weak var resultUndisturbedHeatingLength: UILabel!
    @IBOutlet weak var resultTotalCoolingBoreholeLength: UILabel!
    @IBOutlet weak var resultTotalHeatingBoreholeLength: UILabel!
    @IBOutlet weak var numberOfBoreholes: UILabel!
    @IBOutlet weak var minimumBorehole: UILabel!
    
    var loopInnerRadiusInput: String = "r(p,in)"
    var loopOuterRadiusInput: String = "r(p,ext)"
    var boreholeRadiusInput: String = "r(bore)"
    var groundThermalConductivityInput: String = "k"
    var groutThermalConductivityInput: String = "k(grout)"
    var ULoopPipeThermalConductivityInput: String = "k(pipe)"
    var centreDistanceBetweenPipesInput: String = "Lu"
    var internalConvectionCoefficientInput: String = "h(conv)"
    var groundThermalDiffusivityInput: String = "ɑ"
    var enteringWaterTempInput: String = "T(inHP)"
    var massFlowRateInput: String = "m(fls)"
    var GHEThermalCapacityInput: String = "Cp"
    var distanceBetweenBoreholesInput: String = "B"
    var numberOfBoreholesInput: String = "NB"
    var geoAspectRatioInput: String = "A"
    var undisturbedGroundTempInput: String = "Tg"
    var yearAvgGroundLoadInput: String = "q(y)"
    var monthGroundLoadInput: String = "q(m)"
    var hourGroundLoadInput: String = "q(h)"
    var outletWaterTempCoolingResult : String = "T(outCHP)"
    var outletWaterTempHeatingResult : String = "T(outHHP)"
    var meanWaterTempCoolingResult : String = "T(mc)"
    var meanWaterTempHeatingResult : String = "T(mh)"
    var dimensionlessTimeResult : String = "ln(t/ts)"
    var correlationFuncResult : String = "F"
    var tempPenaltyCoolingResult : String = "T(pc)"
    var tempPenaltyHeatingResult : String = "T(ph)"
    var tenyearResistanceResult : String = "R(10y)"
    var onemonthResistanceResult : String = "R(1m)"
    var sixhourResistanceResult : String = "R(6h)"
    var innerPipeConvectionResistanceResult : String = "R(conv)"
    var pipeConvectionResistanceResult : String = "R(p)"
    var groutResistanceResult : String = "R(grout)"
    var boreholeResistanceResult : String = "R(b)"
    var undisturbedCoolingLengthResult : String = "L(CU)"
    var undisturbedHeatingLengthResult : String = "L(HU)"
    var totalCoolingBoreholeLengthResult : String = "L(CT)"
    var totalHeatingBoreholeLengthResult : String = "L(HT)"
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    
    @IBOutlet weak var ASHRAEConfigurationImage: UIImageView!
    
    @IBOutlet weak var boreholeLength: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize = CGSize(width: 600,height: 5000)
        
        ASHRAEConfigurationImage.image = UIImage(named: "IGSHPAVB1.jpg")
        
        
        var totalBoreholeLength: Double
        if totalCoolingBoreholeLengthResult > totalHeatingBoreholeLengthResult{
            totalBoreholeLength = Double(totalCoolingBoreholeLengthResult)!
        }else{
            totalBoreholeLength = Double(totalHeatingBoreholeLengthResult)!
        }
        let no = Double(numberOfBoreholesInput)!
        let length = ceil(1000 * totalBoreholeLength / no)
        boreholeLength.text = "Minimum Borehole Length: \(length) m ✕ \(Int(no)) Boreholes"
        numberOfBoreholes.text = "Number of Boreholes: \(Int(no))"
        minimumBorehole.text = "Minimum Borehole Length: \(length) m"
        
        
        inputLoopInnerRadius.text = "r(p.in): \(loopInnerRadiusInput) m"
        inputLoopOuterRadius.text = "r(p.ext): \(loopOuterRadiusInput) m"
        inputBoreholeRadius.text = "r(bore): \(boreholeRadiusInput) m"
        inputGroundThermalConductivity.text = "k: \(groundThermalConductivityInput) W/m K"
        inputGroutThermalConductivity.text = "k(grout): \(groutThermalConductivityInput) W/m K"
        inputULoopPipeThermalConductivity.text = "k(pipe): \(ULoopPipeThermalConductivityInput) W/m K"
        inputCentreDistanceBetweenPipes.text = "Lu: \(centreDistanceBetweenPipesInput) m"
        inputInternalConvectionCoefficient.text = "h(conv): \(internalConvectionCoefficientInput) W/m² K"
        inputGroundThermalDiffusivity.text = "ɑ: \(groundThermalDiffusivityInput) m²/day"
        inputEnteringWaterTemp.text = "T(inHP): \(enteringWaterTempInput) ℃"
        inputMassFlowRate.text = "m(fls): \(massFlowRateInput) kg/s kW"
        inputGHEThermalCapacity.text = "Cp: \(GHEThermalCapacityInput) J/kg K"
        inputDistanceBetweenBoreholes.text = "B: \(distanceBetweenBoreholesInput) m"
        inputNumberOfBoreholes.text = "NB: \(numberOfBoreholesInput)"
        inputGeoAspectRatio.text = "A: \(geoAspectRatioInput)"
        inputUndisturbedGroundTemp.text = "Tg: \(undisturbedGroundTempInput) ℃"
        inputYearAvgGroundLoad.text = "q(y): \(yearAvgGroundLoadInput) kW"
        inputMonthGroundLoad.text = "q(m): \(monthGroundLoadInput) kW"
        inputHourGroundLoad.text = "q(h): \(hourGroundLoadInput) kW"
        resultOutletWaterTempCooling.text = "T(outCHP): \(outletWaterTempCoolingResult) ℃"
        resultOutletWaterTempHeating.text = "T(outHHP): \(outletWaterTempHeatingResult) ℃"
        resultMeanWaterTempCooling.text = "T(mc): \(meanWaterTempCoolingResult) ℃"
        resultMeanWaterTempHeating.text = "T(mh): \(meanWaterTempHeatingResult) ℃"
        resultDimensionlessTime.text = "ln(t/ts): \(dimensionlessTimeResult)"
        resultCorrelationFunc.text = "F: \(correlationFuncResult)"
        resultTempPenaltyCooling.text = "T(pc): \(tempPenaltyCoolingResult) ℃"
        resultTempPenaltyHeating.text = "T(ph): \(tempPenaltyHeatingResult) ℃"
        resultTenyearResistance .text = "R(10y): \(tenyearResistanceResult) m K/W"
        resultOnemonthResistance.text = "R(1m): \(onemonthResistanceResult) m K/W"
        resultSixhourResistance.text = "R(6h): \(sixhourResistanceResult) m K/W"
        resultInnerPipeConvectionResistance .text = "R(conv): \(innerPipeConvectionResistanceResult) m K/W"
        resultPipeConvectionResistance .text = "R(p): \(pipeConvectionResistanceResult) m K/W"
        resultGroutResistance .text = "R(grout): \(groutResistanceResult) m K/W"
        resultBoreholeResistance .text = "R(b): \(boreholeResistanceResult) m K/W"
        resultUndisturbedCoolingLength .text = "L(CU): \(undisturbedCoolingLengthResult) km"
        resultUndisturbedHeatingLength .text = "L(HU): \(undisturbedHeatingLengthResult) km"
        resultTotalCoolingBoreholeLength .text = "L(CT): \(totalCoolingBoreholeLengthResult) km"
        resultTotalHeatingBoreholeLength .text = "L(HT): \(totalHeatingBoreholeLengthResult) km"
        
        let rpin = inputLoopInnerRadius.text!
        let rpext = inputLoopOuterRadius.text!
        let rbore = inputBoreholeRadius.text!
        let k = inputGroundThermalConductivity.text!
        let kgrout = inputGroutThermalConductivity.text!
        let kpipe = inputULoopPipeThermalConductivity.text!
        let Lu = inputCentreDistanceBetweenPipes.text!
        let hconv = inputInternalConvectionCoefficient.text!
        let alpha = inputGroundThermalDiffusivity.text!
        let TinHP = inputEnteringWaterTemp.text!
        let mfls = inputMassFlowRate.text!
        let Cp = inputGHEThermalCapacity.text!
        let B = inputDistanceBetweenBoreholes.text!
        let NB = inputNumberOfBoreholes.text!
        let A = inputGeoAspectRatio.text!
        let Tg = inputUndisturbedGroundTemp.text!
        let qy = inputYearAvgGroundLoad.text!
        let qm = inputMonthGroundLoad.text!
        let qh = inputHourGroundLoad.text!
        let ToutCHP = resultOutletWaterTempCooling.text!
        let ToutHHP = resultOutletWaterTempHeating.text!
        let Tmc = resultMeanWaterTempCooling.text!
        let Tmh = resultMeanWaterTempHeating.text!
        let lnt_ts = resultDimensionlessTime.text!
        let F = resultCorrelationFunc.text!
        let Tpc = resultTempPenaltyCooling.text!
        let Tph = resultTempPenaltyHeating.text!
        let R10y = resultTenyearResistance.text!
        let R1m = resultOnemonthResistance.text!
        let R6h = resultSixhourResistance.text!
        let Rconv = resultInnerPipeConvectionResistance.text!
        let Rp = resultPipeConvectionResistance.text!
        let Rgourt = resultGroutResistance.text!
        let Rb = resultBoreholeResistance .text!
        let LCU = resultUndisturbedCoolingLength .text!
        let LHU = resultUndisturbedHeatingLength .text!
        let LCT = resultTotalCoolingBoreholeLength .text!
        let LHT = resultTotalHeatingBoreholeLength .text!
        
        let saveValues = NSMutableString()
        saveValues.append(rpin)
        saveValues.append("\n")
        saveValues.append(rpext)
        saveValues.append("\n")
        saveValues.append(rbore)
        saveValues.append("\n")
        saveValues.append(k)
        saveValues.append("\n")
        saveValues.append(kgrout)
        saveValues.append("\n")
        saveValues.append(kpipe)
        saveValues.append("\n")
        saveValues.append(Lu)
        saveValues.append("\n")
        saveValues.append(hconv)
        saveValues.append("\n")
        saveValues.append(alpha)
        saveValues.append("\n")
        saveValues.append(TinHP)
        saveValues.append("\n")
        saveValues.append(mfls)
        saveValues.append("\n")
        saveValues.append(Cp)
        saveValues.append("\n")
        saveValues.append(B)
        saveValues.append("\n")
        saveValues.append(NB)
        saveValues.append("\n")
        saveValues.append(A)
        saveValues.append("\n")
        saveValues.append(Tg)
        saveValues.append("\n")
        saveValues.append(qy)
        saveValues.append("\n")
        saveValues.append(qm)
        saveValues.append("\n")
        saveValues.append(qh)
        saveValues.append("\n")
        saveValues.append(ToutCHP)
        saveValues.append("\n")
        saveValues.append(ToutHHP)
        saveValues.append("\n")
        saveValues.append(Tmc)
        saveValues.append("\n")
        saveValues.append(Tmh)
        saveValues.append("\n")
        saveValues.append(lnt_ts)
        saveValues.append("\n")
        saveValues.append(F)
        saveValues.append("\n")
        saveValues.append(Tpc)
        saveValues.append("\n")
        saveValues.append(Tph)
        saveValues.append("\n")
        saveValues.append(R10y)
        saveValues.append("\n")
        saveValues.append(R1m)
        saveValues.append("\n")
        saveValues.append(R6h)
        saveValues.append("\n")
        saveValues.append(Rconv)
        saveValues.append("\n")
        saveValues.append(Rp)
        saveValues.append("\n")
        saveValues.append(Rgourt)
        saveValues.append("\n")
        saveValues.append(Rb)
        saveValues.append("\n")
        saveValues.append(LCU)
        saveValues.append("\n")
        saveValues.append(LHU)
        saveValues.append("\n")
        saveValues.append(LCT)
        saveValues.append("\n")
        saveValues.append(LHT)
        
        UserDefaults.standard.set(saveValues, forKey: "saveASHRAEValues")

    }
    
    @IBAction func saveAndEmail(_ sender: Any) {
         self.performSegue(withIdentifier: "ASHRAESaveAndShare", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ASHRAESaveAndShare"{
            let informationMenu: UIViewController = segue.destination
            if let menu = informationMenu.popoverPresentationController{
                menu.delegate = self
            }
        }else if segue.identifier == "resultsInfo"{
            let dvc: ASHRAEResultsInfoViewController = segue.destination as! ASHRAEResultsInfoViewController
            dvc.popoverPresentationController?.delegate = self
        }
    }
    
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle
    {
        return UIModalPresentationStyle.none
    }
    // to make the menu's presentation style as a pop-over
}
