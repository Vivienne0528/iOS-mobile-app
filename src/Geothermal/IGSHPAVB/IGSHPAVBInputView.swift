//
//  IGSHPAVBInputView.swift
//  Geothermal
//
//  Created by Ruiqi Pang/ Haoyuan He on 10/4/2023.
//

import SwiftUI

struct IGSHPAVBInputView: View {
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
    @State private var kgValue: String = "1.73"
    @State private var tgValue: String = "18"
    @State private var dgoValue: String = "4.572"
    // Borehole Parameters
    @State private var dbValue: String = "0.128"
    @State private var dpoValue: String = "0.027"
    @State private var dpiValue: String = "0.022"
    @State private var kGroutValue: String = "0.692"
    @State private var kpValue: String = "0.346"
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
    @State private var kgUnit: Int = 0
    @State private var tgUnit: Int = 0
    @State private var dgoUnit: Int = 0
    // Borehole Parameters Unit
    @State private var dbUnit: Int = 0
    @State private var dpoUnit: Int = 0
    @State private var dpiUnit: Int = 0
    @State private var kGroutUnit: Int = 0
    @State private var kpUnit: Int = 0
    // Borehole Configuration Unit
    @State private var boreholeNumberUnit: Int = 0
    @State private var boreholeLengthUnit: Int = 0

    // IGSHPAVB Calculation Model
    @StateObject var VBCalculator = IGSHPAVBCalculation(heatPumpHeatingCapacity: 1,
                                                        heatPumpCoolingCapacity: 2,
                                                        coefficientOfPerformance: 3,
                                                        energyEfficientRatio: 4,
                                                        deepEarthTempearture: 5,
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
                                                        boreholeNumberInput: 19,
                                                        boreholeLengthInput: 20)
    func initCalculator() {
        VBCalculator.heatPumpHeatingCapacity = Double(hcValue)!
        VBCalculator.coefficientOfPerformance = Double(copValue)!
        VBCalculator.heatPumpCoolingCapacity = Double(tcValue)!
        VBCalculator.energyEfficientRatio = Double(eerValue)!
        VBCalculator.deepEarthTempearture = Double(tgValue)!
        VBCalculator.minEnteringWaterTemp = Double(ewtMinValue)!
        VBCalculator.minLeavingWaterTemp = Double(lwtMinValue)!
        VBCalculator.maxEnteringWaterTemp = Double(ewtMaxValue)!
        VBCalculator.maxLeavingWaterTemp = Double(lwtMaxValue)!
        VBCalculator.groundThermalConductivity = Double(kgValue)!
        VBCalculator.groundHeatTransferDiameter = Double(dgoValue)!
        VBCalculator.boreholeDiameter = Double(dbValue)!
        VBCalculator.pipeOuterDiameter = Double(dpoValue)!
        VBCalculator.pipeInnerDiameter = Double(dpiValue)!
        VBCalculator.groutThermalConductivity = Double(kGroutValue)!
        VBCalculator.pipeThermalConductivity = Double(kpValue)!
        VBCalculator.coolingRunningTime = Double(rtClgValue)!
        VBCalculator.heatingRunningTime = Double(rtHtgValue)!

        if boreholeNumberValue.isEmpty {
            VBCalculator.boreholeNumberInput = 0
        } else {
            VBCalculator.boreholeNumberInput = Double(boreholeNumberValue)!
        }

        if boreholeLengthValue.isEmpty {
            VBCalculator.boreholeLengthInput = 0
        } else {
            VBCalculator.boreholeLengthInput = Double(boreholeLengthValue)!
        }

        VBCalculator.copUnit = copUnit
        VBCalculator.eerUnit = eerUnit
        VBCalculator.hcUnit = hcUnit
        VBCalculator.tcUnit = tcUnit
        VBCalculator.ewtMinUnit = ewtMinUnit
        VBCalculator.lwtMinUnit = lwtMinUnit
        VBCalculator.ewtMaxUnit = ewtMaxUnit
        VBCalculator.lwtMaxUnit = lwtMaxUnit
        VBCalculator.rtClgUnit = rtClgUnit
        VBCalculator.rtHtgUnit = rtHtgUnit
        VBCalculator.kgUnit = kgUnit
        VBCalculator.tgUnit = tgUnit
        VBCalculator.dgoUnit = dgoUnit
        VBCalculator.dbUnit = dbUnit
        VBCalculator.dpoUnit = dpoUnit
        VBCalculator.dpiUnit = dpiUnit
        VBCalculator.kGroutUnit = kGroutUnit
        VBCalculator.kpUnit = kpUnit
        VBCalculator.boreholeLengthUnit = boreholeLengthUnit
    }

    // Alert Parameters
    @State private var showAlert = false
    @State private var alertMessage = ""

    // Navigation Parameters
    @State private var showResultView = false

    // Input Validation
    var inputIsValid: Bool {
        if copValue.isEmpty || eerValue.isEmpty || hcValue.isEmpty || tcValue.isEmpty || ewtMinValue.isEmpty || lwtMinValue.isEmpty || ewtMaxValue.isEmpty || lwtMaxValue.isEmpty || rtClgValue.isEmpty || rtHtgValue.isEmpty || kgValue.isEmpty || tgValue.isEmpty || dgoValue.isEmpty || dbValue.isEmpty || dpoValue.isEmpty || dpiValue.isEmpty || kGroutValue.isEmpty || kpValue.isEmpty {
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
                    Row(paramName: "k(G)",
                        defaultValue: $kgValue,
                        units: ["W/(m⋅℃)", "BTU/(h ft ℉)"],
                        selectedUnit: $kgUnit,
                        infoText: "kg_info".localized(language),
                        convertValue: convertWMTemp,
                        isDec: true)
                    CustomSeparator()
                    Row(paramName: "T(G)",
                        defaultValue: $tgValue,
                        units: ["℃", "℉"],
                        selectedUnit: $tgUnit,
                        infoText: "tg_info".localized(language),
                        convertValue: convertTemperature,
                        isDec: true)
                    CustomSeparator()
                    Row(paramName: "D(G,O)",
                        defaultValue: $dgoValue,
                        units: ["m", "ft"],
                        selectedUnit: $dgoUnit,
                        infoText: "dgo_info".localized(language),
                        convertValue: convertMeterFoot,
                        isDec: true)
                }
                .padding(.top, sectionTopPadding)
                .padding(.bottom, sectionBtmPadding)
            }

            Section(header: Text("Borehole Parameters".localized(language))) {
                VStack(spacing: stackSpacing) {
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
                NavigationLink(destination: IGSHPAVBResultView(calculator: self.VBCalculator), isActive: self.$showResultView) {
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
        }.navigationTitle("IGSHPA VB Data Input".localized(language))
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

struct IGSHPAVBInput_Previews: PreviewProvider {
    static var previews: some View {
        IGSHPAVBInputView()
            .environmentObject(ColorSchemeManager())
    }
}
