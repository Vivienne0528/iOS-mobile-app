//
//  ContentView.swift
//  Geothermal
//
//  Created by Yuntian Wan on 13/4/2023.
//

import SwiftUI

enum ColorSchemeOption: String, CaseIterable {
    case brown
    case blue
    case green
    var color: Color {
        switch self {
        case .blue:
            return .blue
        case .green:
            return .customColor
        case .brown:
            return .brownColor
        }
    }
}

extension Color {
    static let customColor = Color(red: 0.5, green: 0.8, blue: 0.2)
    static let brownColor = Color(red: 0.5, green: 0.4, blue: 0.2)
}

class ColorSchemeManager: ObservableObject {
    @Published var selectedColorScheme = ColorSchemeOption.brown
}

struct ContentView: View {
    @AppStorage("isTermsAccepted") private var isTermsAccepted = false
    @State private var shouldNavigate = false
    @AppStorage("isDarkMode") private var isDarkMode = false
    @AppStorage("language") private var language = "en"
    @EnvironmentObject var colorSchemeManager: ColorSchemeManager

    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    Image("Logo")
                        .resizable()
                        .cornerRadius(5)
                        .aspectRatio(contentMode: .fit)
                        .padding(/*@START_MENU_TOKEN@*/ .all/*@END_MENU_TOKEN@*/)
                    Text("Geothermal".localized(language))
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .foregroundColor(Theme.textColor)
                    if let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String {
                        Text("Ver \(version)")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(Theme.textColor)
                    }

                    HStack {
                        Spacer()
                        HStack {
                            Image(systemName: "globe")
                            Text("Language".localized(language))
                                .font(.title2)
                                .fontWeight(.bold)
                                .padding(.trailing)
                                .frame(width: 150)
                        }
                        Picker(selection: $language, label: Text("")) {
                            ForEach(AppConstants.supportedLanguages, id: \.self) { lang in
                                let locale = Locale(identifier: lang)
                                Text(locale.localizedString(forLanguageCode: lang)?.capitalized ?? "")
                                    .tag(lang)
                            }
                        }
                        .pickerStyle(MenuPickerStyle())
                        .frame(width: 150)
                        .accentColor(colorSchemeManager.selectedColorScheme.color)
                        Spacer()
                    }
                    .padding(.top)

                    HStack {
                        Spacer()
                        HStack {
                            Image(systemName: "circle.lefthalf.fill")
                            Text("Theme".localized(language))
                                .font(.title2)
                                .fontWeight(.bold)
                                .padding(.trailing)
                                .frame(width: 150)
                        }
                        Picker(selection: $isDarkMode, label: Text("")) {
                            Text("Light".localized(language)).tag(false)
                            Text("Dark".localized(language)).tag(true)
                        }
                        .pickerStyle(MenuPickerStyle())
                        .frame(width: 150)
                        .accentColor(colorSchemeManager.selectedColorScheme.color)
                        Spacer()
                    }
                    .padding(.top)
                    HStack {
                        Spacer()
                        Image(systemName: "paintpalette")
                        Text("Color".localized(language))
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(.trailing)
                            .frame(width: 150)
                        Picker("Color Scheme", selection: $colorSchemeManager.selectedColorScheme) {
                            ForEach(ColorSchemeOption.allCases, id: \.self) { option in
                                Text(option.rawValue.capitalized.localized(language))
                                    .tag(option)
                            }
                        }
                        .pickerStyle(MenuPickerStyle())
                        .frame(width: 150)
                        .accentColor(colorSchemeManager.selectedColorScheme.color)
                        Spacer()
                    }
                    .padding(.top)
                }

                TermsAndConditions()
                NavigationLink(destination: MethodView(), isActive: self.$shouldNavigate) {
                    Text("Start".localized(language))
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(colorSchemeManager.selectedColorScheme.color)
                        .cornerRadius(10)
                        .onTapGesture {
                            if isTermsAccepted {
                                shouldNavigate = true
                            } else {
                                showAlert()
                            }
                        }
                }
                .padding(.top)
                Spacer()

                Text("copyright".localized(language))
                    .font(.footnote)
                    .fontWeight(.light)
                    .foregroundColor(Theme.textColor)
                    .padding(.bottom)
            }
            .padding()
        }
        .navigationViewStyle(.stack)
    }

    private func showAlert() {
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let mainWindow = windowScene.windows.first
        {
            let alert = UIAlertController(title: "Warning".localized(language), message: "terms_warning_info".localized(language), preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK".localized(language), style: .default, handler: nil))
            mainWindow.rootViewController?.present(alert, animated: true, completion: nil)
        }
    }
}

struct TermsAndConditions: View {
    @AppStorage("isTermsAccepted") var isTermsAccepted: Bool = false
    @AppStorage("language") private var language = "en"
    @EnvironmentObject var colorSchemeManager: ColorSchemeManager

    var body: some View {
        HStack {
            Toggle("", isOn: $isTermsAccepted)
                .toggleStyle(CheckboxToggleStyle())
            // TODO: change color
            Text("terms_1".localized(language))
                .font(.callout)
                .fontWeight(.semibold)
            NavigationLink(destination: TermsAndConditionsView()) {
                Text("terms_2".localized(language))
                    .font(.callout)
                    .fontWeight(.semibold)
                    .foregroundColor(colorSchemeManager.selectedColorScheme.color)
                    .underline()
            }
        }
        .padding(.top)
    }
}

struct CheckboxToggleStyle: ToggleStyle {
    @EnvironmentObject var colorSchemeManager: ColorSchemeManager
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
            Button(action: { configuration.isOn.toggle() }) {
                Image(systemName: configuration.isOn ? "checkmark.square" : "square")
                    .foregroundColor(configuration.isOn ? colorSchemeManager.selectedColorScheme.color : .gray)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .environment(\.locale, Locale(identifier: "en"))
                .environmentObject(ColorSchemeManager())
            ContentView()
                .environment(\.locale, Locale(identifier: "zh-HANS"))
                .environmentObject(ColorSchemeManager())
        }
    }
}
