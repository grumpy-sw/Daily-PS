//
//  Baekjoon10844.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/12/08.
//

import Foundation

final class Baekjoon10844 {
    func run() {
        let n = Int(readLine()!)!
        print(solution(n))
    }
    
    func solution(_ n: Int) -> Int {
        var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: 10), count: n + 1)
        
        dp[1][0] = 0
        for index in 1..<10 {
            dp[1][index] = 1
        }
        
        
        if n >= 2 {
            for i in 2...n {
                dp[i][0] = dp[i-1][1] % 1000000000
                dp[i][9] = dp[i-1][8] % 1000000000
                for j in 1..<9 {
                    dp[i][j] = (dp[i-1][j-1] + dp[i-1][j+1]) % 1000000000
                }
            }
        }
        
        let result = dp[n].reduce(into: 0) { partialResult, num in
            partialResult = (partialResult + num) % 1000000000
        }
        
        return result
    }
}
