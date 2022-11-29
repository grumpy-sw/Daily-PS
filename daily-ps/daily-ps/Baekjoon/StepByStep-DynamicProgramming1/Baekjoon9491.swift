//
//  Baekjoon9491.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/11/29.
//

import Foundation

final class Baekjoon9491 {
    func run() {
        let count = Int(readLine()!)!
        solution(count)
    }
    
    func solution(_ n: Int) {
        let p: [Int] = initializeArray()
        var result: [Int] = []
        for _ in 0..<n {
            let n = Int(readLine()!)!
            result.append(p[n])
        }
        
        result.forEach {
            print($0)
        }
    }
    
    func initializeArray() -> [Int] {
        var p = [-1, 1, 1, 1, 2, 2, 3, 4, 5, 7, 9]
        p += Array(repeating: 0, count: 90)
        
        for index in 11..<101 {
            p[index] = p[index - 1] + p[index - 5]
        }
        
        return p
    }
}
