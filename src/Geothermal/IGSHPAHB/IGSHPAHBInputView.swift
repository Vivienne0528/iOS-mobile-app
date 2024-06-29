//
//  IGSHPAHBInputView.swift
//  Geothermal
//
//  Created by Ruiqi Pang/ Haoyuan He on 13/4/2023.
//

import SwiftUI

struct IGSHPAHBInputView: View {
    @AppStorage("language") private var language = "en"
    @EnvironmentObject var colorSchemeManager: ColorSchemeManager
    // Heat Pump Specification
    @State private var copValue: String = "4"
    @State private var eerValue: String = "14.5"
    @State private var hcValue: String = "20"
    @State private var tcValue: String = "20"
    // Heat Pump Design Conditions
    @State private var ewtMinValue: String = "4"
    @State private var lwtMinValue: String = "1"
    @State private var ewtMaxValue: String = "30"
    @State private var lwtMaxValue: String = "34"
    @State private var rtClgValue: String = "476"
    @State private var rtHtgValue: String = "476"
    // Ground Properties
    @State private var tmValue: String = "24"
    @State private var asValue: String = "-0.1"
    @State private var kgValue: String = "1.73"
    @State private var dgoValue: String = "4.572"
    @State private var alphaValue: String = "0.06"
    // Borehole Parameters
    @State private var dbValue: String = "0.128"
    @State private var dpoValue: String = "0.027"
    @State private var dpiValue: String = "0.022"
    @State private var kGroutValue: String = "0.692"
    @State private var kpValue: String = "0.346"
    @State private var dValue: String = "3.1"
    // Borehole Configuration
    @State private var boreholeNumberValue: String = ""
    @State private var boreholeLengthValue: String = ""

    // Heat Pump Specification Unit
    @State private var copUnit: Int = 0
    @State private var eerUnit: Int = 0
    @State private var hcUnit: Int = 0
    @State private var tcUnit: Int = 0
    // Heat Pump Design Conditions Unit
    @State private var ewtMinUnit: Int = 0
    @State private var lwtMinUnit: Int = 0
    @State private var ewtMaxUnit: Int = 0
    @State private var lwtMaxUnit: Int = 0
    @State private var rtClgUnit: Int = 0
    @State private var rtHtgUnit: Int = 0
    // Ground Properties Unit
    @State private var tmUnit: Int = 0
    @State private var asUnit: Int = 0
    @State private var kgUnit: Int = 0
    @State private var dgoUnit: Int = 0
    @State private var alphaUnit: Int = 0
    // Borehole Parameters Unit
    @State private var dbUnit: Int = 0
    @State private var dpoUnit: Int = 0
    @State private var dpiUnit: Int = 0
    @State private var kGroutUnit: Int = 0
    @State private var kpUnit: Int = 0
    @State private var dUnit: Int = 0
    // Borehole Configuration Unit
    @State private var boreholeNumberUnit: Int = 0
    @State private var boreholeLengthUnit: Int = 0

    // Alert Parameters
    @State private var showAlert = false
    @State private var alertMessage = ""

    // Navigation Parameters
    @State private var showResultView = false

    // IGSHPAHB Calculation Model
    @StateObject var HBCalculator = IGSHPAHBCalculation(heatPumpHeatingCapacity: 1,
                                                        heatPumpCoolingCapacity: 2,
                                                        coefficientOfPerformance: 3,
                                                        energyEfficientRatio: 4,
                                                        meanEarthTempearture: 5,
                                                        minEnteringWaterTemp: 6,
                                                        minLeavingWaterTemp: 7,
                                                        maxEnteringWaterTemp: 8,
                                                        maxLeavingWaterTemp: 9,
                                                        groundThermalConductivity: 10,
                                                        groudHeatTransferDiameter: 11,
                                                        boreholeDiameter: 12,
                                                        pipeOuterDiameter: 13,
                                                        pipeInnerDiameter: 14,
                                                        groutThermalConductivity: 15,
                                                        pipeThermalConductivity: 16,
                                                        coolingRunningTime: 17,
                                                        heatingRunningTime: 18,
                                                        avgPipeDepth: 19,
                                                        surfaceTempAmplitude: 20,
                                                        soilThermalDiffusivity: 21,
                                                        boreholeNumberInput: 22,
                                                        boreholeLengthInput: 23)
    func initCalculator() {
        HBCalculator.heatPumpHeatingCapacity = Double(hcValue)!
        HBCalculator.coefficientOfPerformance = Double(copValue)!
        HBCalculator.heatPumpCoolingCapacity = Double(tcValue)!
        HBCalculator.energyEfficientRatio = Double(eerValue)!
        HBCalculator.meanEarthTempearture = Double(tmValue)!
        HBCalculator.minEnteringWaterTemp = Double(ewtMinValue)!
        HBCalculator.minLeavingWaterTemp = Double(lwtMinValue)!
        HBCalculator.maxEnteringWaterTemp = Double(ewtMaxValue)!
        HBCalculator.maxLeavingWaterTemp = Double(lwtMaxValue)!
        HBCalculator.groundThermalConductivity = Double(kgValue)!
        HBCalculator.groundHeatTransferDiameter = Double(dgoValue)!
        HBCalculator.boreholeDiameter = Double(dbValue)!
        HBCalculator.pipeOuterDiameter = Double(dpoValue)!
        HBCalculator.pipeInnerDiameter = Double(dpiValue)!
        HBCalculator.groutThermalConductivity = Double(kGroutValue)!
        HBCalculator.pipeThermalConductivity = Double(kpValue)!
        HBCalculator.coolingRunningTime = Double(rtClgValue)!
        HBCalculator.heatingRunningTime = Double(rtHtgValue)!
        HBCalculator.avgPipeDepth = Double(dValue)!
        HBCalculator.surfaceTempAmplitude = Double(asValue)!
        HBCalculator.soilThermalDiffusivity = Double(alphaValue)!

        if boreholeNumberValue.isEmpty {
            HBCalculator.boreholeNumberInput = 0
        } else {
            HBCalculator.boreholeNumberInput = Double(boreholeNumberValue)!
        }
        if boreholeLengthValue.isEmpty {
            HBCalculator.boreholeLengthInput = 0
        } else {
            HBCalculator.boreholeLengthInput = Double(boreholeLengthValue)!
        }

        HBCalculator.copUnit = copUnit
        HBCalculator.eerUnit = eerUnit
        HBCalculator.hcUnit = hcUnit
        HBCalculator.tcUnit = tcUnit
        HBCalculator.ewtMinUnit = ewtMinUnit
        HBCalculator.lwtMinUnit = lwtMinUnit
        HBCalculator.ewtMaxUnit = ewtMaxUnit
        HBCalculator.lwtMaxUnit = lwtMaxUnit
        HBCalculator.rtClgUnit = rtClgUnit
        HBCalculator.rtHtgUnit = rtHtgUnit
        HBCalculator.tmUnit = tmUnit
        HBCalculator.asUnit = asUnit
        HBCalculator.kgUnit = kgUnit
        HBCalculator.dgoUnit = dgoUnit
        HBCalculator.alphaUnit = alphaUnit
        HBCalculator.dbUnit = dbUnit
        HBCalculator.dpoUnit = dpoUnit
        HBCalculator.dpiUnit = dpiUnit
        HBCalculator.kGroutUnit = kGroutUnit
        HBCalculator.kpUnit = kpUnit
        HBCalculator.dUnit = dUnit
        HBCalculator.boreholeLengthUnit = boreholeLengthUnit
    }

    // Input Validation
    var inputIsValid: Bool {
        if copValue.isEmpty || eerValue.isEmpty || hcValue.isEmpty || tcValue.isEmpty || ewtMinValue.isEmpty || lwtMinValue.isEmpty || ewtMaxValue.isEmpty || lwtMaxValue.isEmpty || rtClgValue.isEmpty || rtHtgValue.isEmpty || tmValue.isEmpty || asValue.isEmpty || kgValue.isEmpty || dgoValue.isEmpty || alphaValue.isEmpty || dbValue.isEmpty || dpoValue.isEmpty || dpiValue.isEmpty || kGroutValue.isEmpty || kpValue.isEmpty || dValue.isEmpty {
            alertMessage = "Please fill in all required fields.".localized(language)
            return false
        }
        if !boreholeNumberValue.isEmpty && !boreholeLengthValue.isEmpty {
            alertMessage = "Please fill in either borehole number or borehole length.".localized(language)
            return false
        }
        alertMessage = ""
        return true
    }

    var body: some View {
        let stackSpacing: CGFloat = 5
        let sectionTopPadding: CGFloat = -4
        let sectionBtmPadding: CGFloat = -3
        Form {
            Section(header: Text("Heat Pump Specification".localized(language))) {
                VStack(spacing: stackSpacing) {
                    Row(paramName: "COP(D)",
                        defaultValue: $copValue,
                        units: [],
                        selectedUnit: $copUnit,
                        infoText: "cop_info".localized(language),
                        convertValue: convertUnchanged,
                        isDec: true)
                    CustomSeparator()
                    Row(paramName: "EER(D)",
                        defaultValue: $eerValue,
                        units: [],
                        selectedUnit: $eerUnit,
                        infoText: "eer_info".localized(language),
                        convertValue: convertUnchanged,
                        isDec: true)
                    CustomSeparator()
                    Row(paramName: "HC(D)",
                        defaultValue: $hcValue,
                        units: ["kW", "BTU/h", "TR"],
                        selectedUnit: $hcUnit,
                        infoText: "hc_info".localized(language),
                        convertValue: convertWatt,
                        isDec: true)
                    CustomSeparator()
                    Row(paramName: "TC(D)",
                        defaultValue: $tcValue,
                        units: ["kW", "BTU/h", "TR"],
                        selectedUnit: $tcUnit,
                        infoText: "tc_info".localized(language),
                        convertValue: convertWatt,
                        isDec: true)
                }
                .padding(.top, sectionTopPadding)
                .padding(.bottom, sectionBtmPadding)
            }
            Section(header: Text("Heat Pump Design Conditions".localized(language))) {
                VStack(spacing: stackSpacing) {
                    Group {
                        Row(paramName: "EWT(min)",
                            defaultValue: $ewtMinValue,
                            units: ["℃", "℉"],
                            selectedUnit: $ewtMinUnit,
                            infoText: "ewt_min_info".localized(language),
                            convertValue: convertTemperature,
                            isDec: true)
                        CustomSeparator()
                        Row(paramName: "LWT(min)",
                            defaultValue: $lwtMinValue,
                            units: ["℃", "℉"],
                            selectedUnit: $lwtMinUnit,
                            infoText: "lwt_min_info".localized(language),
                            convertValue: convertTemperature,
                            isDec: true)
                        CustomSeparator()
                        Row(paramName: "EWT(max)",
                            defaultValue: $ewtMaxValue,
                            units: ["℃", "℉"],
                            selectedUnit: $ewtMaxUnit,
                            infoText: "ewt_max_info".localized(language),
                            convertValue: convertTemperature,
                            isDec: true)
                        CustomSeparator()
                        Row(paramName: "LWT(max)",
                            defaultValue: $lwtMaxValue,
                            units: ["℃", "℉"],
                            selectedUnit: $lwtMaxUnit,
                            infoText: "lwt_max_info".localized(language),
                            convertValue: convertTemperature,
                            isDec: true)
                        CustomSeparator()
                        Row(paramName: "RT(CLG)",
                            defaultValue: $rtClgValue,
                            units: ["h"],
                            selectedUnit: $rtClgUnit,
                            infoText: "rt_clg_info".localized(language),
                            convertValue: convertHour,
                            isDec: true)
                        CustomSeparator()
                    }
                    Row(paramName: "RT(HTG)",
                        defaultValue: $rtHtgValue,
                        units: ["h"],
                        selectedUnit: $rtHtgUnit,
                        infoText: "rt_htg_info".localized(language),
                        convertValue: convertHour,
                        isDec: true)
                }
                .padding(.top, sectionTopPadding)
                .padding(.bottom, sectionBtmPadding)
            }
            Section(header: Text("Ground Properties".localized(language))) {
                VStack(spacing: stackSpacing) {
                    Row(paramName: "T(M)",
                        defaultValue: $tmValue,
                        units: ["℃", "℉"],
                        selectedUnit: $tmUnit,
                        infoText: "tm_info".localized(language),
                        convertValue: convertTemperature,
                        isDec: true)
                    CustomSeparator()
                    Row(paramName: "A(S)",
                        defaultValue: $asValue,
                        units: ["℃", "℉"],
                        selectedUnit: $asUnit,
                        infoText: "as_info".localized(language),
                        convertValue: convertTemperature,
                        isDec: true)
                    CustomSeparator()
                    Row(paramName: "k(G)",
                        defaultValue: $kgValue,
                        units: ["W/(m⋅℃)", "BTU/(h ft ℉)"],
                        selectedUnit: $kgUnit,
                        infoText: "kg_info".localized(language),
                        convertValue: convertWMTemp,
                        isDec: true)
                    CustomSeparator()
                    Row(paramName: "D(G,O)",
                        defaultValue: $dgoValue,
                        units: ["m", "ft"],
                        selectedUnit: $dgoUnit,
                        infoText: "dgo_info".localized(language),
                        convertValue: convertMeterFoot,
                        isDec: true)
                    CustomSeparator()
                    Row(paramName: "α",
                        defaultValue: $alphaValue,
                        units: ["m²/day", "ft²/day"],
                        selectedUnit: $alphaUnit,
                        infoText: "alpha_info".localized(language),
                        convertValue: convertM2Day,
                        isDec: true)
                }
                .padding(.top, sectionTopPadding)
                .padding(.bottom, sectionBtmPadding)
            }

            Section(header: Text("Borehole Parameters".localized(language))) {
                VStack(spacing: stackSpacing) {
                    Group {
                        Row(paramName: "D(B)",
                            defaultValue: $dbValue,
                            units: ["m", "in"],
                            selectedUnit: $dbUnit,
                            infoText: "db_info".localized(language),
                            convertValue: convertMeterInch,
                            isDec: true)
                        CustomSeparator()
                        Row(paramName: "D(P,O)",
                            defaultValue: $dpoValue,
                            units: ["m", "in"],
                            selectedUnit: $dpoUnit,
                            infoText: "dpo_info".localized(language),
                            convertValue: convertMeterInch,
                            isDec: true)
                        CustomSeparator()
                        Row(paramName: "D(P,I)",
                            defaultValue: $dpiValue,
                            units: ["m", "in"],
                            selectedUnit: $dpiUnit,
                            infoText: "dpi_info".localized(language),
                            convertValue: convertMeterInch,
                            isDec: true)
                        CustomSeparator()
                        Row(paramName: "k(Grout)",
                            defaultValue: $kGroutValue,
                            units: ["W/(m⋅℃)", "BTU/(h ft ℉)"],
                            selectedUnit: $kGroutUnit,
                            infoText: "k_grout_info".localized(language),
                            convertValue: convertWMTemp,
                            isDec: true)
                        CustomSeparator()
                        Row(paramName: "k(P)",
                            defaultValue: $kpValue,
                            units: ["W/(m⋅℃)", "BTU/(h ft ℉)"],
                            selectedUnit: $kpUnit,
                            infoText: "kp_info".localized(language),
                            convertValue: convertWMTemp,
                            isDec: true)
                        CustomSeparator()
                    }
                    Row(paramName: "d",
                        defaultValue: $dValue,
                        units: ["m", "ft"],
                        selectedUnit: $dUnit,
                        infoText: "d_info".localized(language),
                        convertValue: convertMeterFoot,
                        isDec: true)
                }
                .padding(.top, sectionTopPadding)
                .padding(.bottom, sectionBtmPadding)
            }

            Section(header: Text("Borehole Configuration (optional)".localized(language))) {
                VStack(spacing: stackSpacing) {
                    Row(paramName: "Borehole Number".localized(language),
                        defaultValue: $boreholeNumberValue,
                        units: [],
                        selectedUnit: $boreholeNumberUnit,
                        infoText: "Number of boreholes.".localized(language),
                        convertValue: convertUnchanged,
                        isDec: false)
                    CustomSeparator()
                    Row(paramName: "Borehole Length".localized(language),
                        defaultValue: $boreholeLengthValue,
                        units: ["m", "ft"],
                        selectedUnit: $boreholeLengthUnit,
                        infoText: "Max length of a single borehole.".localized(language),
                        convertValue: convertMeterFoot,
                        isDec: true)
                }
                .padding(.top, sectionTopPadding)
                .padding(.bottom, sectionBtmPadding)
            }

            ZStack {
                NavigationLink(destination: IGSHPAHBResultView(calculator: self.HBCalculator), isActive: self.$showResultView) {
                    EmptyView()
                }
                .opacity(0)

                Button(action: {
                    if !inputIsValid {
                        showResultView = false
                        showAlert = true
                    } else {
                        showAlert = false
                        initCalculator()
                        showResultView = true
                    }
                }) {
                    Text("Calculate".localized(language))
                        .font(.system(size: 15, weight: .bold, design: .rounded))
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(colorSchemeManager.selectedColorScheme.color)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }

            .alert(isPresented: $showAlert) {
                Alert(title: Text("Warning".localized(language)),
                      message: Text(alertMessage),
                      dismissButton: .default(Text("OK".localized(language))))
            }
        }.navigationTitle("IGSHPA HB Data Input".localized(language))
            .toolbarMenu()
            .onAppear {
                UITextField.appearance().clearButtonMode = .whileEditing
            }
            .toolbar {
                ToolbarItem(placement: .keyboard) {
                    Spacer()
                }
                ToolbarItem(placement: .keyboard) {
                    Button {
                        hideKeyboard()
                    } label: {
                        Image(systemName: "keyboard.chevron.compact.down")
                    }
                }
            }
    }
}

struct IGSHPAHBInputView_Previews: PreviewProvider {
    static var previews: some View {
        IGSHPAHBInputView()
            .environmentObject(ColorSchemeManager())
    }
}
