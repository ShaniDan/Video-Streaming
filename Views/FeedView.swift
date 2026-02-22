//
//  FeedView.swift
//  Video
//
//  Created by Shakhnoza Mirabzalova on 2/18/26.
//

import SwiftUI

struct FeedView: View {
    // Create a new instance of an empty array and it'll hold Video instances later. This is the collection of many videos
    @State private var videos = [Video]()
    // This state variable stores only one video
    @State private var selectedVideo: Video?
    
    var body: some View {
        List(videos) { vid in
            VideoRowView(video: vid)
                .onTapGesture {
                    selectedVideo = vid
                }
                .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
        .scrollIndicators(.hidden)
        .task {
            self.videos = await DataService().getVideo()
        }
        .sheet(item: $selectedVideo) { vid in
            VideoDetailView(video: vid)
        }
    }
}

#Preview {
    FeedView()
}
