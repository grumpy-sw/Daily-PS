//
//  2022.08.03
//  프로그래머스 코딩테스트 고득점 Kit - 해시
//
//  Level 3. 베스트앨범
// 

import Foundation

final class BestAlbum {
    func run() {
        print(solution(["classic", "pop", "classic", "classic", "pop"], [500, 600, 150, 800, 2500])) // [4, 1, 3, 0]
    }
    
    func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
        let sortedDictionary = sortedGenreDictionary(genres, plays)
        let songs = makeSongs(genres, plays)
        
        let result: [Int] = fillAlbumResult(sortedDictionary, songs)
        
        return result
    }
    
    func sortedGenreDictionary(_ genres:[String], _ plays:[Int]) -> [Dictionary<String, Int>.Element] {
        var genreDictionary: [String: Int] = [:]
        for index in 0..<genres.count {
            let lastValue: Int = genreDictionary[genres[index]] ?? 0
            genreDictionary.updateValue(lastValue + plays[index], forKey: genres[index])
        }
        
        let sortedDictionary = genreDictionary.sorted { (before, after) in
            return before.value > after.value
        }
        return sortedDictionary
    }
    
    func makeSongs(_ genres:[String], _ plays:[Int]) -> [Song] {
        var songs: [Song] = []
        for index in 0..<plays.count {
            songs.append(Song(genre: genres[index], id: index, playtimes: plays[index]))
        }
        return songs
    }
    
    func fillAlbumResult(_ sortedDictionary: [Dictionary<String, Int>.Element], _ songs: [Song]) -> [Int] {
        var result: [Int] = []
        for index in 0..<sortedDictionary.count {
            let key = sortedDictionary[index].key
            let filteredSongs = songs.filter {
                $0.genre == key
            }.sorted { before, after in
                before.playtimes > after.playtimes
            }
            for songIndex in 0..<min(2, filteredSongs.count) {
                result.append(filteredSongs[songIndex].id)
            }
        }
        return result
    }
    
    struct Song {
        let genre: String
        let id: Int
        let playtimes: Int
    }
}

