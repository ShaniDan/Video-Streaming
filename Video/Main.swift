//
//  Main.swift
//  Video
//
//  Created by Shakhnoza Mirabzalova on 2/9/26.
//

import SwiftUI
import AVKit

struct Main: View {
    
    @StateObject var vm = VideoViewModel()
    @State private var player: AVPlayer?
    
    var body: some View {
        VStack {
            if let video = vm.videos {
                Text(video.title)
            }
        }
        
        .task {
          await vm.fetch()
        }
    }
}

#Preview {
    Main()
}
