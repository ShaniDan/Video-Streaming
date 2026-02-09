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
    
    @Published var videos: [VideoModel] = []
    
    func fetch() async {
        guard let url = URL(string: "https://vidsrc.icu/embed/movie/{id}") else {
            return
        }
        // decode
        do {
            // network request
            let(data, response) = try await URLSession.shared.data(from: url)
            
            guard let httpResponse = response as? HTTPURLResponse else { return }
            
            let statusCode = httpResponse.statusCode
            
            if statusCode == 200 {
                let decoded = try JSONDecoder().decode([VideoModel].self, from: data)
                self.videos = decoded
            } else if statusCode == 404 {
                
            }
        } catch {
            print("no videos")
        }
    }
}
