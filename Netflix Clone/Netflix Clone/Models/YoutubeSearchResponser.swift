//
//  YoutubeSearchResponser.swift
//  Netflix Clone
//
//  Created by Caio Chaves on 11.07.23.
//

import Foundation

struct YoutubeSearchResponser: Codable {
    let items: [VideoElement]
    
}

struct VideoElement: Codable {
    let id: IdVideoElement
}

struct IdVideoElement: Codable {
    let kind: String
    let videoId: String
}
