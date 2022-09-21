//
//  VowelsDictionary.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/08/15.
//

import Foundation

final class VowelsDictionary {
    func run() {
        print(solution("AAAE"))
    }
    
    func solution(_ word:String) -> Int {
        let characters: [String] = ["A", "E", "I", "O", "U"]
        
        var map: [String] = []
        
        for count in 1...5 {
            var characterPool: [String] = []
            for _ in 0..<count {
                characterPool += characters
            }
            
            map += permutation(characterPool, length: count)
        }
        
        let result = (map.sorted().firstIndex(of: word) ?? 0) + 1
        return result
    }
    
    func permutation(_ characters: [String], length: Int) -> [String] {
        
        var result: [String] = []
        var visited: [Bool] = Array(repeating: false, count: characters.count)
        
        pick([])
        
        func pick(_ now: [String]) {
            if now.count == length {
                result.append(now.joined())
                return
            }
            
            for i in 0..<characters.count {
                if visited[i] == false {
                    visited[i] = true
                    pick((now + [characters[i]]))
                    visited[i] = false
                }
            }
        }
        return removeDuplicatedElements(in: result)
    }
    
    func removeDuplicatedElements(in array: [String]) -> [String] {
        let set: Set = Set(array)
        return Array(set)
    }
}
