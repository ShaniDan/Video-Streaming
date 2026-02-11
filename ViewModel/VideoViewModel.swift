//
//  VideoViewModel.swift
//  Video
//
//  Created by Shakhnoza Mirabzalova on 2/9/26.
//

import Foundation
import Combine

@MainActor

class VideoViewModel: ObservableObject {
    // why does it need to be an array
//    @Published var videos: [VideoResponse] = []
    @Published var videos: VideoResponse? = nil
    
    let imdbIDs = ["tt27497448","tt33517752","tt21066182","tt27444205","tt14786934"]
    
    func fetch() async {
        
        guard let url = URL(string: "https://vidsrc.icu/embed/movie") else {
            return
        }
        // decode
        do {
            // network request
            let(data, response) = try await URLSession.shared.data(from: url)
            
            guard let httpResponse = response as? HTTPURLResponse else { return }
            
            let statusCode = httpResponse.statusCode
            
            if statusCode == 200 {
                let decoded = try JSONDecoder().decode(VideoResponse.self, from: data)
                //
                print(decoded)
                
                self.videos = decoded
            } else if statusCode == 404 {
                
            } else {
                print("nothing found here")
            }
            // currently it's catching this error
        } catch {
            print("Error: \(error)")
        }
    }
}
