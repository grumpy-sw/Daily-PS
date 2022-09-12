//
//  Baekjoon10989.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/09/07.
//

import Foundation

final class Baekjoon10989 {
    func run() {
        solution()
    }
    
    func solution() {
        let N = Int(readLine()!)!
        var count = Array(repeating: 0, count: 10001)
        var result: String = ""
        
        for _ in 0..<N {
            let num = Int(readLine()!)!
            count[num] += 1
        }
        
        for index in 1...10000 {
            result += String(repeating: "\(index)\n", count: count[index])
        }
        
        print(result)
    }
}
