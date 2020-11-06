//
//  Constants.swift
//  
//
//  Created by Aritro Paul on 06/11/20.
//

import Foundation

let base = "manganode.herokuapp.com/manga/"

enum Sources : String {
    case mangasee = "0"
    case mangakakalot = "1"
    case fanfox = "2"
}

let hotUpdates = "/hotupdates"
let latestUpdates = "/latestupdates"
let chapter = "/mangadata?chapterURL="
let search = "/search?keyWord="
let chapters = "/chapters/"


func hotUpdatesURL(with source: Sources) -> URL {
    let urlString = base + source.rawValue + hotUpdates
    return URL(string: urlString)!
}

func latestUpdatesURL(with source: Sources) -> URL {
    let urlString = base + source.rawValue + latestUpdates
    return URL(string: urlString)!
}

func chapterURL(with source: Sources, url: String) -> URL {
    let urlString = base + source.rawValue + chapter + url
    return URL(string: urlString)!
}

func searchURL(with source: Sources, keyword: String) -> URL {
    let urlString = base + source.rawValue + search + keyword
    return URL(string: urlString)!
}

func chaptersURL(with source: Sources, manga: String) -> URL {
    let urlString = base + source.rawValue + chapters + manga
    return URL(string: urlString)!
}
