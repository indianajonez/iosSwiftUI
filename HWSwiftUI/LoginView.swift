//
//  LoginView.swift
//  HWSwiftUI
//
//  Created by Ekaterina Saveleva on 22.09.2023.
//

import SwiftUI

struct LoginView: View {
    
    enum Field: Hashable {
        case loginField
        case passwordField
    }
    
    @Binding var logged: Bool //тест
    
    @State private var login: String = ""
    @State private var password: String = ""
    @FocusState private var focused: Field?
    
    var body: some View {
        //vk image
        VStack {
            Image("vk")
                .resizable()
                .frame(width: 140, height: 140)
                .shadow(radius: 10)
                .padding(.top, 150)
            
            // login and password text fields
            VStack(spacing: -0.5) {
                TextField("Login", text: $login)
                    .modifier(TextFielder())
                    .focused($focused, equals: .loginField)
                SecureField("Password", text: $password)
                    .modifier(TextFielder())
                    .focused($focused, equals: .passwordField)
            }
            
            .cornerRadius(12)
            .padding(.top, 60)
            .padding()
            
            // login button
            Button(action: {
                if login.isEmpty {
                    focused = .loginField
                } else if password.isEmpty {
                    focused = .passwordField
                } else {
                    // no authentication actually, logged allways
                    self.logged = true
                }
            }) {
                Text( login.isEmpty || password.isEmpty ? "Enter a loginand password" : "Log in")
                    .frame(height: 50)
                    .foregroundColor(.white)
            }
            
            .frame(maxWidth: .infinity , maxHeight: 50)
            .background(Color(.systemBlue))
            .cornerRadius(12)
            .padding()
            
            Spacer()
        }
    }
}
 
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(logged: .constant(false))
    }
}
