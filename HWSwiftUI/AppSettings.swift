//
//  AppSettings.swift
//  HWSwiftUI
//
//  Created by Ekaterina Saveleva on 28.09.2023.
//

import SwiftUI

class AppSettings: ObservableObject {
    @AppStorage("isTitleEnabled") var isTitleEnabled: Bool = true
}
