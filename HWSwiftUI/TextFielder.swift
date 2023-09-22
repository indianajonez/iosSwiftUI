//
//  TextFielder.swift
//  HWSwiftUI
//
//  Created by Ekaterina Saveleva on 22.09.2023.
//

import SwiftUI

struct TextFielder: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(height: 50)
            .padding(.leading, 12)
            .border(Color(UIColor.lightGray), width: 0.5)
            .background(Color(.systemGray6))
    }
}

