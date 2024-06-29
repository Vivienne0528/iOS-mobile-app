//
//  calculation.swift
//  Geo
//
//  Created by Leon ZHANG on 24/03/2016.
//  Copyright © 2016 ZHANGLiangliang. All rights reserved.
//

import Foundation

class IGSHPAVerticallyBoredCalculation{
    
    var heatPumpHeatingCapacity: Double
    var heatPumpCoolingCapacity:Double
    var coefficientOfPerformance: Double
    var energyEfficientRatio: Double
    var deepEarthTempearture:Double
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

    var groundThermalResistanceE: Double{
        get{
            return ((log(groundHeatTransferDiameter / boreholeDiameter)) / (2 * Double.pi * groundThermalConductivity / 1.73))
        }
    }
    var groundThermalResistance: Double{
        get{
            return  groundThermalResistanceE / 1.73
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
            return groutThermalResistanceE / 1.73
        }
    }
    
    var pipeWallThermalResistanceE: Double{
        get{
            return ((log(pipeOuterDiameter  / pipeInnerDiameter) / (2 * Double.pi * (pipeThermalConductivity / 1.73))) / 2)
        }
    }
    
    var pipeWallThermalResistance: Double{
        get{
            return pipeWallThermalResistanceE / 1.73
        }
    }
    
    var boreholeThermalResistanceE: Double{
        get{
            return (groutThermalResistanceE + pipeWallThermalResistanceE)
        }
    }
    var boreholeThermalResistance: Double{
        get{
            return boreholeThermalResistanceE / 1.73
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
    
    
    var heatingBoreholeLength: Double {
        get {
            return (((heatPumpHeatingCapacity * 1000 / 0.293) * ((coefficientOfPerformance - 1) / coefficientOfPerformance) * (boreholeThermalResistanceE + groundThermalResistanceE * heatingRunFraction)) / ((deepEarthTempearture * 1.8 + 32) - (((minEnteringWaterTemp * 1.8 + 32) + (minLeavingWaterTemp * 1.8 + 32)) / 2))) * 0.305
        }
    }
    
    var coolingBoreholeLength: Double {
        get {
            return (((heatPumpCoolingCapacity * 1000 / 0.293) * ((energyEfficientRatio + 3.412) / energyEfficientRatio) * (boreholeThermalResistanceE + groundThermalResistanceE * coolingRunFraction)) / ( (((maxEnteringWaterTemp * 1.8 + 32) + (maxLeavingWaterTemp * 1.8 + 32)) / 2) - (deepEarthTempearture * 1.8 + 32))) * 0.305
        }
    }
    
    init(heatPumpHeatingCapacity: Double
    , heatPumpCoolingCapacity:Double
    , coefficientOfPerformance: Double
    , energyEfficientRatio: Double
    , deepEarthTempearture:Double
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
    , heatingRunningTime: Double){
        self.heatPumpHeatingCapacity = heatPumpHeatingCapacity
        self.heatPumpCoolingCapacity = heatPumpCoolingCapacity
        self.coefficientOfPerformance = coefficientOfPerformance
        self.energyEfficientRatio = energyEfficientRatio
        self.deepEarthTempearture = deepEarthTempearture
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
    }
}
