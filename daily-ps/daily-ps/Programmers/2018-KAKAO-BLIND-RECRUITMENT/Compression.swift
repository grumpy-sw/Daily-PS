//
//  Compression.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/11/28.
//

import Foundation

final class Compression {
    func run() {
        print(solution("ABABABABABABABAB"))
    }
    
    func solution(_ msg:String) -> [Int] {
        let msg = Array(msg).map{ String($0) }
        var dict: [String] = initializeDictionary()
        let result = LZW(msg, in: &dict)
        
        return result
    }
    
    func LZW(_ msg: [String], in dict: inout [String]) -> [Int] {
        var offset = 0
        var result: [Int] = []
        
        while offset < msg.count {
            var word = msg[offset]
            for index in (offset+1)..<msg.count {
                let temp = word + msg[index]
                if !dict.contains(temp) {
                    dict.append(temp)
                    break
                } else {
                    word = temp
                    offset = index
                }
            }
            result.append(dict.firstIndex(of: word)!)
            offset += 1
        }
        return result
    }
    
    func initializeDictionary() -> [String] {
        return [ "",
            "A", "B", "C", "D", "E", "F", "G",
            "H", "I", "J", "K", "L", "M", "N",
            "O", "P", "Q", "R", "S", "T", "U",
            "V", "W", "X", "Y", "Z"
        ]
    }
}
