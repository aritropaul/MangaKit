import Foundation

class MangaKit {
    
    static let shared = MangaKit()
    
    func getHotUpdates(from source: Sources, completion: @escaping(Result<[Manga], Error>)->()) {
        print("⤵️ Getting Hot Updates")
        let url = hotUpdatesURL(with: source)
        let urlSession = URLSession.shared
        let task = urlSession.dataTask(with: url) { (data, response, error) in
            let updateResponse = try! JSONDecoder().decode(MangaUpdateResponse.self, from: data!)
            if updateResponse.success == true {
                print("✅ Hot Updates Success")
                completion(.success(updateResponse.data))
            }
            else {
                completion(.failure(error!))
            }
        }
        
        task.resume()
    }
    
    
    func getLatestUpdates(from source: Sources, completion: @escaping(Result<[Manga], Error>)->()) {
        print("⤵️ Getting lastest Updates")
        let url = latestUpdatesURL(with: source)
        let urlSession = URLSession.shared
        let task = urlSession.dataTask(with: url) { (data, response, error) in
            let updateResponse = try! JSONDecoder().decode(MangaUpdateResponse.self, from: data!)
            if updateResponse.success == true {
                print("✅ Latest Updates Success")
                completion(.success(updateResponse.data))
            }
            else {
                completion(.failure(error!))
            }
        }
        
        task.resume()
    }
    
    func getChapters(from source: Sources, ofManga mangaSourceName: String, completion: @escaping(Result<[MangaChapter], Error>)->()) {
        print("⤵️ Getting Chapters")
        let url = chaptersURL(with: source, manga: mangaSourceName)
        let urlSession = URLSession.shared
        let task = urlSession.dataTask(with: url) { (data, response, error) in
            let mangaDataResponse = try! JSONDecoder().decode(MangaDataResponse.self, from: data!)
            if mangaDataResponse.success == true {
                print("✅ Chapters Success")
                completion(.success(mangaDataResponse.data))
            }
            else {
                completion(.failure(error!))
            }
        }
        
        task.resume()
    }
    
    func getChapterData(from source: Sources, withURL url: String, completion: @escaping(Result<MangaChapterData, Error>) -> ()) {
        print("⤵️ Getting Chapter Data")
        let url = chapterURL(with: source, url: url)
        let urlSession = URLSession.shared
        let task = urlSession.dataTask(with: url) { (data, response, error) in
            let chapterDataResponse = try! JSONDecoder().decode(MangaChapterDataResponse.self, from: data!)
            if chapterDataResponse.success == true {
                print("✅ Chapter Data Success")
                completion(.success(chapterDataResponse.data))
            }
            else {
                completion(.failure(error!))
            }
        }
        
        task.resume()
    }
    
    func search(from source: Sources, keyword: String, completion: @escaping(Result<[MangaSearchResult], Error>)->()) {
        print("⤵️ Getting Search Results")
        let url = searchURL(with: source, keyword: keyword)
        let urlSession = URLSession.shared
        let task = urlSession.dataTask(with: url) { (data, response, error) in
            let searchResponse = try! JSONDecoder().decode(MangaSearchResponse.self, from: data!)
            if searchResponse.success == true {
                print("✅ Search Success")
                completion(.success(searchResponse.data))
            }
            else {
                completion(.failure(error!))
            }
        }
        
        task.resume()
    }
    
}
