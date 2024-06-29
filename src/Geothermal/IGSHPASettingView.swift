//
//  IGSHPASettingViw.swift
//  Geothermal
//
//  Created by Ruiqi Pang on 11/4/2023.
//

import Foundation
import SwiftUI

struct IGSHPASettingView: View {
    @AppStorage("language") private var language = "en"

    var body: some View {
        VStack(spacing: 30) {
            ButtonWithInfo(title: "Vertically - Bored (VB)".localized(language), info: "VB_info".localized(language), img: "IGSHPAVB", destination: IGSHPAVBInputView())
            ButtonWithInfo(title: "Horizontally - Bored (HB)".localized(language), info: "HB_info".localized(language), img: "IGSHPAHB", destination: IGSHPAHBInputView())
            ButtonWithInfo(title: "Horizontally - Trenched (HT)".localized(language), info: "HT_info".localized(language), img: "IGSHPAHT", destination: IGSHPAHTInputView())
        }
        .fixedSize(horizontal: false, vertical: true)
        .navigationBarTitle("IGSHPA System Setting".localized(language), displayMode: .inline)
        .toolbarMenu()
    }
}

struct SystemSettingView_Previews: PreviewProvider {
    static var previews: some View {
        IGSHPASettingView()
            .environmentObject(ColorSchemeManager())
    }
}
