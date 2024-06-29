//
//  IGSHPAVBcal.swift
//  Geothermal
//
//  Created by Ruiqi Pang/Haoyuan He on 17/4/2023.
//

import Foundation

class IGSHPAVBCalculation: ObservableObject {
    @Published var heatPumpHeatingCapacity: Double
    @Published var heatPumpCoolingCapacity: Double
    @Published var coefficientOfPerformance: Double
    @Published var energyEfficientRatio: Double
    @Published var deepEarthTempearture: Double
    @Published var minEnteringWaterTemp: Double
    @Published var minLeavingWaterTemp: Double
    @Published var maxEnteringWaterTemp: Double
    @Published var maxLeavingWaterTemp: Double
    @Published var groundThermalConductivity: Double
    @Published var groundHeatTransferDiameter: Double
    @Published var boreholeDiameter: Double
    @Published var pipeOuterDiameter: Double
    @Published var pipeInnerDiameter: Double
    @Published var groutThermalConductivity: Double
    @Published var pipeThermalConductivity: Double
    @Published var coolingRunningTime: Double
    @Published var heatingRunningTime: Double
    @Published var boreholeNumberInput: Double
    @Published var boreholeLengthInput: Double
    
    // Heat Pump Specification Unit
    @Published var copUnit: Int = 0
    @Published var eerUnit: Int = 0
    @Published var hcUnit: Int = 0
    @Published var tcUnit: Int = 0
    // Heat Pump Design Conditions Unit
    @Published var ewtMinUnit: Int = 0
    @Published var lwtMinUnit: Int = 0
    @Published var ewtMaxUnit: Int = 0
    @Published var lwtMaxUnit: Int = 0
    @Published var rtClgUnit: Int = 0
    @Published var rtHtgUnit: Int = 0
    // Ground Properties Unit
    @Published var kgUnit: Int = 0
    @Published var tgUnit: Int = 0
    @Published var dgoUnit: Int = 0
    // Borehole Parameters Unit
    @Published var dbUnit: Int = 0
    @Published var dpoUnit: Int = 0
    @Published var dpiUnit: Int = 0
    @Published var kGroutUnit: Int = 0
    @Published var kpUnit: Int = 0
    // Borehole Configuration Unit
    @Published var boreholeNumberUnit: Int = 0
    @Published var boreholeLengthUnit: Int = 0

    var groundThermalResistanceE: Double {
        return (log(groundHeatTransferDiameter / boreholeDiameter) / (2 * Double.pi * groundThermalConductivity / 1.73))
    }

    var groundThermalResistance: Double {
        return groundThermalResistanceE / 1.73
    }
    
    var boreholeShapeFactor: Double {
        var boreholePipeOuterDiamterRatio: Double {
            return (boreholeDiameter / pipeOuterDiameter)
        }
        return (((17.44 * pow(boreholePipeOuterDiamterRatio, -0.6025)) + (21.91 * pow(boreholePipeOuterDiamterRatio, -0.3796))) / 2)
    }

    var groutThermalResistanceE: Double {
        return (1 / (boreholeShapeFactor * (groutThermalConductivity / 1.73)))
    }

    var groutThermalResistance: Double {
        return groutThermalResistanceE / 1.73
    }
    
    var pipeWallThermalResistanceE: Double {
        return ((log(pipeOuterDiameter / pipeInnerDiameter) / (2 * Double.pi * (pipeThermalConductivity / 1.73))) / 2)
    }
    
    var pipeWallThermalResistance: Double {
        return pipeWallThermalResistanceE / 1.73
    }
    
    var boreholeThermalResistanceE: Double {
        return (groutThermalResistanceE + pipeWallThermalResistanceE)
    }

    var boreholeThermalResistance: Double {
        return boreholeThermalResistanceE / 1.73
    }
    
    var coolingRunFraction: Double {
        return (coolingRunningTime / 744)
    }
    
    var heatingRunFraction: Double {
        return (heatingRunningTime / 744)
    }
    
    var heatingBoreholeLength: Double {
        return (((heatPumpHeatingCapacity * 1000 / 0.293) * ((coefficientOfPerformance - 1) / coefficientOfPerformance) * (boreholeThermalResistanceE + groundThermalResistanceE * heatingRunFraction)) / ((deepEarthTempearture * 1.8 + 32) - (((minEnteringWaterTemp * 1.8 + 32) + (minLeavingWaterTemp * 1.8 + 32)) / 2))) * 0.305
    }
    
    var coolingBoreholeLength: Double {
        return (((heatPumpCoolingCapacity * 1000 / 0.293) * ((energyEfficientRatio + 3.412) / energyEfficientRatio) * (boreholeThermalResistanceE + groundThermalResistanceE * coolingRunFraction)) / ((((maxEnteringWaterTemp * 1.8 + 32) + (maxLeavingWaterTemp * 1.8 + 32)) / 2) - (deepEarthTempearture * 1.8 + 32))) * 0.305
    }
    
    var totalBoreholeLength: Double {
        if coolingBoreholeLength > heatingBoreholeLength {
            return coolingBoreholeLength
        } else {
            return heatingBoreholeLength
        }
    }
    
    // Returns the suggested borehole number and length.
    func getConfiguration() -> (Int, Double) {
        if boreholeNumberInput == 0 && boreholeLengthInput == 0 {
            var no: Double = 1
            var length: Double = 90
            while (totalBoreholeLength / no) > 90 {
                no += 1
                length = totalBoreholeLength / no
                length = ceil(length)
            }
            return (Int(no), length)
        } else if boreholeNumberInput != 0 {
            let length: Double = totalBoreholeLength / boreholeNumberInput
            return (Int(boreholeNumberInput), ceil(length))
        } else if boreholeLengthInput != 0 {
            let no: Double = totalBoreholeLength / boreholeLengthInput
            return (Int(no), ceil(boreholeLengthInput))
        }
        return (0, 0)
    }
    
    init(heatPumpHeatingCapacity: Double,
         heatPumpCoolingCapacity: Double,
         coefficientOfPerformance: Double,
         energyEfficientRatio: Double,
         deepEarthTempearture: Double,
         minEnteringWaterTemp: Double,
         minLeavingWaterTemp: Double,
         maxEnteringWaterTemp: Double,
         maxLeavingWaterTemp: Double,
         groundThermalConductivity: Double,
         groudHeatTransferDiameter: Double,
         boreholeDiameter: Double,
         pipeOuterDiameter: Double,
         pipeInnerDiameter: Double,
         groutThermalConductivity: Double,
         pipeThermalConductivity: Double,
         coolingRunningTime: Double,
         heatingRunningTime: Double,
         boreholeNumberInput: Double,
         boreholeLengthInput: Double)
    {
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
        self.boreholeNumberInput = boreholeNumberInput
        self.boreholeLengthInput = boreholeLengthInput
    }
}
