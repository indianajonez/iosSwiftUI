//
//  InfoView.swift
//  HWSwiftUI
//
//  Created by Ekaterina Saveleva on 26.09.2023.
//

import SwiftUI

struct InfoView: View {
    
    @Binding var titleOn: Bool
    @StateObject private var appSettings = AppSettings()
    
    var body: some View {
        //show the this of sample data
        NavigationView {
            List(Post.data) { post in
                
                NavigationLink {
                    // link to details view
                    InfoDetailsView(post: post)
                } label: {
                    // view to represent one row of data with image and title
                    InfoRowView(post: post)
                }
                
            }
            
            .navigationTitle(titleOn ? "" : "Anthropology")
            .navigationTitle(appSettings.isTitleEnabled ? "Anthropology" : "")
                    
            .listStyle(.plain)
        }
    }
}

struct NavigationView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(titleOn: .constant(true))
    }
}
