//
//  WordConversion.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/08/05.
//

import Foundation

final class WordConversion {
    var result: Int = 0
    var visited: [Bool] = []
    func run() {
        print(solution("hit", "cog", ["hot", "dot", "dog", "lot", "log"]))
    }
    
    func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
        visited = Array(repeating: false, count: words.count)
        
        result = bfs(begin, target, words)
        
        return result
    }
    
    func bfs(_ begin:String, _ target:String, _ words:[String]) -> Int {
        var queue: [Word] = [Word(value: begin, depth: 0)]
        
        while !queue.isEmpty {
            let front = queue.removeFirst()
            if front.value == target {
                return front.depth
            }
            
            let wordList = makePossibleWordList(front, words)
            for word in wordList {
                queue.append(word)
            }
        }
        return 0
    }
    
    func makePossibleWordList(_ ownWord: Word, _ words: [String]) -> [Word] {
        var wordList: [Word] = []
        for number in 0..<words.count {
            var count: Int = 0
            let ownArray = Array(ownWord.value)
            let wordArray = Array(words[number])
            
            for index in 0..<ownWord.value.count {
                if ownArray[index] != wordArray[index] {
                    count += 1
                }
                if count >= 2 {
                    break
                }
            }
            
            if count == 1, !visited[number] {
                visited[number] = true
                wordList.append(Word(value: words[number], depth: ownWord.depth + 1))
            }
        }
        return wordList
    }

    struct Word {
        let value: String
        var depth: Int
    }
}
