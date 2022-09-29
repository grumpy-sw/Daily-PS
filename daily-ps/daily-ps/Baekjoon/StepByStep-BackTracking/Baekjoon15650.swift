//
//  Baekjoon15650.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/09/29.
//

import Foundation

final class Baekjoon15650 {
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
        
        let result = combination(numberPool, count: M)
        
        result.forEach {
            $0.forEach {
                print($0, terminator: " ")
            }
            print()
        }
    }
    
    func combination(_ array: [Int], count: Int) -> [[Int]] {
        var result = [[Int]]()
        
        func pick(_ now: [Int], offset: Int) {
            if now.count == count {
                result.append(now)
                return
            }
            
            for index in offset..<array.count {
                pick(now + [array[index]], offset: index+1)
            }
        }
        
        pick([], offset: 0)
        return result
    }
}
