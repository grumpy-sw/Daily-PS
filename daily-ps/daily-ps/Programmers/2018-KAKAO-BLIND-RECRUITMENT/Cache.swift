//
//  Cache.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/09/29.
//

// Level 2. 캐시
import Foundation

final class Cache {
    func run() {
        print(solution(2, ["Jeju", "Pangyo", "NewYork", "newyork"]))
    }
    
    func solution(_ cacheSize:Int, _ cities:[String]) -> Int {
        if cacheSize == 0 {
            return cities.count * 5
        }
        
        var time: Int = 0
        var pages: [String] = []
        
        for index in 0..<cities.count {
            let city = cities[index].lowercased()
            if pages.contains(city) {
                time += 1
                pages.remove(at: pages.firstIndex(of: city)!)
            } else {
                if pages.count == cacheSize {
                    pages.removeFirst()
                }
                time += 5
            }
            pages.append(city)
        }
        
        return time
    }
}
