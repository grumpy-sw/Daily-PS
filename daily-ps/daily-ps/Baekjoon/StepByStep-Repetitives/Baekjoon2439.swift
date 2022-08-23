//
//  Baekjoon2439.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/08/23.
//

import Foundation

final class Baekjoon2439 {
    func run() {
        solution()
    }
    
    func solution() {
        let n = Int(readLine()!)!
        
        for count in 1...n {
            var oneLine = ""
            for _ in 0..<(n-count) {
                oneLine += " "
            }
            for _ in 1...count {
                oneLine += "*"
            }
            print(oneLine)
        }
    }
}
