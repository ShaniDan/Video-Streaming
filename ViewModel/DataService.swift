//
//  DataService.swift
//  Video
//
//  Created by Shakhnoza Mirabzalova on 2/17/26.
//

import Foundation

struct DataService {
    
    private let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String
    
    func getVideo() async -> [Video] {
        guard apiKey != nil else {
            // why do I need to initialize it with ()
            return [Video]()
        }
        
        // Create the URL
        let urlString = ""
    }
}
