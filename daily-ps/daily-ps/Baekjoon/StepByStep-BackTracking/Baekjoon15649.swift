//
//  Baekjoon15649.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/09/29.
//

import Foundation

final class Baekjoon15649 {
    var N: Int = 0
    var M: Int = 0
    
    var array: [Int] = []
    func run() {
        let input = readLine()!.split(separator: " ").map{ Int($0)! }
        N = input[0]
        M = input[1]
        
        var numberPool: [Int] = []
        for index in 1...N {
            numberPool.append(index)
        }
        
        let result = permutation(numberPool, M)
        result.forEach {
            $0.forEach {
                print($0, terminator: " ")
            }
            print()
        }
    }
    
    func permutation(_ array: [Int], _ count: Int) -> [[Int]] {
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
}
