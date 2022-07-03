//
//  ImagesData.swift
//  MediaSoft_TZ
//
//  Created by Marat Yunusov on 01.07.2022.
//

import Foundation


struct ContentData: Codable {
    let cursor: String
    let tags: [Tag]
}

struct Tag: Codable {
    let cursor: String
    let gfycats: [Gfycat]
}

struct Gfycat: Codable {
    let gifUrl: String
    let username: String
}
    



//MARK: - API

//    let gfyID, gfyName, gfyNumber: String
//    let webmURL: String
//    let gifURL: String
//    let miniURL: String
//    let miniPosterURL: String
//    let mobileURL: String
//    let mobilePosterURL, posterURL, thumb100PosterURL: String
//    let max5MBGIF, max2MBGIF, max1MBGIF, gif100Px: String
//    let width, height: Int
//    let avgColor: String
//    let frameRate, numFrames, mp4Size, webmSize: Int
//    let gifSize, gatekeeper, source, createDate: Int
//    let nsfw: Int
//    let mp4URL: String
//    let likes, published, dislikes: Int
//    let extraLemmas, md5: String
//    let views: Int
//    let tags: [String]
//    let userName, title, gfycatDescription: String
//    let languageCategories: [String]
//
//    enum CodingKeys: String, CodingKey {
//        case gfyID = "gfyId"
//        case gfyName, gfyNumber
//        case webmURL = "webmUrl"
//        case gifURL = "gifUrl"
//        case miniURL = "miniUrl"
//        case miniPosterURL = "miniPosterUrl"
//        case mobileURL = "mobileUrl"
//        case mobilePosterURL = "mobilePosterUrl"
//        case posterURL = "posterUrl"
//        case thumb100PosterURL = "thumb100PosterUrl"
//        case max5MBGIF = "max5mbGif"
//        case max2MBGIF = "max2mbGif"
//        case max1MBGIF = "max1mbGif"
//        case gif100Px = "gif100px"
//        case width, height, avgColor, frameRate, numFrames, mp4Size, webmSize, gifSize, gatekeeper, source, createDate, nsfw
//        case mp4URL = "mp4Url"
//        case likes, published, dislikes, extraLemmas, md5, views, tags, userName, title
//        case gfycatDescription = "description"
//        case languageCategories
//    }
//}
//
