//
//  NQueen.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/11/01.
//

import Foundation

final class NQueen {
    func run() {
        print(solution(4))
    }
    
    var N: Int = 0
    var queens: [Int] = []
    var result: Int = 0
    
    func solution(_ n: Int) -> Int {
        N = n
        queens = Array(repeating: -1, count: N)
        
        dfs(0)
        
        return result
    }
    
    func dfs(_ count: Int) {
        if count == N {
            result += 1
            return
        }
        
        for index in 0..<N {
            if isValid(count, index) {
                queens[count] = index
                dfs(count+1)
            }
        }
    
    }
    
    func isValid(_ row: Int, _ col: Int) -> Bool {
        for index in 0..<row {
            if col == queens[index]
                || abs(col - queens[index]) == abs(row - index)  {
                return false
            }
        }
        
        return true
    }

    
}
