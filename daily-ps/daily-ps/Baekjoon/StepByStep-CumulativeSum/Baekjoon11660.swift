//
//  Baekjoon11660.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/12/15.
//

import Foundation

final class Baekjoon11660 {
    func run() {
        let inputs = readLine()!.split(separator: " ").map{ Int($0)! }
        
        solution(inputs[0], inputs[1]).forEach {
            print($0)
        }
    }
    
    func solution(_ n: Int, _ m: Int) -> [Int] {
        var map: [[Int]] = []
        var result: [Int] = []
        for _ in 0..<n {
            map.append(readLine()!.split(separator: " ").map{ Int($0)! })
        }
        let sums = cumulativeSum(map)
        for _ in 0..<m {
            let inputs = readLine()!.split(separator: " ").map{ Int($0)! }
            let start = (inputs[0] - 1, inputs[1] - 1)
            let end = (inputs[2], inputs[3])

            result.append(
                sums[end.0][end.1] - (sums[end.0][start.1] + sums[start.0][end.1]) + sums[start.0][start.1]
            )
        }
        return result
    }
    
    func cumulativeSum(_ map: [[Int]]) -> [[Int]] {
        var sums: [[Int]] = [Array(repeating: 0, count: map.count + 1)]
        
        for row in 0..<map.count {
            var sum = 0
            var rowSum = [0]
            for col in 0..<map.count {
                sum += map[row][col]
                rowSum.append(sum)
            }
            sums.append(rowSum)
        }
        
        for col in 1...map.count {
            for row in 1...map.count {
                sums[row][col] += sums[row - 1][col]
            }
        }
        
        return sums
    }
}
