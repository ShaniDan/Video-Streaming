//
//  Home.swift
//  Video
//
//  Created by Shakhnoza Mirabzalova on 2/7/26.
//

import SwiftUI
import AVKit

struct Home: View {
    // I'm explicitly telling Swift - this is an array of Strings
    @State var likedList: [String] = []
    @State var isLiked = false
    
    @State var player = AVPlayer(
        url: (Bundle.main.url(
            forResource: "bubble",
            withExtension: "mov"
        ) ?? URL(fileURLWithPath: "/dev/null"))
    )
    
    var body: some View {
        NavigationStack {
            Text("Sample")
            ZStack {
                VideoPlayer(player: player)
                    .frame(width: 350, height: 200, alignment: .center)
                HStack {
                    Button(action: {
                        isLiked.toggle()
                        addLiked()
                    }) {
                        Image(systemName: isLiked ? "hand.thumbsup.fill" : "hand.thumbsup")
                            .foregroundStyle(isLiked ? .white : .white)
                            .frame(width: 50, height: 50)
                    }
                }
                .padding(EdgeInsets(top: 120, leading: 310, bottom: 200, trailing: 10))
            }

            ForEach(likedList, id: \.self) { name in
                Text(name)
                Text("bubble is added")
            }
        }
        
    }
    
    // function that adds the video to the liked list
    func addLiked() {
        likedList.append("Some name")
        
        if !likedList.contains("bubble.mov") {
            likedList.append("bubble.mov")
        }
    }
}

#Preview {
    Home()
}
