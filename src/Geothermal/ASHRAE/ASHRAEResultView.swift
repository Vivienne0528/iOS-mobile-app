//
//  ASHRAEResultView.swift
//  Geothermal
//
//  Created by Yuntian Wan on 17/4/2023.
//

import MessageUI
import ScreenshotSwiftUI
import SwiftUI

struct ASHRAEResultView: View {
    @AppStorage("language") private var language = "en"
    @EnvironmentObject var colorSchemeManager: ColorSchemeManager
    @State private var showPopover = false
    @State private var sendEmail = false
    @State private var sendDesign = false

    @State private var screenshot1: UIImage? = nil
    @State private var takeScreenshot1 = true
    @State private var screenshot2: UIImage? = nil
    @State private var takeScreenshot2 = true
    @State private var screenshot3: UIImage? = nil
    @State private var takeScreenshot3 = true

    @State private var email_Value = ""
    @State private var name_Value = ""
    @State private var phone_Value = ""
    @State private var address_Value = ""
    @State private var country_Value = ""

    @ObservedObject var calculator: ASHRAECalculation

    let inputData: [(String, String, String)]

    let resultData: [(String, String, String)]

    @State var inputDataItems: [ResultDataItem]
    @State var resultItems: [ResultDataItem]
    @State var boreholeNum: String
    @State var boreholeLen: String
    @State var lenUnit = 0

    init(calculator: ASHRAECalculation) {
        self.calculator = calculator
        self.inputData = [
            ("Cp", formatNumber(calculator.GHEThermalCapacity), "J/kg K"),
            ("T(inHP)", formatNumber(calculator.enteringWaterTemp), "℃"),
            ("m(fls)", formatNumber(calculator.massFlowRate), "kg/s kW"),
            ("k", formatNumber(calculator.groundThermalConductivity), "W/m·K"),
            ("α", formatNumber(calculator.groundThermalDiffusivity), "m²/day"),
            ("Tg", formatNumber(calculator.undisturbedGroundTemp), "℃"),
            ("q(y)", formatNumber(calculator.yearAvgGroundLoad), "kW"),
            ("q(m)", formatNumber(calculator.monthGroundLoad), "kW"),
            ("q(h)", formatNumber(calculator.hourGroundLoad), "kW"),
            ("B", formatNumber(calculator.distanceBetweenBoreholes), "m"),
            ("NB", formatNumber(calculator.numberOfBoreholes), ""),
            ("A", formatNumber(calculator.geoAspectRatio), ""),
            ("k(grout)", formatNumber(calculator.groutThermalConductivity), "W/m K"),
            ("r(bore)", formatNumber(calculator.boreholeRadius), "m"),
            ("Lu", formatNumber(calculator.centreDistanceBetweenPipes), "m"),
            ("r(p.in)", formatNumber(calculator.loopInnerRadius), "m"),
            ("k(pipe)", formatNumber(calculator.ULoopPipeThermalConductivity), "W/m K"),
            ("r(p.ext)", formatNumber(calculator.loopOuterRadius), "m"),
            ("h(conv)", formatNumber(calculator.internalConvectionCoefficient), "W/m² K")
        ]
        self.resultData = [
            ("T(outHHP)", formatNumber(calculator.outletWaterTempHeating, 1), "℃"),
            ("T(outCHP)", formatNumber(calculator.outletWaterTempCooling, 1), "℃"),
            ("T(mc)", formatNumber(calculator.meanWaterTempCooling, 1), "℃"),
            ("T(mh)", formatNumber(calculator.meanWaterTempHeating, 1), "℃"),
            ("T(pc)", formatNumber(calculator.tempPenaltyCooling, 1), "℃"),
            ("T(ph)", formatNumber(calculator.tempPenaltyHeating, 1), "℃"),
            ("In(t/ts)", formatNumber(calculator.dimensionlessTime, 1), ""),
            ("F", formatNumber(calculator.correlationFunc, 1), ""),
            ("R(10y)", formatNumber(calculator.tenyearResistance, 1), "m K/W"),
            ("R(1m)", formatNumber(calculator.onemonthResistance, 1), "m K/W"),
            ("R(6h)", formatNumber(calculator.sixhourResistance, 1), "m K/W"),
            ("R(conv)", formatNumber(calculator.innerPipeConvectionResistance, 1), "m K/W"),
            ("R(p)", formatNumber(calculator.pipeConvectionResistance, 1), "m K/W"),
            ("R(grout)", formatNumber(calculator.groutResistance, 1), "m K/W"),
            ("R(b)", formatNumber(calculator.boreholeResistance, 1), "m K/W"),
            ("", "", ""),
            ("L(CU)", formatNumber(calculator.undisturbedCoolingLength, 1), "km"),
            ("L(HU)", formatNumber(calculator.undisturbedHeatingLength, 1), "km"),
            ("L(CT)", formatNumber(calculator.totalCoolingBoreholeLength, 1), "km"),
            ("L(HT)", formatNumber(calculator.totalHeatingBoreholeLength, 1), "km")
        ]
        self.inputDataItems = [
            ResultDataItem(name: "Cp", value: formatNumber(calculator.GHEThermalCapacity), unit: calculator.cpUnit, units: ["J/kg K", "BTU/lb ℉"], convertFunction: convertJKgK),
            ResultDataItem(name: "T(inHP)", value: formatNumber(calculator.enteringWaterTemp), unit: calculator.tInHpUnit, units: ["℃", "℉"], convertFunction: convertTemperature),
            ResultDataItem(name: "m(fls)", value: formatNumber(calculator.massFlowRate), unit: calculator.mFlsUnit, units: ["kg/s kW"], convertFunction: convertKgSKw),
            ResultDataItem(name: "k", value: formatNumber(calculator.groundThermalConductivity), unit: calculator.kUnit, units: ["W/m K", "BTU/h ft ℉"], convertFunction: convertWMK),
            ResultDataItem(name: "α", value: formatNumber(calculator.groundThermalDiffusivity), unit: calculator.alphaUnit, units: ["m²/day", "ft²/day"], convertFunction: convertM2Day),
            ResultDataItem(name: "Tg", value: formatNumber(calculator.undisturbedGroundTemp), unit: calculator.tgUnit, units: ["℃", "℉"], convertFunction: convertTemperature),
            ResultDataItem(name: "q(y)", value: formatNumber(calculator.yearAvgGroundLoad), unit: calculator.qyUnit, units: ["kW", "BTU/h", "TR"], convertFunction: convertWatt),
            ResultDataItem(name: "q(m)", value: formatNumber(calculator.monthGroundLoad), unit: calculator.qmUnit, units: ["kW", "BTU/h", "TR"], convertFunction: convertWatt),
            ResultDataItem(name: "q(h)", value: formatNumber(calculator.hourGroundLoad), unit: calculator.qhUnit, units: ["kW", "BTU/h", "TR"], convertFunction: convertWatt),
            ResultDataItem(name: "B", value: formatNumber(calculator.distanceBetweenBoreholes), unit: calculator.bUnit, units: ["m", "ft"], convertFunction: convertMeterFoot),
            ResultDataItem(name: "NB", value: formatNumber(calculator.numberOfBoreholes), unit: calculator.nbUnit, units: [], convertFunction: convertUnchanged),
            ResultDataItem(name: "A", value: formatNumber(calculator.geoAspectRatio), unit: calculator.aUnit, units: [], convertFunction: convertUnchanged),
            ResultDataItem(name: "k(grout)", value: formatNumber(calculator.groutThermalConductivity), unit: calculator.kGroutUnit, units: ["W/(m⋅℃)", "BTU/(h ft ℉)"], convertFunction: convertWMTemp),
            ResultDataItem(name: "r(bore)", value: formatNumber(calculator.boreholeRadius), unit: calculator.rBoreUnit, units: ["m", "in"], convertFunction: convertMeterInch),
            ResultDataItem(name: "Lu", value: formatNumber(calculator.centreDistanceBetweenPipes), unit: calculator.luUnit, units: ["m", "in"], convertFunction: convertMeterInch),
            ResultDataItem(name: "r(p.in)", value: formatNumber(calculator.loopInnerRadius), unit: calculator.rPinUnit, units: ["m", "in"], convertFunction: convertMeterInch),
            ResultDataItem(name: "k(pipe)", value: formatNumber(calculator.ULoopPipeThermalConductivity), unit: calculator.kPipeUnit, units: ["W/m K", "BTU/h ft ℉"], convertFunction: convertWMK),
            ResultDataItem(name: "r(p.ext)", value: formatNumber(calculator.loopOuterRadius), unit: calculator.rPextUnit, units: ["m", "in"], convertFunction: convertMeterInch),
            ResultDataItem(name: "h(conv)", value: formatNumber(calculator.internalConvectionCoefficient), unit: calculator.hConvUnit, units: ["W/m² K", "BTU/h ft² ℉"], convertFunction: convertWM2K)
        ]
        self.resultItems = [
            ResultDataItem(name: "T(outHHP)", value: formatNumber(calculator.outletWaterTempHeating, 1), unit: 0, units: ["℃", "℉"], convertFunction: convertTemperature),
            ResultDataItem(name: "T(outCHP)", value: formatNumber(calculator.outletWaterTempCooling, 1), unit: 0, units: ["℃", "℉"], convertFunction: convertTemperature),
            ResultDataItem(name: "T(mc)", value: formatNumber(calculator.meanWaterTempCooling, 1), unit: 0, units: ["℃", "℉"], convertFunction: convertTemperature),
            ResultDataItem(name: "T(mh)", value: formatNumber(calculator.meanWaterTempHeating, 1), unit: 0, units: ["℃", "℉"], convertFunction: convertTemperature),
            ResultDataItem(name: "T(pc)", value: formatNumber(calculator.tempPenaltyCooling, 1), unit: 0, units: ["℃", "℉"], convertFunction: convertTemperature),
            ResultDataItem(name: "T(ph)", value: formatNumber(calculator.tempPenaltyHeating, 1), unit: 0, units: ["℃", "℉"], convertFunction: convertTemperature),
            ResultDataItem(name: "In(t/ts)", value: formatNumber(calculator.dimensionlessTime, 1), unit: 0, units: [], convertFunction: convertUnchanged),
            ResultDataItem(name: "F", value: formatNumber(calculator.correlationFunc, 1), unit: 0, units: [], convertFunction: convertUnchanged),
            ResultDataItem(name: "R(10y)", value: formatNumber(calculator.tenyearResistance, 1), unit: 0, units: ["m K/W", "h ft ℉/BTU"], convertFunction: convertMKW),
            ResultDataItem(name: "R(1m)", value: formatNumber(calculator.onemonthResistance, 1), unit: 0, units: ["m K/W", "h ft ℉/BTU"], convertFunction: convertMKW),
            ResultDataItem(name: "R(6h)", value: formatNumber(calculator.sixhourResistance, 1), unit: 0, units: ["m K/W", "h ft ℉/BTU"], convertFunction: convertMKW),
            ResultDataItem(name: "R(conv)", value: formatNumber(calculator.innerPipeConvectionResistance, 1), unit: 0, units: ["m K/W", "h ft ℉/BTU"], convertFunction: convertMKW),
            ResultDataItem(name: "R(p)", value: formatNumber(calculator.pipeConvectionResistance, 1), unit: 0, units: ["m K/W", "h ft ℉/BTU"], convertFunction: convertMKW),
            ResultDataItem(name: "R(grout)", value: formatNumber(calculator.groutResistance, 1), unit: 0, units: ["m K/W", "h ft ℉/BTU"], convertFunction: convertMKW),
            ResultDataItem(name: "R(b)", value: formatNumber(calculator.boreholeResistance, 1), unit: 0, units: ["m K/W", "h ft ℉/BTU"], convertFunction: convertMKW),
            ResultDataItem(name: "", value: "", unit: 0, units: [], convertFunction: nil),
            ResultDataItem(name: "L(CU)", value: formatNumber(calculator.undisturbedCoolingLength, 1), unit: 0, units: ["km", "mi"], convertFunction: convertKm),
            ResultDataItem(name: "L(HU)", value: formatNumber(calculator.undisturbedHeatingLength, 1), unit: 0, units: ["km", "mi"], convertFunction: convertKm),
            ResultDataItem(name: "L(CT)", value: formatNumber(calculator.totalCoolingBoreholeLength, 1), unit: 0, units: ["km", "mi"], convertFunction: convertKm),
            ResultDataItem(name: "L(HT)", value: formatNumber(calculator.totalHeatingBoreholeLength, 1), unit: 0, units: ["km", "mi"], convertFunction: convertKm)
        ]
        self.boreholeNum = String(calculator.numberOfBoreholes)
        self.boreholeLen = String(formatNumber(calculator.boreholeLengthOutput, 1))
    }

    var body: some View {
        let minRowHeight: CGFloat = 35
        List {
            Section(header:
                Text("Input Data".localized(language))
            ) {
                VStack {
                    ForEach(inputDataItems.indices, id: \.self) { index in
                        if index % 2 == 0 {
                            HStack(spacing: 16) {
                                let valueBindingL = Binding<String>(
                                    get: { self.inputDataItems[index].value },
                                    set: { newValue in self.inputDataItems[index].value = newValue }
                                )

                                let unitBindingL = Binding<Int>(
                                    get: { self.inputDataItems[index].unit },
                                    set: { newValue in self.inputDataItems[index].unit = newValue }
                                )

                                ResultDataItemView(name: self.inputDataItems[index].name, value: valueBindingL, selectedUnit: unitBindingL, units: self.inputDataItems[index].units, convertFunction: self.inputDataItems[index].convertFunction)
                                    .frame(maxWidth: .infinity, minHeight: minRowHeight, alignment: .leading)

                                Spacer()

                                if index+1 < inputDataItems.count {
                                    let valueBindingR = Binding<String>(
                                        get: { self.inputDataItems[index+1].value },
                                        set: { newValue in self.inputDataItems[index+1].value = newValue }
                                    )

                                    let unitBindingR = Binding<Int>(
                                        get: { self.inputDataItems[index+1].unit },
                                        set: { newValue in self.inputDataItems[index+1].unit = newValue }
                                    )
                                    ResultDataItemView(name: self.inputDataItems[index+1].name, value: valueBindingR, selectedUnit: unitBindingR, units: self.inputDataItems[index+1].units, convertFunction: self.inputDataItems[index+1].convertFunction)
                                        .frame(maxWidth: .infinity, minHeight: minRowHeight, alignment: .leading)
                                }
                                Spacer()
                            }
                            if index < inputDataItems.count - 2 {
                                CustomSeparator()
                            }
                        }
                    }
                }.screenshotMaker { screenshotMaker in
                    if takeScreenshot1 {
                        screenshot1 = screenshotMaker.screenshot()
                        takeScreenshot1 = false
                    }
                }
            }

            Section(header:
                HStack {
                    Text("Calculated Results".localized(language))
                    Spacer()
                    Button(action: {
                        showPopover.toggle()
                    }) {
                        Image(systemName: "info.circle")
                            .foregroundStyle(colorSchemeManager.selectedColorScheme.color)
                    }
                    .popover(isPresented: $showPopover) {
                        ASHRAEResultInfoView()
                    }
                }) {
                    VStack {
                        ForEach(resultItems.indices, id: \.self) { index in
                            if index % 2 == 0 {
                                HStack(spacing: 16) {
                                    let valueBindingL = Binding<String>(
                                        get: { self.resultItems[index].value },
                                        set: { newValue in self.resultItems[index].value = newValue }
                                    )

                                    let unitBindingL = Binding<Int>(
                                        get: { self.resultItems[index].unit },
                                        set: { newValue in self.resultItems[index].unit = newValue }
                                    )

                                    ResultDataItemView(name: self.resultItems[index].name, value: valueBindingL, selectedUnit: unitBindingL, units: self.resultItems[index].units, convertFunction: self.resultItems[index].convertFunction)
                                        .frame(maxWidth: .infinity, minHeight: minRowHeight, alignment: .leading)

                                    Spacer()

                                    if index+1 < resultItems.count {
                                        let valueBindingR = Binding<String>(
                                            get: { self.resultItems[index+1].value },
                                            set: { newValue in self.resultItems[index+1].value = newValue }
                                        )

                                        let unitBindingR = Binding<Int>(
                                            get: { self.resultItems[index+1].unit },
                                            set: { newValue in self.resultItems[index+1].unit = newValue }
                                        )
                                        ResultDataItemView(name: self.resultItems[index+1].name, value: valueBindingR, selectedUnit: unitBindingR, units: self.resultItems[index+1].units, convertFunction: self.resultItems[index+1].convertFunction)
                                            .frame(maxWidth: .infinity, minHeight: minRowHeight, alignment: .leading)
                                    }
                                    Spacer()
                                }
                                if index < resultItems.count - 2 {
                                    CustomSeparator()
                                }
                            }
                        }
                    }.screenshotMaker { screenshotMaker in
                        if takeScreenshot2 {
                            screenshot2 = screenshotMaker.screenshot()
                            takeScreenshot2 = false
                        }
                    }
                }
            Section(header:
                Text("Recommended Setup".localized(language))
            ) {
                VStack {
                    HStack(spacing: 16) {
                        ResultDataItemView(name: "Number of Boreholes".localized(language), value: $boreholeNum, selectedUnit: $lenUnit, units: [], convertFunction: convertUnchanged)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Spacer()
                        ResultDataItemView(name: "Minimum Boreholes Length".localized(language), value: $boreholeLen, selectedUnit: $lenUnit, units: ["m", "ft"], convertFunction: convertMeterFoot)
                            .frame(maxWidth: .infinity, minHeight: minRowHeight, alignment: .leading)
                        Spacer()
                    }
                    CustomSeparator()
                    VStack(alignment: .leading) {
                        Text("Configuration".localized(language))
                            .font(.subheadline)
                            .foregroundColor(.secondary)

                        ZStack(alignment: .leading) {
                            Image("IGSHPAVB")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                            Text(String(format: "VB config".localized(language), boreholeLen, ["m", "ft"][lenUnit], boreholeNum))
                                .font(.subheadline)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .offset(y: UIScreen.main.bounds.height * 0.09)
                                .padding(.leading, 5)
                        }
                    }
                }.screenshotMaker { screenshotMaker in
                    if takeScreenshot3 {
                        screenshot3 = screenshotMaker.screenshot()
                        takeScreenshot3 = false
                    }
                }
            }

            if screenshot1 != nil {
                // Text("Input image ready")
            }
            if screenshot2 != nil {
                // Text("Result image ready")
            }
            if screenshot3 != nil {
                // Text("Configuration image ready")
            }

            Section(header:
                Text("Send Results To".localized(language))
            ) {
                VStack {
                    TextField("your_email".localized(language), text: $email_Value)
                }

                VStack(alignment: .center) {
                    if MFMailComposeViewController.canSendMail() {
                        Button {
                            sendEmail.toggle()
                        } label: {
                            Text("Send results".localized(language))
                                .foregroundColor(colorSchemeManager.selectedColorScheme.color)
                        }
                    } else {
                        Text("email_error".localized(language))
                            .multilineTextAlignment(.center)
                    }
                }
            }
            Section(header:
                Text("Request Detailed Design".localized(language))
            ) {
                VStack {
                    TextField("your_name".localized(language), text: $name_Value)
                }
                VStack {
                    TextField("your_phone".localized(language), text: $phone_Value)
                }
                VStack {
                    TextField("your_country".localized(language), text: $country_Value)
                }
                VStack {
                    TextField("your_addr".localized(language), text: $address_Value)
                }

                VStack(alignment: .center) {
                    if MFMailComposeViewController.canSendMail() {
                        Button {
                            sendDesign.toggle()
                        } label: {
                            Text("Request detailed design".localized(language))
                                .foregroundColor(colorSchemeManager.selectedColorScheme.color)
                        }
                    } else {
                        Text("email_error".localized(language))
                            .multilineTextAlignment(.center)
                    }
                }
            }
        }
        .navigationTitle("Calculation Result".localized(language))
        .toolbarMenu()
        .onAppear {
            UITextField.appearance().clearButtonMode = .whileEditing
        }
        .sheet(isPresented: $sendEmail) {
            MailView(content: "Please see the attached details.".localized(language), to: email_Value, subject: "ASHRAE "+"Result".localized(language), image1: screenshot1, image2: screenshot2, image3: screenshot3)
        }
        .sheet(isPresented: $sendDesign) {
            MailView(content: "Find attached a copy of the recommended setup. I would like to discuss a professional, detailed GSHP system design. \n My name is: \(name_Value) \n My phone number is: \(phone_Value) \n My country code is: \(country_Value) \n The project site address is: \(address_Value)", to: "info@4ee.com.au", subject: "IGSHPAVB Result", image1: screenshot1, image2: screenshot2, image3: screenshot3)
        }
    }
}

struct ASHRAEResultInfoView: View {
    @AppStorage("language") private var language = "en"

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            // TODO: Maybe add underline to the parameter names like the old app if we have time.
            Text("ASHRAE_result_info".localized(language))
                .textCase(nil)
                .fixedSize(horizontal: false, vertical: true)
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .foregroundColor(Theme.textColor)
    }
}

struct ASHRAEResultViewDemo_Previews: PreviewProvider {
    static var previews: some View {
        ASHRAEResultView(calculator: ASHRAECalculation(loopInnerRadius: 1,
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
                                                       boreholeLength: 21))
            .environmentObject(ColorSchemeManager())
    }
}
