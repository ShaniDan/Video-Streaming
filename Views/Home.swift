//
//  Home.swift
//  Video
//
//  Created by Shakhnoza Mirabzalova on 2/7/26.
//

import SwiftUI
import AVKit
import AVFoundation

struct Home: View {
    @State private var likedList: [URL] = []
    @State private var isLiked = false
    @State private var player: AVPlayer?

    private let videoURL: URL = {
        Bundle.main.url(forResource: "bubble", withExtension: "mov")
        ?? URL(fileURLWithPath: "/dev/null")
    }()
    
    var body: some View {
        NavigationStack {
            Text("Sample")
            ZStack {
                VideoPlayer(player: player)
                    .frame(width: 350, height: 200, alignment: .center)
                HStack {
                    Button(action: {
                        toggleLike()
                    }) {
                        Image(systemName: isLiked ? "hand.thumbsup.fill" : "hand.thumbsup")
                            .foregroundStyle(isLiked ? .white : .white)
                            .frame(width: 50, height: 50)
                    }
                }
                .padding(EdgeInsets(top: 120, leading: 310, bottom: 200, trailing: 10))
            }
            
            Text("Count: \(likedList.count)")
            // MARK: this needs to be in new SwiftUI view
            ForEach(likedList, id: \.self) { url in
                VideoPlayer(player: AVPlayer(url: url))
                    .frame(width: 350, height: 200, alignment: .center)
            }
        }
        .task {
            self.player = AVPlayer(url: videoURL)
        }
    }
    
    // this function is used only inside this struct
    // LikedList videothumbnails with a title
    private func toggleLike() {
        isLiked.toggle()
        if isLiked {
            likedList.append(videoURL)
        }
        else {
            likedList.removeAll { $0 == videoURL }
        }
    }
}

#Preview {
    Home()
}

struct SampleVideo: Equatable, Identifiable {
    // This is a computed property because it has a body and it doesn't store anything
    var id: URL {
        self.url
    }
    // url is stored property
    var url: URL
    var avPlayer: AVPlayer
}
