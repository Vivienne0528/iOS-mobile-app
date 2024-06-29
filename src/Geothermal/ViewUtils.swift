//
//  ViewUtils.swift
//  Geothermal
//
//  Created by Yuntian Wan on 13/4/2023.
//

import Combine
import Foundation
import SwiftUI
import UIKit

enum Theme {
    static let textColor = Color("TextColor")
}

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }

    func numbersOnly(_ text: Binding<String>, includeDecimal: Bool = false) -> some View {
        modifier(NumberOnlyViewModifier(text: text, includeDecimal: includeDecimal))
    }

    func applyRowSeparatorTrailing() -> some View {
        modifier(RowSeparatorTrailingModifier())
    }

    func toolbarMenu() -> some View {
        modifier(ToolbarMenuModifier())
    }
}

extension String {
    func localized(_ language: String, tableName: String = "Localizable") -> String {
        guard let path = Bundle.main.path(forResource: language, ofType: "lproj"),
              let bundle = Bundle(path: path)
        else {
            return self
        }

        let localizedString = NSLocalizedString(self, tableName: tableName, bundle: bundle, value: "**\(self)**", comment: "")

        if localizedString == "**\(self)**" {
            // If the key was not found in the current language, try to localize in English
            if let path = Bundle.main.path(forResource: "en", ofType: "lproj"),
               let bundle = Bundle(path: path)
            {
                return NSLocalizedString(self, tableName: tableName, bundle: bundle, value: self, comment: "")
            }
        }

        return localizedString
    }
}

// Data item view used in result pages.
struct DataItemView: View {
    var name: String
    var value: String
    var unit: String

    var body: some View {
        VStack(alignment: .leading) {
            Text(name)
                .font(.subheadline)
                .foregroundColor(.secondary)

            Text("\(value) \(unit)")
                .font(.subheadline)
        }
    }
}

struct ResultDataItemView: View {
    var name: String
    @Binding var value: String
    @Binding var selectedUnit: Int
    @State private var previousUnit: Int
    var units: [String]
    var convertFunction: ((Int, Int, String) -> String)?

    init(name: String, value: Binding<String>, selectedUnit: Binding<Int>, units: [String], convertFunction: ((Int, Int, String) -> String)?) {
        self.name = name
        self._value = value
        self._selectedUnit = selectedUnit
        self.units = units
        self.convertFunction = convertFunction
        self._previousUnit = State(initialValue: selectedUnit.wrappedValue)
    }

    var body: some View {
        VStack(alignment: .leading) {
            Text(name)
                .font(.subheadline)
                .foregroundColor(.secondary)

            HStack {
                Text("\(value)")
                    .padding(.top, 1)
                if units.count > 1 {
                    Picker(selection: $selectedUnit, label: EmptyView()) {
                        ForEach(units.indices, id: \.self) { index in
                            Text(units[index])
                                .tag(index)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                    .labelsHidden()
                    .accentColor(Theme.textColor)
                    .frame(height: units[selectedUnit].count > 10 ? 40 : 20)
                    .padding(.horizontal, -15)
                    .onChange(of: selectedUnit) { newUnit in
                        if let convert = convertFunction, newUnit != previousUnit {
                            value = convert(previousUnit, newUnit, value)
                            previousUnit = newUnit
                        }
                    }
                } else if units.count == 1 {
                    Text(units[0])
                        .padding(.top, 1)
                }
            }
            .font(.subheadline)
        }
    }
}

struct ResultDataItem {
    var name: String
    var value: String
    var unit: Int
    var units: [String]
    var convertFunction: ((Int, Int, String) -> String)?
}

// Row view used in input pages.
struct Row: View {
    @AppStorage("language") private var language = "en"
    @State var paramName: String
    @State var placeHolder: String = "Enter a number"
    @Binding var defaultValue: String
    @State var units: [String]
    @Binding var selectedUnit: Int
    @State var infoText: String
    @State private var showingPopover = false
    var convertValue: ((Int, Int, String) -> String)?
    @State var isDec: Bool
    @State private var previousUnit = 0
    @EnvironmentObject var colorSchemeManager: ColorSchemeManager

    var body: some View {
        HStack {
            Text(paramName)
                .frame(width: 85, alignment: .leading)

            Image(systemName: "info")
                .symbolVariant(.circle.fill)
                .font(.system(size: 15, weight: .bold, design: .rounded))
                .foregroundStyle(colorSchemeManager.selectedColorScheme.color)
                .padding(.leading, 4)
                .onTapGesture {
                    showingPopover = true
                }
                .popover(isPresented: $showingPopover) {
                    VStack {
                        Text(infoText)
                            .font(.headline)
                            .padding()
                        Button(action: { showingPopover = false }) {
                            Text("Close".localized(language))
                                .padding()
                                .background(colorSchemeManager.selectedColorScheme.color)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                    }
                    .gesture(DragGesture(minimumDistance: 50, coordinateSpace: .local)
                        .onEnded { value in
                            if value.translation.height > 0 {
                                self.showingPopover = false
                            }
                        })
                    .padding(.top)
                }
                .scaledToFit()

            TextField(placeHolder.localized(language), text: $defaultValue)
                .numbersOnly($defaultValue, includeDecimal: isDec)

            if units.count > 1 {
                Picker(selection: $selectedUnit, label: EmptyView()) {
                    ForEach(Array(units.enumerated()), id: \.1) { index, unit in
                        Text(unit)
                            .tag(index)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                .labelsHidden()
                .accentColor(Theme.textColor)
                .onChange(of: selectedUnit) { newUnit in
                    if let convert = convertValue, newUnit != previousUnit {
                        defaultValue = convert(previousUnit, newUnit, defaultValue)
                        previousUnit = newUnit
                    }
                }
            } else if units.count == 1 {
                Text(units[0])
            }
        }.frame(minHeight: 30)
    }
}

struct MyBackButton: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var colorSchemeManager: ColorSchemeManager

    var body: some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "chevron.left")
                .foregroundColor(colorSchemeManager.selectedColorScheme.color)
        }
    }
}

struct CustomSeparator: View {
    var body: some View {
        Rectangle()
            .fill(Color(.separator))
            .frame(height: 1)
            .opacity(0.5)
    }
}

// Not in use right now but keep it just in case
struct RowSeparatorTrailingModifier: ViewModifier {
    func body(content: Content) -> some View {
        if #available(iOS 16, *) {
            return AnyView(content.alignmentGuide(.listRowSeparatorTrailing) { dimensions in
                dimensions[.trailing]
            })
        } else {
            return AnyView(content)
        }
    }
}

struct ToolbarMenuModifier: ViewModifier {
    @AppStorage("language") private var language = "en"
    @State private var showingPopover = false
    private var popoverText: String {
        "app_info".localized(language)
    }

    @EnvironmentObject var colorSchemeManager: ColorSchemeManager

    func body(content: Content) -> some View {
        content
            .popover(isPresented: $showingPopover) {
                Text(popoverText)
                    .padding()
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Menu(content: {
                        Button("Terms".localized(language)) {
                            openURLInDefaultBrowser(urlString: "https://4ee.com.au/legal.html")
                        }
                        Button("Privacy".localized(language)) {
                            openURLInDefaultBrowser(urlString: "https://4ee.com.au/legal.html")
                        }
                        Button("About".localized(language)) {
                            showingPopover = true
                        }
                    }, label: {
                        Image(systemName: "ellipsis.circle")
                            .imageScale(.large)
                            .foregroundColor(colorSchemeManager.selectedColorScheme.color)
                    })
                }
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: MyBackButton())
    }
}

struct NumberOnlyViewModifier: ViewModifier {
    @Binding var text: String
    var includeDecimal: Bool

    func body(content: Content) -> some View {
        content
            .keyboardType(includeDecimal ? .numbersAndPunctuation : .numberPad)
            .onReceive(Just(text)) { newValue in
                var numbers = "0123456789"
                let decimalSeparator: String = Locale.current.decimalSeparator ?? "."
                if includeDecimal {
                    numbers += decimalSeparator
                }
                if newValue.isEmpty {
                    numbers += "-"
                }

                if newValue.components(separatedBy: decimalSeparator).count - 1 > 1 {
                    let filtered = newValue
                    self.text = String(filtered.dropLast())
                } else if newValue.hasPrefix("-") {
                    if newValue.components(separatedBy: "-").count - 1 > 1 {
                        let filtered = newValue
                        self.text = String(filtered.dropLast())
                    }
                } else {
                    let filtered = newValue.filter { numbers.contains($0) }
                    if filtered != newValue {
                        self.text = filtered
                    }
                }
            }
    }
}

func openURLInDefaultBrowser(urlString: String) {
    guard let url = URL(string: urlString) else {
        print("Invalid URL: \(urlString)")
        return
    }

    if UIApplication.shared.canOpenURL(url) {
        UIApplication.shared.open(url, options: [:]) { success in
            if success {
                print("URL opened successfully: \(urlString)")
            } else {
                print("Failed to open URL: \(urlString)")
            }
        }
    } else {
        print("Unable to open URL: \(urlString)")
    }
}
