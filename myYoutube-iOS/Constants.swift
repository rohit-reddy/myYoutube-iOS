//
//  Constants.swift
//  myYoutube-iOS
//
//  Created by Rohit Ashok on 21/06/20.
//  Copyright © 2020 Rohit Ashok. All rights reserved.
//

import Foundation

struct Constants {
    static var API_KEY = "AIzaSyAsSSxp5sfGNtEQFfcOUk3y3-OjUR9YTVw"
    static var PLAYLIST_ID = "PLxxvuxHLrEglwsqU1r0HxTpYiSvAI0HB9"
    static var API_URL = "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(Constants.PLAYLIST_ID)&key=\(Constants.API_KEY)"

}
