//
//  TabBarItems.swift
//  HWSwiftUI
//
//  Created by Ekaterina Saveleva on 22.09.2023.
//

import SwiftUI

struct TabBarItems: View {
    
    @State private var isLogin = false
    @State private var titleOn = false
    @StateObject private var appSettings = AppSettings()
    
    var body: some View {
        //tab bar with items
        TabView() {
            
            
            // if user is logged show the profile-view, login-view otherwise
            if isLogin {
                InfoView(titleOn: $titleOn)
                    .tabItem {
                        Label("Profile", systemImage: "person.fill.checkmark")
                    }
            } else {
                LoginView(logged:  $isLogin)
                    .tabItem {
                        Label("Login", systemImage: "person")
                    }
                
                FeedView()
                    .tabItem {
                        Label("Feed", systemImage: "house.fill")
                    }
            }
            PlayerView()
                .tabItem {
                    Label("Player", systemImage: "music.note.list")
                }
            VideoView()
                .tabItem {
                    Label("Video", systemImage: "play.rectangle")
                }
            SettingsView(titleOn: $titleOn)
                .tabItem {
                    Label("Settings", systemImage: "slider.horizontal.3")
                }
        }
    }
    
}

struct TabBarItems_Previews: PreviewProvider {
    static var previews: some View {
        TabBarItems()
    }
}
