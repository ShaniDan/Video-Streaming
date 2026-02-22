//
//  VideoDetailView.swift
//  Video
//
//  Created by Shakhnoza Mirabzalova on 2/19/26.
//

import SwiftUI
import YouTubePlayerKit

struct VideoDetailView: View {
    
    var video: Video
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        
        GeometryReader { proxy in
            VStack {
                HStack {
                    Spacer()
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                    }
                }
                // Configure video player
                let youTubePlayer = YouTubePlayer(
                    // Possible values: .video, .videos, .playlist, .channel
                    source: .video(id: video.snippet?.resourceId?.videoId ?? ""),
                    // The parameters of the player
                    parameters: .init(
                        autoPlay: false,
                        loopEnabled: true,
                        startTime: .init(value: 5, unit: .minutes),
                        showControls: true,
                        // ...
                    ),
                    // The configuration of the underlying web view
                    configuration: .init(
                        fullscreenMode: .system,
                        allowsInlineMediaPlayback: true,
                        customUserAgent: "MyCustomUserAgent",
                        // ...
                    )
                )
                YouTubePlayerView(youTubePlayer)
                    .frame(width: proxy.size.width, height: proxy.size.width / 1.77778)
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        Text(video.snippet?.title ?? "")
                            .font(.headline)
                            .bold()
                        Text(video.snippet?.description ?? "")
                    }
                    .padding()
                }
                
            }
        }
        .ignoresSafeArea(.all)
    }
}


