//
//  Permutation.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/07/19.
//

import Foundation

// 순열
func permutation(_ array: [Int], count: Int) -> [[Int]] {
    var result: [[Int]] = []
    
    // Early Exit
    if count > array.count {
        return result
    }
    
    var visited: [Bool] = Array(repeating: false, count: array.count)

    func pick(_ now: [Int]) {
        if now.count == count {
            result.append(now)
            return
        }
        
        for i in 0..<array.count {
            if visited[i] == false {
                visited[i] = true
                pick((now + [array[i]]))
                visited[i] = false
            }
        }
    }
    
    pick([])
    
    return result
}
