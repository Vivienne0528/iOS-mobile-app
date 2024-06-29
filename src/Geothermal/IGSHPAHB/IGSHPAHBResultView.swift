//
//  IGSHPAHBResultView.swift
//  Geothermal
//
//  Created by Yuntian Wan on 22/4/2023.
//

import MessageUI
import ScreenshotSwiftUI
import SwiftUI

struct IGSHPAHBResultView: View {
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

    @ObservedObject var calculator: IGSHPAHBCalculation

    @State var inputDataItems: [ResultDataItem]
    @State var resultItems: [ResultDataItem]
    @State var boreholeNum: String
    @State var boreholeLen: String
    @State var lenUnit = 0

    init(calculator: IGSHPAHBCalculation) {
        self.calculator = calculator
        self.inputDataItems = [
            ResultDataItem(name: "COP(D)", value: formatNumber(calculator.coefficientOfPerformance), unit: calculator.copUnit, units: [], convertFunction: convertUnchanged),
            ResultDataItem(name: "EER(D)", value: formatNumber(calculator.energyEfficientRatio), unit: calculator.eerUnit, units: [], convertFunction: convertUnchanged),
            ResultDataItem(name: "HC(D)", value: formatNumber(calculator.heatPumpHeatingCapacity), unit: calculator.hcUnit, units: ["kW", "BTU/h", "TR"], convertFunction: convertWatt),
            ResultDataItem(name: "TC(D)", value: formatNumber(calculator.heatPumpCoolingCapacity), unit: calculator.tcUnit, units: ["kW", "BTU/h", "TR"], convertFunction: convertWatt),
            ResultDataItem(name: "EWT(min)", value: formatNumber(calculator.minEnteringWaterTemp), unit: calculator.ewtMinUnit, units: ["℃", "℉"], convertFunction: convertTemperature),
            ResultDataItem(name: "LWT(min)", value: formatNumber(calculator.maxEnteringWaterTemp), unit: calculator.lwtMinUnit, units: ["℃", "℉"], convertFunction: convertTemperature),
            ResultDataItem(name: "EWT(max)", value: formatNumber(calculator.maxEnteringWaterTemp), unit: calculator.ewtMaxUnit, units: ["℃", "℉"], convertFunction: convertTemperature),
            ResultDataItem(name: "LWT(max)", value: formatNumber(calculator.maxLeavingWaterTemp), unit: calculator.lwtMaxUnit, units: ["℃", "℉"], convertFunction: convertTemperature),
            ResultDataItem(name: "RT(CLG)", value: formatNumber(calculator.coolingRunningTime), unit: calculator.rtClgUnit, units: ["h"], convertFunction: convertHour),
            ResultDataItem(name: "RT(HTG)", value: formatNumber(calculator.heatingRunningTime), unit: calculator.rtHtgUnit, units: ["h"], convertFunction: convertHour),
            ResultDataItem(name: "T(M)", value: formatNumber(calculator.meanEarthTempearture), unit: calculator.tmUnit, units: ["℃", "℉"], convertFunction: convertTemperature),
            ResultDataItem(name: "A(S)", value: formatNumber(calculator.surfaceTempAmplitude), unit: calculator.asUnit, units: ["℃", "℉"], convertFunction: convertTemperature),
            ResultDataItem(name: "k(G)", value: formatNumber(calculator.groutThermalConductivity), unit: calculator.kgUnit, units: ["W/(m⋅℃)", "BTU/(h ft ℉)"], convertFunction: convertWMTemp),
            ResultDataItem(name: "D(G,O)", value: formatNumber(calculator.groundHeatTransferDiameter), unit: calculator.dgoUnit, units: ["m", "ft"], convertFunction: convertMeterFoot),
            ResultDataItem(name: "α", value: formatNumber(calculator.soilThermalDiffusivity), unit: calculator.alphaUnit, units: ["m²/day", "ft²/day"], convertFunction: convertM2Day),
            ResultDataItem(name: "D(B)", value: formatNumber(calculator.boreholeDiameter), unit: calculator.dbUnit, units: ["m", "in"], convertFunction: convertMeterInch),
            ResultDataItem(name: "D(P,O)", value: formatNumber(calculator.pipeOuterDiameter), unit: calculator.dpoUnit, units: ["m", "in"], convertFunction: convertMeterInch),
            ResultDataItem(name: "D(P,I)", value: formatNumber(calculator.pipeInnerDiameter), unit: calculator.dpiUnit, units: ["m", "in"], convertFunction: convertMeterInch),
            ResultDataItem(name: "k(Grout)", value: formatNumber(calculator.groutThermalConductivity), unit: calculator.kGroutUnit, units: ["W/(m⋅℃)", "BTU/(h ft ℉)"], convertFunction: convertWMTemp),
            ResultDataItem(name: "k(P)", value: formatNumber(calculator.pipeThermalConductivity), unit: calculator.kpUnit, units: ["W/(m⋅℃)", "BTU/(h ft ℉)"], convertFunction: convertWMTemp),
            ResultDataItem(name: "d", value: formatNumber(calculator.avgPipeDepth), unit: calculator.dUnit, units: ["m", "ft"], convertFunction: convertMeterFoot)
        ]
        self.resultItems = [
            ResultDataItem(name: "R(G)", value: formatNumber(calculator.groundThermalResistance, 1), unit: 0, units: ["m ℃/W", "h ft ℉/BTU"], convertFunction: convertMTempW),
            ResultDataItem(name: "S(B)", value: formatNumber(calculator.boreholeShapeFactor, 1), unit: 0, units: [], convertFunction: convertUnchanged),
            ResultDataItem(name: "R(PP)", value: formatNumber(calculator.pipeWallThermalResistance, 1), unit: 0, units: ["m ℃/W", "h ft ℉/BTU"], convertFunction: convertMTempW),
            ResultDataItem(name: "R(Grout)", value: formatNumber(calculator.groutThermalResistance, 1), unit: 0, units: ["m ℃/W", "h ft ℉/BTU"], convertFunction: convertMTempW),
            ResultDataItem(name: "R(B)", value: formatNumber(calculator.boreholeThermalResistance, 1), unit: 0, units: ["m ℃/W", "h ft ℉/BTU"], convertFunction: convertMTempW),
            ResultDataItem(name: "", value: "", unit: 0, units: [], convertFunction: nil),
            ResultDataItem(name: "F(H)", value: formatNumber(calculator.heatingRunFraction, 1), unit: 0, units: [], convertFunction: convertUnchanged),
            ResultDataItem(name: "F(C)", value: formatNumber(calculator.coolingRunFraction, 1), unit: 0, units: [], convertFunction: convertUnchanged),
            ResultDataItem(name: "T(S,L)", value: formatNumber(calculator.designHeatingEarthTemp, 1), unit: 0, units: ["℃", "℉"], convertFunction: convertTemperature),
            ResultDataItem(name: "T(S,H)", value: formatNumber(calculator.designCoolingEarthTemp, 1), unit: 0, units: ["℃", "℉"], convertFunction: convertTemperature),
            ResultDataItem(name: "L(H.T)", value: formatNumber(calculator.heatingBoreholeLength, 1), unit: 0, units: ["m", "ft"], convertFunction: convertMeterFoot),
            ResultDataItem(name: "L(C.T)", value: formatNumber(calculator.coolingBoreholeLength, 1), unit: 0, units: ["m", "ft"], convertFunction: convertMeterFoot)
        ]
        let (no, len) = calculator.getConfiguration()
        self.boreholeNum = String(no)
        self.boreholeLen = String(len)
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
                        HBResultInfoView()
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
                        Text("Configuration")
                            .font(.subheadline)
                            .foregroundColor(.secondary)

                        ZStack(alignment: .leading) {
                            Image("IGSHPAHB")
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
                }
                .screenshotMaker { screenshotMaker in
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
            MailView(content: "Please see the attached details.".localized(language), to: email_Value, subject: "IGSHPA HB "+"Result".localized(language), image1: screenshot1, image2: screenshot2, image3: screenshot3)
        }
        .sheet(isPresented: $sendDesign) {
            MailView(content: "Find attached a copy of the recommended setup. I would like to discuss a professional, detailed GSHP system design. \n My name is: \(name_Value) \n My phone number is: \(phone_Value) \n My country code is: \(country_Value) \n The project site address is: \(address_Value)", to: "info@4ee.com.au", subject: "IGSHPAVB Result", image1: screenshot1, image2: screenshot2, image3: screenshot3)
        }
    }
}

struct HBResultInfoView: View {
    @AppStorage("language") private var language = "en"

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("IGSHPA_result_info".localized(language))
                .textCase(nil)
                .fixedSize(horizontal: false, vertical: true)
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .foregroundColor(Theme.textColor)
    }
}

struct IGSHPAHBResultView_Previews: PreviewProvider {
    static var previews: some View {
        IGSHPAHBResultView(calculator: IGSHPAHBCalculation(heatPumpHeatingCapacity: 1,
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
                                                           boreholeLengthInput: 23))
            .environmentObject(ColorSchemeManager())
    }
}
