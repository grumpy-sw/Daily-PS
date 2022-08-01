//
//  Baekjoon1149.swift
//  daily-ps
//
//  Created by 박세웅 on 2022/08/01.
//

import Foundation

final class Baekjoon1149 {
    var map: [[Int]] = []
    var costs: [[Int]] = []
    func run() {
        let length = Int(readLine()!)!
        for _ in 0..<length {
            let oneLineCosts = readLine()!.split(separator: " ").map{ Int($0)! }
            costs.append(oneLineCosts)
        }
        
        map = Array(repeating: Array(repeating: 0, count: 3), count: length)
        
        solution()
    }
    
    func solution() {
        map[0] = costs[0]
        for index in 1..<map.count {
            fillTheMap(at: index)
        }
        print(minimumNumber(from: map[map.count-1]))
    }
    
    // 1번 집: min(costs[0][0], costs[0][1], costs[0][2])
    // 2번 집: min(min(map[0][1], map[0][2]) + costs[1][0], min(map[0][0], map[0][2]) + costs[1][1], min(map[0][0], map[0][1]) + costs[1][2])
    // N번 집: min(min(map[N-2][1], map[N-2][2]) + costs[N-1][0], min(map[N-2][0], map[N-2][2]) + costs[N-1][1], min(map[N-2][0], map[N-2][1]) + costs[N-1][2])
    func fillTheMap(at index: Int) {
        map[index][0] = min(map[index-1][1], map[index-1][2]) + costs[index][0]
        map[index][1] = min(map[index-1][0], map[index-1][2]) + costs[index][1]
        map[index][2] = min(map[index-1][0], map[index-1][1]) + costs[index][2]
    }
    
    func minimumNumber(from array: [Int]) -> Int {
        var result = Int.max
        array.forEach {
            if $0 < result {
                result = $0
            }
        }
        return result
    }
}
