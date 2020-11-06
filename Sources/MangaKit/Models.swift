//
//  Models.swift
//  
//
//  Created by Aritro Paul on 06/11/20.
//

import Foundation


//MARK:- Response Models
public struct MangaUpdateResponse : Codable {
    var success: Bool
    var data: [Manga]
}

public struct MangaChapterDataResponse : Codable {
    var success: Bool
    var data: MangaChapterData
}

public struct MangaDataResponse : Codable {
    var success: Bool
    var data: [MangaChapter]
}

public struct MangaSearchResponse : Codable {
    var success: Bool
    var data: [MangaSearchResult]
}



//MARK:- Data Models
public struct Manga : Codable {
    var title: String
    var sourceSpecificName: String
    var source: String
    var imageURL: String
    var currentChapter: String
    var additionalInfo : AdditionalInfo
}

public struct AdditionalInfo : Codable {
    var id: String?
    var genres: String?
    var date: String?
    var scanStatus: String?
    var ended: Bool?
}

public struct MangaChapterData : Codable {
    var imageURL: [String : String]
    var chapterNumber: String
    
    public func pages() -> Int {
        return imageURL.keys.count
    }
    public func atPage(_ page : Int) -> String {
        return imageURL[String(page)] ?? ""
    }
}

public struct MangaChapter : Codable {
    var chapterNumber: String
    var link: String
    var type: String
    var date: String
}

public struct MangaSearchResult : Codable {
    var imageURL: String
    var mangaURL: String
    var source: String
    var mangaName: String
    var sourceSpecificName: String
    var alternateNames: [String]
}
