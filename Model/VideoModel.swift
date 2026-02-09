//
//  VideoModel.swift
//  Video
//
//  Created by Shakhnoza Mirabzalova on 2/9/26.
//

import Foundation

struct VideoModel: Codable {
    // this is a stored property because it holds a value in memory
    var title: String
    var description: String
    var url: String
    var content: String
    var metadata: MetaData
    
}

struct MetaData: Codable {
    var lang: String
    var viewport: String
    var description: String
    var author: String
}

struct External {
    var icon: [String: IconValue]
    var dnsPrefetch: [String: EmptyObject]
    
    enum CodingKeys: String, CodingKey {
        case ison
        case dnsPrefetch = "dns-prefetch"
    }
}

struct IconValue: Codable {
    var type: String
}

struct EmptyObject: Codable {}
