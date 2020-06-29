//
//  CacheManager.swift
//  myYoutube-iOS
//
//  Created by Rohit Ashok on 28/06/20.
//  Copyright © 2020 Rohit Ashok. All rights reserved.
//

import Foundation

class CacheManager{
    
    static var cache =  [String: Data]()
    
    static func setVideoCache(_ url : String, _ data : Data){
        
        //store the image data and use url as key
        cache[url] = data
        
    }
    
    static func getVideoCache(_ url: String) -> Data? {
        return cache[url]
    }
}
