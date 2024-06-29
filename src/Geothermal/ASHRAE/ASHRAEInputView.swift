//
//  ASHRAEInputView.swift
//  Geothermal
//
//  Created by Ruiqi Pang/Haoyuan He on 13/4/2023.
//

import SwiftUI

struct ASHRAEInputView: View {
    @AppStorage("language") private var language = "en"
    @EnvironmentObject var colorSchemeManager: ColorSchemeManager
    // Heat Pump Specification
    @State private var cpValue: String = "4000"
    @State private var tInHpValue: String = "4.4"
    @State private var mFlsValue: String = "0.074"
    // Ground Properties
    @State private var alphaValue: String = "0.06"
    @State private var kValue: String = "1.73"
    @State private var tgValue: String = "12.41"
    @State private var qyValue: String = "-1.762"
    @State private var qmValue: String = "-100"
    @State private var qhValue: String = "-392.25"
    // Borehole Parameters
    @State private var bValue: String = "6.1"
    @State private var nbValue: String = "120"
    @State private var aValue: String = "1.2"
    @State private var rBoreValue: String = "0.054"
    @State private var kGroutValue: String = "0.692"
    @State private var luValue: String = "0.0471"
    @State private var rPinValue: String = "0.0137"
    @State private var rPextValue: String = "0.0167"
    @State private var kPipeValue: String = "0.346"
    @State private var hConvValue: String = "1000"

    // Heat Pump Specification Unit
    @State private var cpUnit: Int = 0
    @State private var tInHpUnit: Int = 0
    @State private var mFlsUnit: Int = 0
    // Ground Properties Unit
    @State private var alphaUnit: Int = 0
    @State private var kUnit: Int = 0
    @State private var tgUnit: Int = 0
    @State private var qyUnit: Int = 0
    @State private var qmUnit: Int = 0
    @State private var qhUnit: Int = 0
    // Borehole Parameters Unit
    @State private var bUnit: Int = 0
    @State private var nbUnit: Int = 0
    @State private var aUnit: Int = 0
    @State private var rBoreUnit: Int = 0
    @State private var kGroutUnit: Int = 0
    @State private var luUnit: Int = 0
    @State private var rPinUnit: Int = 0
    @State private var rPextUnit: Int = 0
    @State private var kPipeUnit: Int = 0
    @State private var hConvUnit: Int = 0

    // Alert Parameters
    @State private var showAlert = false
    @State private var alertMessage = ""

    // Navigation Parameters
    @State private var showResultView = false

    // ASHRAE Calculation Model
    @StateObject var ASHRAECalculator = ASHRAECalculation(loopInnerRadius: 1,
                                                          loopOuterRadius: 2,
                                                          boreholeRadius: 3,
                                                          groundThermalConductivity: 4,
                                                          groutThermalConductivity: 5,
                                                          ULoopPipeThermalConductivity: 6,
                                                          centreDistanceBetweenPipes: 7,
                                                          internalConvectionCoefficient: 8,
                                                          groundThermalDiffusivity: 9,
                                                          enteringWaterTemp: 10,
                                                          massFlowRate: 11,
                                                          GHEThermalCapacity: 12,
                                                          distanceBetweenBoreholes: 13,
                                                          numberOfBoreholes: 14,
                                                          geoAspectRatio: 15,
                                                          undisturbedGroundTemp: 16,
                                                          yearAvgGroundLoad: 17,
                                                          monthGroundLoad: 18,
                                                          hourGroundLoad: 19,
                                                          boreholeNumber: 20,
                                                          boreholeLength: 21)

    func initCalculator() {
        ASHRAECalculator.loopInnerRadius = Double(rPinValue)!
        ASHRAECalculator.loopOuterRadius = Double(rPextValue)!
        ASHRAECalculator.boreholeRadius = Double(rBoreValue)!
        ASHRAECalculator.groundThermalConductivity = Double(kValue)!
        ASHRAECalculator.groutThermalConductivity = Double(kGroutValue)!
        ASHRAECalculator.ULoopPipeThermalConductivity = Double(kPipeValue)!
        ASHRAECalculator.centreDistanceBetweenPipes = Double(luValue)!
        ASHRAECalculator.internalConvectionCoefficient = Double(hConvValue)!
        ASHRAECalculator.groundThermalDiffusivity = Double(alphaValue)!
        ASHRAECalculator.enteringWaterTemp = Double(tInHpValue)!
        ASHRAECalculator.massFlowRate = Double(mFlsValue)!
        ASHRAECalculator.GHEThermalCapacity = Double(cpValue)!
        ASHRAECalculator.distanceBetweenBoreholes = Double(bValue)!
        ASHRAECalculator.numberOfBoreholes = Double(nbValue)!
        ASHRAECalculator.geoAspectRatio = Double(aValue)!
        ASHRAECalculator.undisturbedGroundTemp = Double(tgValue)!
        ASHRAECalculator.yearAvgGroundLoad = Double(qyValue)!
        ASHRAECalculator.monthGroundLoad = Double(qmValue)!
        ASHRAECalculator.hourGroundLoad = Double(qhValue)!
        ASHRAECalculator.boreholeNumberInput = 0
        ASHRAECalculator.boreholeLengthInput = 0

        ASHRAECalculator.cpUnit = cpUnit
        ASHRAECalculator.tInHpUnit = tInHpUnit
        ASHRAECalculator.mFlsUnit = mFlsUnit
        ASHRAECalculator.alphaUnit = alphaUnit
        ASHRAECalculator.kUnit = kUnit
        ASHRAECalculator.tgUnit = tgUnit
        ASHRAECalculator.qyUnit = qyUnit
        ASHRAECalculator.qmUnit = qmUnit
        ASHRAECalculator.qhUnit = qhUnit
        ASHRAECalculator.bUnit = bUnit
        ASHRAECalculator.nbUnit = nbUnit
        ASHRAECalculator.aUnit = aUnit
        ASHRAECalculator.rBoreUnit = rBoreUnit
        ASHRAECalculator.kGroutUnit = kGroutUnit
        ASHRAECalculator.luUnit = luUnit
        ASHRAECalculator.rPinUnit = rPinUnit
        ASHRAECalculator.rPextUnit = rPextUnit
        ASHRAECalculator.kPipeUnit = kPipeUnit
        ASHRAECalculator.hConvUnit = hConvUnit
    }

    // Input Validation
    var inputIsValid: Bool {
        if cpValue.isEmpty || tInHpValue.isEmpty || mFlsValue.isEmpty || alphaValue.isEmpty || kValue.isEmpty || tgValue.isEmpty || qyValue.isEmpty || qmValue.isEmpty || qhValue.isEmpty || bValue.isEmpty || nbValue.isEmpty || aValue.isEmpty || rBoreValue.isEmpty || kGroutValue.isEmpty || luValue.isEmpty || rPinValue.isEmpty || rPextValue.isEmpty || kPipeValue.isEmpty || hConvValue.isEmpty {
            alertMessage = "Please fill in all required fields.".localized(language)
            return false
        }
        return true
    }

    var body: some View {
        let stackSpacing: CGFloat = 5
        let sectionTopPadding: CGFloat = -4
        let sectionBtmPadding: CGFloat = -3
        Form {
            Section(header: Text("Heat Pump Specification".localized(language))) {
                VStack(spacing: stackSpacing) {
                    Row(paramName: "Cp",
                        defaultValue: $cpValue,
                        units: ["J/kg K", "BTU/lb ℉"],
                        selectedUnit: $cpUnit,
                        infoText: "cp_info".localized(language),
                        convertValue: convertJKgK,
                        isDec: true)
                    CustomSeparator()
                    Row(paramName: "T(inHP)",
                        defaultValue: $tInHpValue,
                        units: ["℃", "℉"],
                        selectedUnit: $tInHpUnit,
                        infoText: "tinhp_info".localized(language),
                        convertValue: convertTemperature,
                        isDec: true)
                    CustomSeparator()
                    Row(paramName: "m(fls)",
                        defaultValue: $mFlsValue,
                        units: ["kg/s kW"],
                        selectedUnit: $mFlsUnit,
                        infoText: "mfls_info".localized(language),
                        convertValue: convertKgSKw,
                        isDec: true)
                }
                .padding(.top, sectionTopPadding)
                .padding(.bottom, sectionBtmPadding)
            }
            Section(header: Text("Ground Properties".localized(language))) {
                VStack(spacing: stackSpacing) {
                    Group {
                        Row(paramName: "α",
                            defaultValue: $alphaValue,
                            units: ["m²/day", "ft²/day"],
                            selectedUnit: $alphaUnit,
                            infoText: "alpha_info".localized(language),
                            convertValue: convertM2Day,
                            isDec: true)
                        CustomSeparator()
                        Row(paramName: "k",
                            defaultValue: $kValue,
                            units: ["W/m K", "BTU/h ft ℉"],
                            selectedUnit: $kUnit,
                            infoText: "k_info".localized(language),
                            convertValue: convertWMK,
                            isDec: true)
                        CustomSeparator()
                        Row(paramName: "Tg",
                            defaultValue: $tgValue,
                            units: ["℃", "℉"],
                            selectedUnit: $tgUnit,
                            infoText: "tg_info".localized(language),
                            convertValue: convertTemperature,
                            isDec: true)
                        CustomSeparator()
                        Row(paramName: "q(y)",
                            defaultValue: $qyValue,
                            units: ["kW", "BTU/h", "TR"],
                            selectedUnit: $qyUnit,
                            infoText: "qy_info".localized(language),
                            convertValue: convertWatt,
                            isDec: true)
                        CustomSeparator()
                        Row(paramName: "q(m)",
                            defaultValue: $qmValue,
                            units: ["kW", "BTU/h", "TR"],
                            selectedUnit: $qmUnit,
                            infoText: "qm_info".localized(language),
                            convertValue: convertWatt,
                            isDec: true)
                        CustomSeparator()
                    }
                    Row(paramName: "q(h)",
                        defaultValue: $qhValue,
                        units: ["kW", "BTU/h", "TR"],
                        selectedUnit: $qhUnit,
                        infoText: "qh_info".localized(language),
                        convertValue: convertWatt,
                        isDec: true)
                }
                .padding(.top, sectionTopPadding)
                .padding(.bottom, sectionBtmPadding)
            }
            Section(header: Text("Borehole Parameters".localized(language))) {
                VStack(spacing: stackSpacing) {
                    Group {
                        Row(paramName: "B",
                            defaultValue: $bValue,
                            units: ["m", "ft"],
                            selectedUnit: $bUnit,
                            infoText: "b_info".localized(language),
                            convertValue: convertMeterFoot,
                            isDec: true)
                        CustomSeparator()
                        Row(paramName: "NB",
                            defaultValue: $nbValue,
                            units: [],
                            selectedUnit: $nbUnit,
                            infoText: "nb_info".localized(language),
                            convertValue: convertUnchanged,
                            isDec: false)
                        CustomSeparator()
                        Row(paramName: "A",
                            defaultValue: $aValue,
                            units: [],
                            selectedUnit: $aUnit,
                            infoText: "a_info".localized(language),
                            convertValue: convertUnchanged,
                            isDec: true)
                        CustomSeparator()
                        Row(paramName: "r(bore)",
                            defaultValue: $rBoreValue,
                            units: ["m", "in"],
                            selectedUnit: $rBoreUnit,
                            infoText: "rbore_info".localized(language),
                            convertValue: convertMeterInch,
                            isDec: true)
                        CustomSeparator()
                        Row(paramName: "k(grout)",
                            defaultValue: $kGroutValue,
                            units: ["W/m K", "BTU/h ft ℉"],
                            selectedUnit: $kGroutUnit,
                            infoText: "k_grout_info".localized(language),
                            convertValue: convertWMK,
                            isDec: true)
                        CustomSeparator()
                    }
                    Group {
                        Row(paramName: "Lu",
                            defaultValue: $luValue,
                            units: ["m", "in"],
                            selectedUnit: $luUnit,
                            infoText: "lu_info".localized(language),
                            convertValue: convertMeterInch,
                            isDec: true)
                        CustomSeparator()
                        Row(paramName: "r(p,in)",
                            defaultValue: $rPinValue,
                            units: ["m", "in"],
                            selectedUnit: $rPinUnit,
                            infoText: "rpin_info".localized(language),
                            convertValue: convertMeterInch,
                            isDec: true)
                        CustomSeparator()
                        Row(paramName: "r(p,ext)",
                            defaultValue: $rPextValue,
                            units: ["m", "in"],
                            selectedUnit: $rPextUnit,
                            infoText: "rpext_info".localized(language),
                            convertValue: convertMeterInch,
                            isDec: true)
                        CustomSeparator()
                        Row(paramName: "k(pipe)",
                            defaultValue: $kPipeValue,
                            units: ["W/m K", "BTU/h ft ℉"],
                            selectedUnit: $kPipeUnit,
                            infoText: "kpipe_info".localized(language),
                            convertValue: convertWMK,
                            isDec: true)
                        CustomSeparator()
                        Row(paramName: "h(conv)",
                            defaultValue: $hConvValue,
                            units: ["W/m² K", "BTU/h ft² ℉"],
                            selectedUnit: $hConvUnit,
                            infoText: "hconv_info".localized(language),
                            convertValue: convertWM2K,
                            isDec: true)
                    }
                }
                .padding(.top, sectionTopPadding)
                .padding(.bottom, sectionBtmPadding)
            }

            // Temporarily disabled until further notice from client.
//            Section(header: Text("Borehole Configuration (optional)")) {
//                Row(paramName: "Borehole Number",
//                    defaultValue: $boreholeNumberValue,
//                    units: [],
//                    selectedUnit: $boreholeNumberUnit,
//                    infoText: "Number of boreholes.",
//                    convertValue: convertUnchanged,
//                    isDec: false)
//                Row(paramName: "Borehole Length",
//                    defaultValue: $boreholeLengthValue,
//                    units: ["m", "ft"],
//                    selectedUnit: $boreholeLengthUnit,
//                    infoText: "Max length of a single borehole.",
//                    convertValue: convertMeterFoot,
//                    isDec: true)
//            }

            ZStack {
                NavigationLink(destination: ASHRAEResultView(calculator: self.ASHRAECalculator), isActive: self.$showResultView) {
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

//                if inputIsValid {
//                    NavigationLink(destination: ASHRAEResultViewDemo(calculator: ASHRAECalculator)) {}
//                        .frame(width: 0, height: 0)
//                        .opacity(0)
//                }
            }.alert(isPresented: $showAlert) {
                Alert(title: Text("Warning".localized(language)),
                      message: Text(alertMessage),
                      dismissButton: .default(Text("OK".localized(language))))
            }

        }.navigationTitle("ASHRAE Data Input".localized(language))
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

struct ASHRAEInputView_Previews: PreviewProvider {
    static var previews: some View {
        ASHRAEInputView()
            .environmentObject(ColorSchemeManager())
    }
}
