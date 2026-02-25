//
//  CacheEntryObject.swift
//  Video
//
//  Created by Shakhnoza Mirabzalova on 2/24/26.
//

import Foundation

// NSCache can hold only reference types so a class needs to be creted to store an enumeration value in the cache
// Now we can safely pass any instance of this object across threads because the *final declaration and the *let property make every instance immutable

/// final class needed to make CacheEntry enum reference type to be able to pass it across the app. 
final class CacheEntryObject {
    let entry: CacheEntry
    init(entry: CacheEntry) {
        self.entry = entry
    }
}

/// An enumeration of cache playlist cache entries.
enum CacheEntry {
    case inProgress(Task<Playlist, Error>)
    case ready(Playlist)
}
