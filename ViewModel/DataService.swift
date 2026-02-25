//
//  DataService.swift
//  Video
//
//  Created by Shakhnoza Mirabzalova on 2/17/26.
//

import Foundation

// Making DataService an actor protects the cache from simultaneous access from multiple threads

struct DataService {
    
    private let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String
    private let playlistCache: NSCache<NSString, CacheEntryObject> = NSCache()
    
    func getVideo() async -> [Video] {
        guard apiKey != nil else {
            // why do I need to initialize it with ()
            return [Video]()
        }
        
        // Create the URL
        let urlString = "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=PLjODKV8YBFHZ3tfvAgbuXk4zkLgB7CfhY&maxResults=20&key=\(apiKey!)"
        let url = URL(string: urlString)
        
        if let url = url {
            let request = URLRequest(url: url)
            let session = URLSession.shared
            
            do {
                let (data, response) = try await session.data(for: request)
                
                guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                    throw URLError(.badServerResponse)
                }
                
                let decoder = JSONDecoder()
                let playlist = try decoder.decode(Playlist.self, from: data)
                return playlist.items
                
            } catch {
                print("Error message \(error)")
            }
        }
        return [Video]()
    }
    
//    func playList(from url: URL) async throws -> Playlist {
//        let task = Task<Playlist, Error> {
//                   let data = try await downloader.httpData(from: url)
//                   let location = try decoder.decode(Playlist.self, from: data)
//                   return location
//               }
//    }
}
