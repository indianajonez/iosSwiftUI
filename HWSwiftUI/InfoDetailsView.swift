//
//  InfoDetailsView.swift
//  HWSwiftUI
//
//  Created by Ekaterina Saveleva on 22.09.2023.
//

import SwiftUI

struct InfoDetailsView: View {
    
    var post: Post
    
    var body: some View {
        // wrap a post for vertical scrolling
        ScrollView {
            // full width image
            post.image
                .resizable()
                .scaledToFit()
                .padding(.top, 12)
                .shadow(radius: 10)
            
            // text decription
            VStack(alignment: .leading) {
                Text(post.subtitle)
                    .font(.largeTitle).fontWeight(.bold)
                    .foregroundColor(.white)
                    .background(Color(.black))
                    .cornerRadius(8)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                Divider()
                
                Text(post.description)
            }
            .padding()
        }
        .navigationTitle(post.title)
        .background(Color(.systemGray6))
    }
}

struct InfoDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        InfoDetailsView(post: Post.data[0])
    }
}

