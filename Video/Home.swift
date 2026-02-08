//
//  Home.swift
//  Video
//
//  Created by Shakhnoza Mirabzalova on 2/7/26.
//

import SwiftUI
import AVKit

struct Home: View {
    @State var isLiked = false
    
    @State var player = AVPlayer(
        url: Bundle.main.url(
            forResource: "bubbles2",
            withExtension: "mov"
        )!
    )
    
    var body: some View {
        NavigationStack {
            Text("Sample")
            ZStack {
                VideoPlayer(player: player)
                    .frame(width: 350, height: 200, alignment: .top)
                HStack {
                    Button(action: {
                        isLiked.toggle()
                    }) {
                        Image(systemName: isLiked ? "hand.thumbsup.fill" : "hand.thumbsup")
                            .foregroundStyle(isLiked ? .white : .white)
                            .frame(width: 50, height: 50)
                            .padding(EdgeInsets(top: 120, leading: 310, bottom: 200, trailing: 10))
                        
                    }
                }
            }
        }
        
    }
}

#Preview {
    Home()
}
