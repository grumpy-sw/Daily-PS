//
//  Baekjoon1904.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/11/28.
//

import Foundation

final class Baekjoon1904 {
    func run() {
        let input = Int(readLine()!)!
        print(solution(input))
    }
    
    func solution(_ n: Int) -> Int {
        if n == 1 || n == 2 {
            return n
        }
        
        var map: [Int] = Array(repeating: 0, count: n + 1)
        map[0] = 1
        map[1] = 1
        
        for index in 2...n {
            map[index] = (map[index - 1] + map[index - 2]) % 15746
        }
        return map[n]
    }
}
