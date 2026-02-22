//
//  VideoRowView.swift
//  Video
//
//  Created by Shakhnoza Mirabzalova on 2/18/26.
//

import SwiftUI
import AVKit

struct VideoRowView: View {
    // declare a property to receive an existing Video instance
    var video: Video
    @State private var player: AVPlayer?
    
    var body: some View {
        VStack {
            if let vidUrl = URL(string: video.snippet?.thumbnails?.medium?.url ?? "") {
                AsyncImage(url: vidUrl)
//                    .cornerRadius(20)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .frame(width: 350, height: 200,
                           alignment: .center)
            }
            Text(video.snippet?.title ?? "")
                .bold()
        }
    }
}

