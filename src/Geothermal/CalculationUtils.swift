//
//  CalculationUtils.swift
//  Geothermal
//
//  Created by Yuntian Wan on 29/5/2023.
//

import Foundation

// Keep up to three decimal places while omitting trailing zeros
func formatNumber(_ number: Double) -> String {
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal
    formatter.maximumFractionDigits = 3
    formatter.minimumFractionDigits = 0
    formatter.groupingSeparator = ""
    return formatter.string(from: NSNumber(value: number)) ?? "\(number)"
}

func formatNumber(_ number: Double, _ dec: Int) -> String {
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal
    formatter.maximumFractionDigits = dec
    formatter.minimumFractionDigits = 0
    formatter.groupingSeparator = ""
    return formatter.string(from: NSNumber(value: number)) ?? "\(number)"
}

// Convert between ["kW", "BTU/h", "TR"]
func convertWatt(oldUnit: Int, newUnit: Int, value: String) -> String {
    guard let doubleValue = Double(value) else { return value }
    let convertedValue: Double
    if oldUnit == 0 && newUnit == 1 { // kW to BTU/h
        convertedValue = doubleValue * 3412.142
    } else if oldUnit == 0 && newUnit == 2 { // kW to TR
        convertedValue = doubleValue / 3.517
    } else if oldUnit == 1 && newUnit == 0 { // BTU/h to kW
        convertedValue = doubleValue / 3412.142
    } else if oldUnit == 1 && newUnit == 2 { // BTU/h to TR
        convertedValue = doubleValue / 12000
    } else if oldUnit == 2 && newUnit == 0 { // TR to kW
        convertedValue = doubleValue * 3.517
    } else if oldUnit == 2 && newUnit == 1 { // TR to BTU/h
        convertedValue = doubleValue * 12000
    } else {
        convertedValue = doubleValue
    }
    return formatNumber(convertedValue)
}

// Convert between ["℃", "℉"]
func convertTemperature(oldUnit: Int, newUnit: Int, value: String) -> String {
    guard let doubleValue = Double(value) else { return value }
    let convertedValue: Double
    if oldUnit == 0 && newUnit == 1 { // Celsius to Fahrenheit
        convertedValue = (doubleValue * 9 / 5) + 32
    } else if oldUnit == 1 && newUnit == 0 { // Fahrenheit to Celsius
        convertedValue = (doubleValue - 32) * 5 / 9
    } else {
        convertedValue = doubleValue
    }
    return formatNumber(convertedValue)
}

// Convert between ["m", "ft"].
func convertMeterFoot(oldUnit: Int, newUnit: Int, value: String) -> String {
    guard let doubleValue = Double(value) else { return value }
    let conversionFactor: Double
    if oldUnit == 0 && newUnit == 1 {
        conversionFactor = 3.28084
    } else if oldUnit == 1 && newUnit == 0 {
        conversionFactor = 0.3048
    } else {
        conversionFactor = 1
    }
    let convertedValue = doubleValue * conversionFactor
    return formatNumber(convertedValue)
}

// Convert between ["m", "in"].
func convertMeterInch(oldUnit: Int, newUnit: Int, value: String) -> String {
    guard let doubleValue = Double(value) else { return value }
    let conversionFactor: Double
    if oldUnit == 0 && newUnit == 1 {
        conversionFactor = 39.3701
    } else if oldUnit == 1 && newUnit == 0 {
        conversionFactor = 0.0254
    } else {
        conversionFactor = 1
    }
    let convertedValue = doubleValue * conversionFactor
    return formatNumber(convertedValue)
}

// Convert between ["m²/day", "ft²/day"]
func convertM2Day(oldUnit: Int, newUnit: Int, value: String) -> String {
    guard let doubleValue = Double(value) else { return value }
    let conversionFactor: Double
    if oldUnit == 0 && newUnit == 1 {
        conversionFactor = 1 / 0.092903 // convert m²/day to ft²/day
    } else if oldUnit == 1 && newUnit == 0 {
        conversionFactor = 0.092903 // convert ft²/day to m²/day
    } else {
        conversionFactor = 1
    }
    let convertedValue = doubleValue * conversionFactor
    return formatNumber(convertedValue)
}

// Convert between ["W/m K", "BTU/h ft ℉"]
func convertWMK(oldUnit: Int, newUnit: Int, value: String) -> String {
    guard let doubleValue = Double(value) else { return value }
    let conversionFactor: Double
    if oldUnit == 0 && newUnit == 1 {
        conversionFactor = 0.577789
    } else if oldUnit == 1 && newUnit == 0 {
        conversionFactor = 1.73073
    } else {
        conversionFactor = 1
    }
    let convertedValue = doubleValue * conversionFactor
    return formatNumber(convertedValue)
}

// Convert between ["W/m² K", "BTU/h ft² ℉"]
func convertWM2K(oldUnit: Int, newUnit: Int, value: String) -> String {
    guard let doubleValue = Double(value) else { return value }
    let conversionFactor: Double
    if oldUnit == 0 && newUnit == 1 {
        conversionFactor = 0.17611
    } else if oldUnit == 1 && newUnit == 0 {
        conversionFactor = 5.67826
    } else {
        conversionFactor = 1
    }
    let convertedValue = doubleValue * conversionFactor
    return formatNumber(convertedValue)
}

// Convert between ["J/kg K", "BTU/lb ℉"]
func convertJKgK(oldUnit: Int, newUnit: Int, value: String) -> String {
    guard let doubleValue = Double(value) else { return value }
    let conversionFactor: Double
    if oldUnit == 0 && newUnit == 1 {
        conversionFactor = 0.238846
    } else if oldUnit == 1 && newUnit == 0 {
        conversionFactor = 4.1868
    } else {
        conversionFactor = 1
    }
    let convertedValue = doubleValue * conversionFactor
    return formatNumber(convertedValue)
}

// Convert between ["W/(m⋅℃)", "BTU/(h ft ℉)"]
func convertWMTemp(oldUnit: Int, newUnit: Int, value: String) -> String {
    guard let doubleValue = Double(value) else { return value }
    let conversionFactor: Double
    if oldUnit == 0 && newUnit == 1 {
        conversionFactor = 0.577789
    } else if oldUnit == 1 && newUnit == 0 {
        conversionFactor = 1.73073
    } else {
        conversionFactor = 1
    }
    let convertedValue = doubleValue * conversionFactor
    return formatNumber(convertedValue)
}

// Convert between ["m ℃/W", "h ft ℉/BTU"]
func convertMTempW(oldUnit: Int, newUnit: Int, value: String) -> String {
    guard let doubleValue = Double(value) else { return value }
    let conversionFactor: Double
    if oldUnit == 0 && newUnit == 1 {
        conversionFactor = 1.73073
    } else if oldUnit == 1 && newUnit == 0 {
        conversionFactor = 0.577789
    } else {
        conversionFactor = 1
    }
    let convertedValue = doubleValue * conversionFactor
    return formatNumber(convertedValue)
}

// Convert between ["m K/W", "h ft ℉/BTU"]
func convertMKW(oldUnit: Int, newUnit: Int, value: String) -> String {
    guard let doubleValue = Double(value) else { return value }
    let conversionFactor: Double
    if oldUnit == 0 && newUnit == 1 {
        conversionFactor = 1.73073
    } else if oldUnit == 1 && newUnit == 0 {
        conversionFactor = 0.577789
    } else {
        conversionFactor = 1
    }
    let convertedValue = doubleValue * conversionFactor
    return formatNumber(convertedValue)
}

// Convert between ["km", "mi"]
func convertKm(oldUnit: Int, newUnit: Int, value: String) -> String {
    guard let doubleValue = Double(value) else { return value }
    let conversionFactor: Double
    if oldUnit == 0 && newUnit == 1 {
        conversionFactor = 0.62137119
    } else if oldUnit == 1 && newUnit == 0 {
        conversionFactor = 1.609344
    } else {
        conversionFactor = 1
    }
    let convertedValue = doubleValue * conversionFactor
    return formatNumber(convertedValue)
}

func convertKgSKw(oldUnit: Int, newUnit: Int, value: String) -> String {
    return value
}

func convertHour(oldUnit: Int, newUnit: Int, value: String) -> String {
    return value
}

func convertUnchanged(oldUnit: Int, newUnit: Int, value: String) -> String {
    return value
}
