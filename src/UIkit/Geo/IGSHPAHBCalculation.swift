//
//  IGSHPAHBCalculation.swift
//  PreGeo
//
//  Created by Leon ZHANG on 15/05/2016.
//  Copyright © 2016 ZHANGLiangliang. All rights reserved.
//

import Foundation
class IGSHPAHBCalculation {
    var heatPumpHeatingCapacity: Double
    var heatPumpCoolingCapacity:Double
    var coefficientOfPerformance: Double
    var energyEfficientRatio: Double
    var meanEarthTempearture:Double
    var minEnteringWaterTemp: Double
    var minLeavingWaterTemp: Double
    var maxEnteringWaterTemp: Double
    var maxLeavingWaterTemp: Double
    var groundThermalConductivity: Double
    var groundHeatTransferDiameter: Double
    var boreholeDiameter: Double
    var pipeOuterDiameter: Double
    var pipeInnerDiameter: Double
    var groutThermalConductivity: Double
    var pipeThermalConductivity: Double
    var coolingRunningTime: Double
    var heatingRunningTime: Double
    var avgPipeDepth: Double
    var surfaceTempAmplitude : Double
    var soilThermalDiffusivity: Double
    
    var groundThermalResistanceE: Double{
        get{
            return ((log(groundHeatTransferDiameter / boreholeDiameter)) / (2 * Double.pi * groundThermalConductivity / 1.73))
        }
    }
    var groundThermalResistance: Double{
        get{
            return ((log(groundHeatTransferDiameter / boreholeDiameter)) / (2 * Double.pi * groundThermalConductivity / 1.73)) / 1.73
        }
    }
    
    var boreholeShapeFactor: Double{
        get{
            var boreholePipeOuterDiamterRatio: Double{
                return (boreholeDiameter / pipeOuterDiameter)
            }
            return (((17.44 * pow(boreholePipeOuterDiamterRatio,-0.6025)) + (21.91 * pow(boreholePipeOuterDiamterRatio,-0.3796))) / 2)
        }
    }
    
    var groutThermalResistanceE: Double{
        get{
            return (1 / (boreholeShapeFactor * (groutThermalConductivity / 1.73)))
        }
    }
    var groutThermalResistance: Double{
        get{
            return (1 / (boreholeShapeFactor * (groutThermalConductivity / 1.73))) / 1.73
        }
    }
    
    var pipeWallThermalResistanceE: Double{
        get{
            return ((log(pipeOuterDiameter  / pipeInnerDiameter) / (2 * Double.pi * (pipeThermalConductivity / 1.73))) / 2)
        }
    }
    var pipeWallThermalResistance: Double{
        get{
            return ((log(pipeOuterDiameter  / pipeInnerDiameter) / (2 * Double.pi * (pipeThermalConductivity / 1.73))) / 2) / 1.73
        }
    }
    
    var boreholeThermalResistanceE: Double{
        get{
            return (groutThermalResistanceE + pipeWallThermalResistanceE)
        }
    }
    
    var boreholeThermalResistance: Double{
        get{
            return (groutThermalResistanceE + pipeWallThermalResistanceE) / 1.73
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
            
            return (-exp((-avgPipeDepth * 0.305) * pow(Constant, 0.5))) * cos((2 * Double.pi / 365) * ((-avgPipeDepth * 0.305) / 2) * pow( 365 / (Double.pi * soilThermalDiffusivity * 0.093), 0.5)) * (surfaceTempAmplitude * 1.8 + 32) + meanEarthTempeartureE
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
            return (((heatPumpHeatingCapacity * 1000 / 0.293) * ((coefficientOfPerformance - 1) / coefficientOfPerformance) * (boreholeThermalResistanceE + groundThermalResistanceE * heatingRunFraction)) / (designHeatingEarthTempE - (((minEnteringWaterTemp * 1.8 + 32) + (minLeavingWaterTemp * 1.8 + 32)) / 2))) * 0.305
        }
    }
    
    var coolingBoreholeLength: Double {
        get {
            return (((heatPumpCoolingCapacity * 1000 / 0.293) * ((energyEfficientRatio + 3.412) / energyEfficientRatio) * (boreholeThermalResistanceE + groundThermalResistanceE * coolingRunFraction)) / ( (((maxEnteringWaterTemp * 1.8 + 32) + (maxLeavingWaterTemp * 1.8 + 32)) / 2) - designCoolingEarthTempE)) * 0.305
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
        , groundThermalConductivity: Double
        , groudHeatTransferDiameter: Double
        , boreholeDiameter: Double
        , pipeOuterDiameter: Double
        , pipeInnerDiameter: Double
        , groutThermalConductivity: Double
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
        self.groundThermalConductivity = groundThermalConductivity
        self.groundHeatTransferDiameter = groudHeatTransferDiameter
        self.boreholeDiameter = boreholeDiameter
        self.pipeOuterDiameter = pipeOuterDiameter
        self.pipeInnerDiameter = pipeInnerDiameter
        self.groutThermalConductivity = groundThermalConductivity
        self.pipeThermalConductivity = pipeThermalConductivity
        self.coolingRunningTime = coolingRunningTime
        self.heatingRunningTime = heatingRunningTime
        self.avgPipeDepth = avgPipeDepth
        self.surfaceTempAmplitude = surfaceTempAmplitude
        self.soilThermalDiffusivity = soilThermalDiffusivity
    }
}
