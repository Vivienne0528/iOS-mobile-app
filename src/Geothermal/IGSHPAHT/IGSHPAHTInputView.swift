//
//  IGSHPAVBInput.swift
//  SwiftUI
//
//  Created by Ruiqi Pang/ Haoyuan He on 10/4/2023.
//

import SwiftUI

struct IGSHPAHTInputView: View {
    @AppStorage("language") private var language = "en"
    @EnvironmentObject var colorSchemeManager: ColorSchemeManager

    // Heat Pump Specification
    @State private var copValue: String = "4"
    @State private var eerValue: String = "14.5"
    @State private var hcValue: String = "20"
    @State private var tcValue: String = "20"
    // Heat Pump Design Conditions
    @State private var ewt_minValue: String = "4"
    @State private var lwt_minValue: String = "1"
    @State private var ewt_maxValue: String = "30"
    @State private var lwt_maxValue: String = "34"
    @State private var rt_clgValue: String = "476"
    @State private var rt_htgValue: String = "476"
    // Ground Properties
    @State private var tmValue: String = "24"
    @State private var asValue: String = "-0.1"
    @State private var rsValue: String = "1.6"
    @State private var alphaValue: String = "0.06"
    // Borehole Parameters
    @State private var dpoValue: String = "0.027"
    @State private var dpiValue: String = "0.022"
    @State private var kpValue: String = "0.346"
    @State private var dValue: String = "3.1"
    @State private var smValue: String = "1.2"
    @State private var pmValue: String = "1"
    // Borehole Configuration
    @State private var trenchNumberValue: String = ""
    @State private var pipePerTrenchValue: String = ""

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
    @State private var rsUnit: Int = 0
    @State private var alphaUnit: Int = 0
    // Borehole Parameters Unit
    @State private var dpoUnit: Int = 0
    @State private var dpiUnit: Int = 0
    @State private var kpUnit: Int = 0
    @State private var dUnit: Int = 0
    @State private var smUnit: Int = 0
    @State private var pmUnit: Int = 0
    // Borehole Configuration Unit
    @State private var trenchNumberUnit: Int = 0
    @State private var pipePerTrenchUnit: Int = 0

    // Alert Parameters
    @State private var showAlert = false
    @State private var alertMessage = ""

    // Navigation Parameters
    @State private var showResultView = false

    // IGSHPAHT Calculation Model
    @StateObject var HTCalculator = IGSHPAHTCalculation(heatPumpHeatingCapacity: 1,
                                                        heatPumpCoolingCapacity: 2,
                                                        coefficientOfPerformance: 3,
                                                        energyEfficientRatio: 4,
                                                        meanEarthTempearture: 5,
                                                        minEnteringWaterTemp: 6,
                                                        minLeavingWaterTemp: 7,
                                                        maxEnteringWaterTemp: 8,
                                                        maxLeavingWaterTemp: 9,
                                                        soilResistance: 10,
                                                        trenchSpaceMulti: 11,
                                                        pipeDiameterMulti: 12,
                                                        pipeOuterDiameter: 13,
                                                        pipeInnerDiameter: 14,
                                                        pipeThermalConductivity: 15,
                                                        coolingRunningTime: 16,
                                                        heatingRunningTime: 17,
                                                        avgPipeDepth: 18,
                                                        surfaceTempAmplitude: 19,
                                                        soilThermalDiffusivity: 20,
                                                        trenchNumberInput: 21,
                                                        pipePerTrenchInput: 22)

    func initCalculator() {
        HTCalculator.heatPumpHeatingCapacity = Double(hcValue)!
        HTCalculator.heatPumpCoolingCapacity = Double(tcValue)!
        HTCalculator.energyEfficientRatio = Double(eerValue)!
        HTCalculator.coefficientOfPerformance = Double(copValue)!
        HTCalculator.meanEarthTempearture = Double(tmValue)!
        HTCalculator.minEnteringWaterTemp = Double(ewt_minValue)!
        HTCalculator.minLeavingWaterTemp = Double(lwt_minValue)!
        HTCalculator.maxEnteringWaterTemp = Double(ewt_maxValue)!
        HTCalculator.maxLeavingWaterTemp = Double(lwt_maxValue)!
        HTCalculator.soilResistance = Double(rsValue)!
        HTCalculator.trenchSpaceMulti = Double(smValue)!
        HTCalculator.pipeDiameterMulti = Double(pmValue)!
        HTCalculator.pipeOuterDiameter = Double(dpoValue)!
        HTCalculator.pipeInnerDiameter = Double(dpiValue)!
        HTCalculator.pipeThermalConductivity = Double(kpValue)!
        HTCalculator.coolingRunningTime = Double(rt_clgValue)!
        HTCalculator.heatingRunningTime = Double(rt_htgValue)!
        HTCalculator.avgPipeDepth = Double(dValue)!
        HTCalculator.surfaceTempAmplitude = Double(asValue)!
        HTCalculator.soilThermalDiffusivity = Double(alphaValue)!

        if trenchNumberValue.isEmpty {
            HTCalculator.trenchNumberInput = 0
        } else {
            HTCalculator.trenchNumberInput = Double(trenchNumberValue)!
        }

        if pipePerTrenchValue.isEmpty {
            HTCalculator.pipePerTrenchInput = 0
        } else {
            HTCalculator.pipePerTrenchInput = Double(pipePerTrenchValue)!
        }

        HTCalculator.copUnit = copUnit
        HTCalculator.eerUnit = eerUnit
        HTCalculator.hcUnit = hcUnit
        HTCalculator.tcUnit = tcUnit
        HTCalculator.ewtMinUnit = ewtMinUnit
        HTCalculator.lwtMinUnit = lwtMinUnit
        HTCalculator.ewtMaxUnit = ewtMaxUnit
        HTCalculator.lwtMaxUnit = lwtMaxUnit
        HTCalculator.rtClgUnit = rtClgUnit
        HTCalculator.rtHtgUnit = rtHtgUnit
        HTCalculator.tmUnit = tmUnit
        HTCalculator.asUnit = asUnit
        HTCalculator.rsUnit = rsUnit
        HTCalculator.alphaUnit = alphaUnit
        HTCalculator.dpoUnit = dpoUnit
        HTCalculator.dpiUnit = dpiUnit
        HTCalculator.kpUnit = kpUnit
        HTCalculator.dUnit = dUnit
        HTCalculator.smUnit = smUnit
        HTCalculator.pmUnit = pmUnit
    }

    // Input Validation
    var inputIsValid: Bool {
        if copValue.isEmpty || eerValue.isEmpty || hcValue.isEmpty || tcValue.isEmpty || ewt_minValue.isEmpty || lwt_minValue.isEmpty || ewt_maxValue.isEmpty || lwt_maxValue.isEmpty || rt_clgValue.isEmpty || rt_htgValue.isEmpty || tmValue.isEmpty || asValue.isEmpty || rsValue.isEmpty || alphaValue.isEmpty || dpoValue.isEmpty || dpiValue.isEmpty || kpValue.isEmpty || dValue.isEmpty || smValue.isEmpty || pmValue.isEmpty {
            alertMessage = "Please fill in all required fields.".localized(language)
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
                            defaultValue: $ewt_minValue,
                            units: ["℃", "℉"],
                            selectedUnit: $ewtMinUnit,
                            infoText: "ewt_min_info".localized(language),
                            convertValue: convertTemperature,
                            isDec: true)
                        CustomSeparator()
                        Row(paramName: "LWT(min)",
                            defaultValue: $lwt_minValue,
                            units: ["℃", "℉"],
                            selectedUnit: $lwtMinUnit,
                            infoText: "lwt_min_info".localized(language),
                            convertValue: convertTemperature,
                            isDec: true)
                        CustomSeparator()
                        Row(paramName: "EWT(max)",
                            defaultValue: $ewt_maxValue,
                            units: ["℃", "℉"],
                            selectedUnit: $ewtMaxUnit,
                            infoText: "ewt_max_info".localized(language),
                            convertValue: convertTemperature,
                            isDec: true)
                        CustomSeparator()
                        Row(paramName: "LWT(max)",
                            defaultValue: $lwt_maxValue,
                            units: ["℃", "℉"],
                            selectedUnit: $lwtMaxUnit,
                            infoText: "lwt_max_info".localized(language),
                            convertValue: convertTemperature,
                            isDec: true)
                        CustomSeparator()
                        Row(paramName: "RT(CLG)",
                            defaultValue: $rt_clgValue,
                            units: ["h"],
                            selectedUnit: $rtClgUnit,
                            infoText: "rt_clg_info".localized(language),
                            convertValue: convertHour,
                            isDec: true)
                        CustomSeparator()
                    }
                    Row(paramName: "RT(HTG)",
                        defaultValue: $rt_htgValue,
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
                    Row(paramName: "R(S)",
                        defaultValue: $rsValue,
                        units: ["m ℃/W", "h ft ℉/BTU"],
                        selectedUnit: $rsUnit,
                        infoText: "rs_info".localized(language),
                        convertValue: convertMTempW,
                        isDec: true)
                    CustomSeparator()
                    Row(paramName: "ɑ",
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

            Section(header: Text("Trench Pipe Parameters".localized(language))) {
                VStack(spacing: stackSpacing) {
                    Group {
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
                        Row(paramName: "k(P)",
                            defaultValue: $kpValue,
                            units: ["W/(m⋅℃)", "BTU/(h ft ℉)"],
                            selectedUnit: $kpUnit,
                            infoText: "kp_info".localized(language),
                            convertValue: convertWMTemp,
                            isDec: true)
                        CustomSeparator()
                        Row(paramName: "d",
                            defaultValue: $dValue,
                            units: ["m", "ft"],
                            selectedUnit: $dUnit,
                            infoText: "d_info".localized(language),
                            convertValue: convertMeterFoot,
                            isDec: true)
                        CustomSeparator()
                        Row(paramName: "S(M)",
                            defaultValue: $smValue,
                            units: [],
                            selectedUnit: $smUnit,
                            infoText: "sm_info".localized(language),
                            convertValue: convertUnchanged,
                            isDec: true)
                        CustomSeparator()
                    }
                    Row(paramName: "P(M)",
                        defaultValue: $pmValue,
                        units: [],
                        selectedUnit: $pmUnit,
                        infoText: "pm_info".localized(language),
                        convertValue: convertUnchanged,
                        isDec: true)
                }
                .padding(.top, sectionTopPadding)
                .padding(.bottom, sectionBtmPadding)
            }

            Section(header: Text("Trench Configuration (optional)".localized(language))) {
                VStack(spacing: stackSpacing) {
                    Row(paramName: "Number of Trenches".localized(language),
                        defaultValue: $trenchNumberValue,
                        units: [],
                        selectedUnit: $trenchNumberUnit,
                        infoText: "Number of Trenches.".localized(language),
                        convertValue: convertUnchanged,
                        isDec: false)
                    CustomSeparator()
                    Row(paramName: "Pipes Per Trench".localized(language),
                        defaultValue: $pipePerTrenchValue,
                        units: [],
                        selectedUnit: $pipePerTrenchUnit,
                        infoText: "Number of Pipes in each Trench.".localized(language),
                        convertValue: convertUnchanged,
                        isDec: false)
                }
                .padding(.top, sectionTopPadding)
                .padding(.bottom, sectionBtmPadding)
            }

            ZStack {
                NavigationLink(destination: IGSHPAHTResultView(calculator: self.HTCalculator), isActive: self.$showResultView) {
                    EmptyView()
                }
                .opacity(0)

                Button(action: {
                    if !inputIsValid {
                        showAlert = true
                        showResultView = false
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
        }.navigationTitle("IGSHPA HT Data Input".localized(language))
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

struct IGSHPAHTInput_Previews: PreviewProvider {
    static var previews: some View {
        IGSHPAHTInputView()
            .environmentObject(ColorSchemeManager())
    }
}
