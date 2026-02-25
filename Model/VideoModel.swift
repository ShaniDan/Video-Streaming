//
//  VideoModel.swift
//  Video
//
//  Created by Shakhnoza Mirabzalova on 2/9/26.
//

import Foundation

struct VideoResponse: Decodable {
    let title2 = String() // ( () initialize title as String)
    let title: String
    let description: String
    let url: URL
    let content: String
    let metadata: VideoMetadata
    let external: External
    let warning: String
}

struct VideoMetadata: Decodable {
    let lang: String
    let viewport: String
    let description: String
    let author: String
}

struct External: Decodable {
   
    let icon: [URL: IconInfo]

    /// Key name contains a hyphen, and values are empty objects: { "https://.../": {} }
    let dnsPrefetch: [URL: EmptyObject]

    enum CodingKeys: String, CodingKey {
        case icon
        case dnsPrefetch = "dns-prefetch"
    }
}

struct IconInfo: Decodable {
    let type: String
}

/// Represents `{}` in JSON
struct EmptyObject: Decodable {}
