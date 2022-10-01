//
//  Baekjoon9663.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/10/01.
//

import Foundation

final class Baekjoon9663 {
    var N: Int = 0
    var queens: [Int] = []
    var result: Int = 0
    
    func run() {
        N = Int(readLine()!)!
        queens = Array(repeating: -1, count: N)
        
        dfs(0)
        print(result)
    }
    
    func dfs(_ count: Int) {
        if count == N {
            result += 1
            return
        }
        
        for index in 0..<N {
            if checkHereIsValid(count, index) {
                queens[count] = index
                dfs(count+1)
            }
        }
    }

    func checkHereIsValid(_ row: Int, _ col: Int) -> Bool {
        for index in 0..<row {
            if col == queens[index]
                || abs(col - queens[index]) == abs(row - index)  {
                return false
            }
        }
        return true
    }
}
