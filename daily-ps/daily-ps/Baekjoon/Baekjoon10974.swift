//
//  Baekjoon10974.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/07/21.
//

import Foundation

//let testInput = 3
final class Baekjoon10974: Baekjoon {
    override func run() {
        let number: Int = Int(readLine()!)!
        var numberPool: [Int] = []
        for index in 0..<number {
            numberPool.append((index + 1))
        }
        
        let result: [[Int]] = permutation(numberPool, count: number)
        result.forEach {
            $0.forEach { num in
                print(num, terminator: " ")
            }
            print("")
        }
    }
    
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
}
