//
//  Baekjoon10809.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/08/29.
//

import Foundation

final class Baekjoon10809 {
    func run() {
        solution()
    }
    
    func solution() {
        var code = 97
        var character = String(Character(UnicodeScalar(code)!))
        let s = readLine()!
        var alphabets = Array(repeating: -1, count: 26)
        
        for index in 0..<alphabets.count {
            if let position = s.firstIndex(of: Character(UnicodeScalar(code)!)) {
                alphabets[index] = s.distance(from: s.startIndex, to: position)
                
            }
            code += 1
        }
        
        alphabets.forEach {
            print($0, terminator: " ")
        }
    }
}
