//
//  TabBarItems.swift
//  HWSwiftUI
//
//  Created by Ekaterina Saveleva on 22.09.2023.
//

import SwiftUI

struct TabBarItems: View {
    
    @State private var isLogin = false
    
    var body: some View {
        //tab bar with items
        TabView() {
            
            FeedView()
                .tabItem {
                    Label("Feed", systemImage: "house.fill")
                }
            
            // if user is logged show the profile-view, login-view otherwise
            if isLogin {
                ProfileView()
                    .tabItem {
                        Label("Profile", systemImage: "person.fill")
                    }
            } else {
                LoginView(logged:  $isLogin)
                    .tabItem {
                        Label("Login", systemImage: "person")
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
        }
    }
    
}

struct TabBarItems_Previews: PreviewProvider {
    static var previews: some View {
        TabBarItems()
    }
}
