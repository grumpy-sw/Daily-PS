//
//  Baekjoon2775.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/09/02.
//

import Foundation

final class Baekjoon2775 {
    var map: [[Int]] = []
    
    func run() {
        solution()
    }
    
    func solution() {
        map = Array(repeating: Array(repeating: 0, count: 15), count: 15)
        
        for index in 1...14 {
            map[0][index] = index
        }
        
        for index in 1...14 {
            fillTheMap(index)
        }
        
        let T = Int(readLine()!)!
        
        for _ in 0..<T {
            let K = Int(readLine()!)!
            let N = Int(readLine()!)!
            
            print(map[K][N])
        }
    }
    
    func fillTheMap(_ K: Int) {
        for index in 1...14 {
            map[K][index] = residentNumber(K, index)
        }
        
    }
    
    func residentNumber(_ K: Int, _ N: Int) -> Int {
        var result = 0
        
        for index in 1...N {
            result += map[K-1][index]
        }
        return result
    }
}
