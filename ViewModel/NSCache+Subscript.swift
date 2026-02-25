//
//  NSCache+Subscript.swift
//  Video
//
//  Created by Shakhnoza Mirabzalova on 2/24/26.
//

import Foundation


/// NSCache extension that holds a subscript that takes a URL and returns an optional CacheEntry
// subscripts let read and write to the cache with a notation similar to Dictionary
extension NSCache where KeyType == NSString, ObjectType == CacheEntryObject {
    subscript(_ url: URL) -> CacheEntry? {
        // a getter that retrieves a CacheEntryObject from the cache and returns the CacheEntry
        get {
            let key = url.absoluteString as NSString
            let value = object(forKey: key)
            return value?.entry
        }
        // setter that stores a CacheEntryObject
        set {
            let key = url.absoluteString as NSString
            if let entry = newValue {
                let value = CacheEntryObject(entry: entry)
                setObject(value, forKey: key)
            } else {
                // if the new value is nil, remove the object from the cache
                removeObject(forKey: key)
            }
        }
    }
}
