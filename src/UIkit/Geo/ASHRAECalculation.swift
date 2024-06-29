//
//  ASHRAECalculation.swift
//  Geo
//
//  Created by Leon ZHANG on 14/04/2016.
//  Copyright © 2016 ZHANGLiangliang. All rights reserved.
//

import UIKit

class ASHRAECalculation {
     var loopInnerRadius: Double 
     var loopOuterRadius: Double 
     var boreholeRadius: Double 
     var groundThermalConductivity: Double 
     var groutThermalConductivity: Double 
     var ULoopPipeThermalConductivity: Double 
    var centreDistanceBetweenPipes: Double 
     var internalConvectionCoefficient: Double 
     var groundThermalDiffusivity: Double 
     var enteringWaterTemp: Double 
     var massFlowRate: Double 
     var GHEThermalCapacity: Double 
     var distanceBetweenBoreholes: Double 
     var numberOfBoreholes: Double
     var geoAspectRatio: Double 
     var undisturbedGroundTemp: Double 
     var yearAvgGroundLoad: Double 
     var monthGroundLoad: Double 
     var hourGroundLoad: Double
    
    var outletWaterTempCooling:Double {
        get{
            return enteringWaterTemp - (1000 / (massFlowRate * GHEThermalCapacity))
        }
    }
    
    var outletWaterTempHeating:Double {
        get{
            return enteringWaterTemp + (1000 / (massFlowRate * GHEThermalCapacity))
        }
    }
    
    var meanWaterTempCooling:Double {
        get{
            return (enteringWaterTemp + outletWaterTempCooling) / 2
        }
    }
    
    var meanWaterTempHeating:Double {
        get{
            return (enteringWaterTemp + outletWaterTempHeating) / 2
        }
    }
    
    var distanceDepthRatio: Double = 0.05
    var boreholeDepth: Double {
        return distanceBetweenBoreholes / distanceDepthRatio
    }
    
    var dimensionlessTime: Double{
        get{
            return  log(3650 / (pow(boreholeDepth,2) / (9 * groundThermalDiffusivity)))
        }
    }
    

    
    var correlationFunc1: Double{
        get{
            return 7.8189 + (-64.27) * distanceDepthRatio + 153.87 * pow(distanceDepthRatio, 2) + (-84.809) * pow(distanceDepthRatio, 3) + 3.461 * dimensionlessTime + (-0.94753) * pow(dimensionlessTime, 2)
        }
    }
    var correlationFunc2: Double{
        get{
            return (-0.060416) * pow(dimensionlessTime, 3) + 1.5631 * numberOfBoreholes + (-0.0089416) * pow(numberOfBoreholes, 2) + 0.00001906 * pow(numberOfBoreholes, 3) + (-2.289) * geoAspectRatio + 0.10187 * pow(geoAspectRatio, 2)
        }
    }
    var correlationFunc3: Double{
        get{
            return 0.006569 * pow(geoAspectRatio, 3) + (-40.918) * distanceDepthRatio * dimensionlessTime + 15.557 * distanceDepthRatio * pow(dimensionlessTime, 2) + (-19.107) * distanceDepthRatio * numberOfBoreholes + 0.10529 * distanceDepthRatio * pow(numberOfBoreholes, 2) + 25.501 * distanceDepthRatio * geoAspectRatio
        }
    }
    var correlationFunc4: Double{
        get{
            return
                (-2.1177) * distanceDepthRatio * pow(geoAspectRatio, 2) + (-2.1177) * distanceDepthRatio * pow(geoAspectRatio, 2) + 77.529 * pow(distanceDepthRatio, 2) * dimensionlessTime
        }
    }
    var correlationFunc5: Double{
        get{
            return
               (-50.454) * pow(dimensionlessTime * distanceDepthRatio, 2) + 76.352 *  pow(distanceDepthRatio, 2) * numberOfBoreholes + (-0.53719) * pow(numberOfBoreholes * distanceDepthRatio, 2)
        }
    }
    var correlationFunc6: Double{
        get{
            return
                (-132) *  pow(distanceDepthRatio, 2) * geoAspectRatio + 12.878 *  pow(distanceDepthRatio * geoAspectRatio, 2)
        }
    }
    var correlationFunc7: Double{
        get{
            return
                0.12697 * dimensionlessTime * numberOfBoreholes + (-0.00040284) * dimensionlessTime * pow(numberOfBoreholes, 2)
        }
    }
    var correlationFunc8: Double{
        get{
            return
                (-0.072065) * dimensionlessTime * geoAspectRatio + 0.00095184 * dimensionlessTime * pow(geoAspectRatio, 2)
        }
    }
    var correlationFunc9: Double{
        get{
            return
                (-0.024167) * pow(dimensionlessTime,2) * numberOfBoreholes + 0.000096811 *  pow(dimensionlessTime * numberOfBoreholes, 2)
        }
    }
    var correlationFunc10: Double{
        get{
            return
                0.028317 * pow(dimensionlessTime,2) * geoAspectRatio + (-0.0010905) *  pow(dimensionlessTime * geoAspectRatio, 2)
        }
    }
    var correlationFunc11: Double{
        get{
            return 0.12207 * numberOfBoreholes * geoAspectRatio + (-0.007105) * numberOfBoreholes * pow( geoAspectRatio, 2)
        }
    }
    var correlationFunc12: Double{
        get{
            return (-0.0011129) * pow(numberOfBoreholes,2) * geoAspectRatio + (-0.00045566) * pow(numberOfBoreholes * geoAspectRatio, 2)
        }
    }
    var correlationFunc: Double{
        get{
            return correlationFunc1 + correlationFunc2 + correlationFunc3 + correlationFunc4 + correlationFunc5 + correlationFunc6 + correlationFunc7 + correlationFunc8 + correlationFunc9 + correlationFunc10 + correlationFunc11 + correlationFunc12
        }
    }
    

    
    var tempPenaltyCooling : Double {
        if numberOfBoreholes == 1{
                return 0
        }else{
            return yearAvgGroundLoad * correlationFunc /  (2 * Double.pi * groundThermalConductivity * undisturbedCoolingLength)
        }
    }
    
    var tempPenaltyHeating : Double {
        if numberOfBoreholes == 1{
            return 0
        }else{
            return yearAvgGroundLoad * correlationFunc /  (2 * Double.pi * groundThermalConductivity * undisturbedHeatingLength)
        }
    }
    
    var f10y_1 : Double {
         get{
            return 0.3057646 + 0.08987446 * boreholeRadius + (-0.09151786) * pow(boreholeRadius, 2) + (-0.03872451) * groundThermalDiffusivity + 0.1690853 * pow(groundThermalDiffusivity,2)
        }
    }
    var f10y_2 : Double {
        get{
            return  (-0.02881681) * log(groundThermalDiffusivity) + (-0.002886584) * pow(log(groundThermalDiffusivity),2) + (-0.1723169) * boreholeRadius * groundThermalDiffusivity
        }
    }
    var f10y_3 : Double {
        get{
            return 0.03112034 * boreholeRadius * log(groundThermalDiffusivity) + (-0.1188438) * groundThermalDiffusivity * log(groundThermalDiffusivity)
        }
    }
    var tenyearResistance: Double{
        get{
            return (f10y_1 + f10y_2 + f10y_3) / groundThermalConductivity
        }
    }
    
    
    var f1m_1 : Double {
        get{
            return 0.4132728 + 0.2912981 * boreholeRadius + 0.07589286 * pow(boreholeRadius, 2) + 0.1563978 * groundThermalDiffusivity + (-0.2289355) * pow(groundThermalDiffusivity,2)
        }
    }
    var f1m_2 : Double {
        get{
            return  (-0.004927554) * log(groundThermalDiffusivity) + (-0.002694979) * pow(log(groundThermalDiffusivity),2) + (-0.6380360) * boreholeRadius * groundThermalDiffusivity
        }
    }
    var f1m_3 : Double {
        get{
            return 0.2950815 * boreholeRadius * log(groundThermalDiffusivity) + 0.1493320 * groundThermalDiffusivity * log(groundThermalDiffusivity)
        }
    }
    var onemonthResistance: Double{
        get{
            return (f1m_1 + f1m_2 + f1m_3) / groundThermalConductivity
        }
    }
    
    var f6h_1 : Double {
        get{
            return 0.6619352 + (-4.815693) * boreholeRadius + 15.03571 * pow(boreholeRadius, 2) + (-0.09879421) * groundThermalDiffusivity + 0.02917889 * pow(groundThermalDiffusivity,2)
        }
    }
    var f6h_2 : Double {
        get{
            return  0.1138498 * log(groundThermalDiffusivity) + 0.005610933 * pow(log(groundThermalDiffusivity),2) + 0.7796329 * boreholeRadius * groundThermalDiffusivity
        }
    }
    var f6h_3 : Double {
        get{
            return (-0.324388) * boreholeRadius * log(groundThermalDiffusivity) + (-0.01824101) * groundThermalDiffusivity * log(groundThermalDiffusivity)
        }
    }
    var sixhourResistance: Double{
        get{
            return (f6h_1 + f6h_2 + f6h_3) / groundThermalConductivity
        }
    }
    
    var innerPipeConvectionResistance: Double {
        get{
            return 1 / (2 * Double.pi * loopInnerRadius * internalConvectionCoefficient)
        }
    }
    
    var pipeConvectionResistance: Double {
        get{
            return log(loopOuterRadius / loopInnerRadius) / (2 * Double.pi * ULoopPipeThermalConductivity)
        }
    }
    
    var groutResistance1: Double{
        get{
            return log(boreholeRadius / loopOuterRadius) + log(boreholeRadius / centreDistanceBetweenPipes)
        }
    }
    
    var groutResistance2: Double{
        get{
            return  ((groutThermalConductivity - groundThermalConductivity) / (groutThermalConductivity + groundThermalConductivity)) * log(pow(boreholeRadius, 4) / (pow(boreholeRadius, 4) - pow(centreDistanceBetweenPipes / 2, 4)))
        }
    }
    var groutResistance: Double{
        get{
            return (groutResistance1 + groutResistance2) / (4 * Double.pi * groutThermalConductivity)
        }
    }
    
    var boreholeResistance: Double{
        get{
            return groutResistance + ((pipeConvectionResistance + innerPipeConvectionResistance) / 2)
        }
    }
    
    
    var undisturbedCoolingLength: Double{
        get{
            return (hourGroundLoad * boreholeResistance + yearAvgGroundLoad * tenyearResistance + monthGroundLoad * onemonthResistance + hourGroundLoad * sixhourResistance) / (meanWaterTempCooling - undisturbedGroundTemp)
        }
    }
    
    var undisturbedHeatingLength: Double{
        get{
            return (hourGroundLoad * boreholeResistance + yearAvgGroundLoad * tenyearResistance + monthGroundLoad * onemonthResistance + hourGroundLoad * sixhourResistance) / (meanWaterTempHeating - undisturbedGroundTemp)
        }
    }

    var totalCoolingBoreholeLength: Double{
        get{
            return (hourGroundLoad * boreholeResistance + yearAvgGroundLoad * tenyearResistance + monthGroundLoad * onemonthResistance + hourGroundLoad * sixhourResistance) / (meanWaterTempCooling - undisturbedGroundTemp - tempPenaltyCooling)
        }
    }
    
    var totalHeatingBoreholeLength: Double{
        get{
            return (hourGroundLoad * boreholeResistance + yearAvgGroundLoad * tenyearResistance + monthGroundLoad * onemonthResistance + hourGroundLoad * sixhourResistance) / (meanWaterTempHeating - undisturbedGroundTemp - tempPenaltyHeating)
        }
    }
    
    





    
    init(loopInnerRadius: Double
     , loopOuterRadius: Double
     , boreholeRadius: Double
     , groundThermalConductivity: Double
     , groutThermalConductivity: Double
     , ULoopPipeThermalConductivity: Double
     , centreDistanceBetweenPipes: Double
     , internalConvectionCoefficient: Double
     , groundThermalDiffusivity: Double
     , enteringWaterTemp: Double
     , massFlowRate: Double
     , GHEThermalCapacity: Double
     , distanceBetweenBoreholes: Double
     , numberOfBoreholes: Double
     , geoAspectRatio: Double
     , undisturbedGroundTemp: Double
     , yearAvgGroundLoad: Double
     , monthGroundLoad: Double
     , hourGroundLoad: Double ){
        self.loopInnerRadius = loopInnerRadius
        self.loopOuterRadius = loopOuterRadius
        self.boreholeRadius = boreholeRadius
        self.groundThermalConductivity = groundThermalConductivity
        self.groutThermalConductivity = groutThermalConductivity
        self.ULoopPipeThermalConductivity = ULoopPipeThermalConductivity
        self.centreDistanceBetweenPipes = centreDistanceBetweenPipes
        self.internalConvectionCoefficient = internalConvectionCoefficient
        self.groundThermalDiffusivity = groundThermalDiffusivity
        self.enteringWaterTemp = enteringWaterTemp
        self.massFlowRate = massFlowRate
        self.GHEThermalCapacity = GHEThermalCapacity
        self.distanceBetweenBoreholes = distanceBetweenBoreholes
        self.numberOfBoreholes = numberOfBoreholes
        self.geoAspectRatio = geoAspectRatio
        self.undisturbedGroundTemp = undisturbedGroundTemp
        self.yearAvgGroundLoad = yearAvgGroundLoad
        self.monthGroundLoad = monthGroundLoad
        self.hourGroundLoad = hourGroundLoad
    }
}
