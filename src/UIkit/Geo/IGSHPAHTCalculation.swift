//
//  IGSHPAHTCalculation.swift
//  PreGeo
//
//  Created by Leon ZHANG on 16/05/2016.
//  Copyright © 2016 ZHANGLiangliang. All rights reserved.
//

import Foundation
class IGSHPAHTCalculation {
    var heatPumpHeatingCapacity: Double
    var heatPumpCoolingCapacity:Double
    var coefficientOfPerformance: Double
    var energyEfficientRatio: Double
    var meanEarthTempearture:Double
    var minEnteringWaterTemp: Double
    var minLeavingWaterTemp: Double
    var maxEnteringWaterTemp: Double
    var maxLeavingWaterTemp: Double
    var soilResistance: Double
    var trenchSpaceMulti: Double
    var pipeDiameterMulti: Double
    var pipeOuterDiameter: Double
    var pipeInnerDiameter: Double
    var pipeThermalConductivity: Double
    var coolingRunningTime: Double
    var heatingRunningTime: Double
    var avgPipeDepth: Double
    var surfaceTempAmplitude : Double
    var soilThermalDiffusivity: Double
    


    

    
    var pipeThermalResistanceE: Double{
        get{
            return ((log(pipeOuterDiameter  / pipeInnerDiameter) / (2 * Double.pi * (pipeThermalConductivity / 1.73))))
        }
    }
    
    var pipeThermalResistance: Double{
        get{
            return pipeThermalResistanceE * 1.73
        }
    }
    
    
    var coolingRunFraction:Double{
        get{
            return (coolingRunningTime / 744)
        }
    }
    
    var heatingRunFraction:Double{
        get{
            return (heatingRunningTime / 744)
        }
    }
    
    var meanEarthTempeartureE: Double{
        get {
            return (meanEarthTempearture * 1.8 + 32)
        }
    }
    
    var surfaceTempAmplitudeE:Double{
        get{
            return (surfaceTempAmplitude * 1.8 + 32)
        }
    }
    
    var Constant: Double
        {
        get{
            return (Double.pi / (365 * soilThermalDiffusivity * 0.093))
        }
    }
    
    var expValue: Double{
        get{
            var exp1:Double {
                return (-avgPipeDepth * 0.305)
            }
            
            return (-exp(exp1 * pow(Constant, 0.5)))
        }
    }
    
    var designHeatingEarthTempE:Double{
        get{
            
            return -exp((-avgPipeDepth * 0.305) * pow(Constant, 0.5)) * cos((2 * Double.pi / 365) * ((-avgPipeDepth * 0.305) / 2) * pow( 365 / (Double.pi * soilThermalDiffusivity * 0.093), 0.5)) * (surfaceTempAmplitude * 1.8 + 32) + meanEarthTempeartureE
        }
    }
    
    var designHeatingEarthTemp:Double{
        get{
            
            return (designHeatingEarthTempE - 32) / 1.8
        }
    }
    
    
    
    var cosValue:Double{
        get{
            return cos((2 * Double.pi / 365) * (180 - (avgPipeDepth * 0.305 / 2) * pow( 365 / (Double.pi * soilThermalDiffusivity * 0.093), 0.5)))
        }
    }
    
    var designCoolingEarthTempE:Double{
        get{
            
            return expValue * cosValue * surfaceTempAmplitudeE + meanEarthTempeartureE
        }
    }
    
    var designCoolingEarthTemp:Double{
        get{
            
            return (designCoolingEarthTempE - 32) / 1.8
        }
    }
    
    
    
    var heatingBoreholeLength: Double {
        get {
            return (((heatPumpHeatingCapacity * 1000 / 0.293) * ((coefficientOfPerformance - 1) / coefficientOfPerformance) * (pipeThermalResistanceE + (soilResistance / 1.73) * heatingRunFraction * pipeDiameterMulti * trenchSpaceMulti)) / (designHeatingEarthTempE - (((minEnteringWaterTemp * 1.8 + 32) + (minLeavingWaterTemp * 1.8 + 32)) / 2))) * 0.305
        }
    }
    
    var coolingBoreholeLength: Double {
        get {
            return (((heatPumpCoolingCapacity * 1000 / 0.293) * ((energyEfficientRatio + 3.412) / energyEfficientRatio) * (pipeThermalResistanceE + (soilResistance / 1.73) * heatingRunFraction * pipeDiameterMulti * trenchSpaceMulti)) / ( (((maxEnteringWaterTemp * 1.8 + 32) + (maxLeavingWaterTemp * 1.8 + 32)) / 2) - designCoolingEarthTempE)) * 0.305
        }
    }
    
    init(heatPumpHeatingCapacity: Double
        , heatPumpCoolingCapacity:Double
        , coefficientOfPerformance: Double
        , energyEfficientRatio: Double
        , meanEarthTempearture:Double
        , minEnteringWaterTemp: Double
        , minLeavingWaterTemp: Double
        , maxEnteringWaterTemp: Double
        , maxLeavingWaterTemp: Double
        , soilResistance: Double
        , trenchSpaceMulti: Double
        , pipeDiameterMulti: Double
        , pipeOuterDiameter: Double
        , pipeInnerDiameter: Double
        , pipeThermalConductivity: Double
        , coolingRunningTime: Double
        , heatingRunningTime: Double,     avgPipeDepth: Double, surfaceTempAmplitude: Double, soilThermalDiffusivity: Double){
        self.heatPumpHeatingCapacity = heatPumpHeatingCapacity
        self.heatPumpCoolingCapacity = heatPumpCoolingCapacity
        self.coefficientOfPerformance = coefficientOfPerformance
        self.energyEfficientRatio = energyEfficientRatio
        self.meanEarthTempearture = meanEarthTempearture
        self.minEnteringWaterTemp = minEnteringWaterTemp
        self.minLeavingWaterTemp = minLeavingWaterTemp
        self.maxEnteringWaterTemp = maxEnteringWaterTemp
        self.maxLeavingWaterTemp = maxLeavingWaterTemp
        self.soilResistance = soilResistance
        self.trenchSpaceMulti = trenchSpaceMulti
        self.pipeDiameterMulti = pipeDiameterMulti
        self.pipeOuterDiameter = pipeOuterDiameter
        self.pipeInnerDiameter = pipeInnerDiameter
        self.pipeThermalConductivity = pipeThermalConductivity
        self.coolingRunningTime = coolingRunningTime
        self.heatingRunningTime = heatingRunningTime
        self.avgPipeDepth = avgPipeDepth
        self.surfaceTempAmplitude = surfaceTempAmplitude
        self.soilThermalDiffusivity = soilThermalDiffusivity
    }
}
