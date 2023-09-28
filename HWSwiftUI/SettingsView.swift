//
//  SettingsView.swift
//  HWSwiftUI
//
//  Created by Ekaterina Saveleva on 27.09.2023.
//

import SwiftUI

struct SettingsView: View {
    //connect to actual color scheme in iOS enviroment
    @Environment(\.colorScheme) var colorScheme
    @AppStorage("isThemeMode") private var isThemeMode = false
    @AppStorage("titleOn") private var titleOn = false
    
    @State private var linkOn = false
    @State private var toggler = true
    
    @State private var sliderValue = 10.0
    @State private var isChanging = false
//    @Binding var titleOn: Bool
    
    var body: some View {
        ZStack {
            Color(.systemGray)
            
            Form {
                Section  {
                    //show one of two links to apps in the AppStore
                    Toggle( "Выбор цветовой схемы", isOn: $isThemeMode)
                        .padding()
                    Text(isThemeMode ? "Темный режим" : "Светлый режим")
                        .padding()
                        .background(isThemeMode ? Color.black : Color.white)
                        .foregroundColor(isThemeMode ? Color.white : Color.black)
                    
                    // presents current light / dark mode is iOs, connected dynamically
                    Text("iOS appearance:" + (colorScheme == .dark ? "Dark Theme enabled" : "Light Theme enabled"))
                        .padding(32)
                    
                    Toggle( "Включить/выключить заголовок для постов", isOn: $titleOn)
                    
                        .padding()
                    Text(titleOn ? "Navigation title not enabled" : "Navigation title enabled")
                        .padding()
                }
                .preferredColorScheme(isThemeMode ? .dark : .light)
            }
            
            
        }
    }
}

//struct SettingsView_Previews: PreviewProvider {
//    static var previews: some View {
//        SettingsView(titleOn: .constant(true))
//    }
//}
