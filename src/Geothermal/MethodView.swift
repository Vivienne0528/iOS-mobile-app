//
//  MethodView.swift
//  Geothermal
//
//  Created by Yuntian Wan on 13/4/2023.
//

import SwiftUI

struct MethodView: View {
    @AppStorage("language") private var language = "en"

    var body: some View {
        VStack(spacing: 30) {
            ButtonWithInfo(title: "IGSHPA".localized(language), info: "IGSHPA_info".localized(language), img: "IGSHPA", destination: IGSHPASettingView())

            ButtonWithInfo(title: "ASHRAE".localized(language), info: "ASHRAE_info".localized(language), img: "ASHRAE", destination: ASHRAEInputView())
        }
        .fixedSize()
        .navigationBarTitle("Method".localized(language), displayMode: .inline)
        .toolbarMenu()
    }
}

struct ButtonWithInfo<Content: View>: View {
    let title: String
    let info: String
    let img: String
    let destination: Content

    @State private var showingInfo = false
    @EnvironmentObject var colorSchemeManager: ColorSchemeManager
    var body: some View {
        HStack(spacing: 10) {
            Image(systemName: "info.circle")
                .foregroundColor(.blue)
                .font(.title2)
                .opacity(0)
            NavigationLink(destination: destination) {
                Text(title)
                    .font(.title2)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(colorSchemeManager.selectedColorScheme.color)
                    .cornerRadius(10)
            }
            Button(action: { showingInfo.toggle() }) {
                Image(systemName: "info.circle")
                    .foregroundColor(colorSchemeManager.selectedColorScheme.color)
                    .font(.title2)
            }
            .popover(isPresented: $showingInfo) {
                VStack {
                    if !img.isEmpty {
                        Image(img)
                            .resizable()
                            .scaledToFit()
                            .padding()
                    }
                    Text(info)
                        .padding()
//                    Button(action: { showingInfo.toggle() }) {
//                        Text("Close")
//                            .padding()
//                            .background(Color.blue)
//                            .foregroundColor(.white)
//                            .cornerRadius(10)
//                    }
//                    .padding(.top)
                }
                .frame(maxWidth: 300)
                .gesture(DragGesture(minimumDistance: 50, coordinateSpace: .local)
                    .onEnded { value in
                        if value.translation.height > 0 {
                            self.showingInfo = false
                        }
                    })
            }
        }
    }
}

struct MethodView_Previews: PreviewProvider {
    static var previews: some View {
        MethodView()
            .environmentObject(ColorSchemeManager())
    }
}
